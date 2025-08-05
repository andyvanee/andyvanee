---
title: "WASM Up and Running"
date: 2025-06-21T10:07:06-06:00
url: /2025/06/21/wasm-baby-steps/index.html
---

I've finally had some time to pick up WebAssembly a bit more seriously and get some real work done with it. I've found that it's better than expected in some ways, but has it's challenges. Lets dive in!

This article is about "raw" WebAssembly (WASM) and WebAssembly System Interface (WASI) rather than a full runtime like emscripten. Nothing against emscripten, but my first experience with it seemed like a lot of "magic" incantations. I wanted to have a firm grasp of the entire system at the binary level. For this experiment, I'm using clang/LLVM on it's own to compile a C module to a WASM targets.

### Rendering to a canvas

When interfacing to a WASM module, you're basically dealing with numbers. You've either got numeric parameters or return types, or pointers to binary blobs of data. What I've found makes a lot of sense (for starters) is to deal entirely with statically allocated memory arenas in C.

In this example, I'm using a static memory arena of size `width * height * rgba` - in my case this is `640 * 480 * 4` or roughly 1.2 megabytes. All the state is handled in C, which keeps things pretty simple on the client side.

```ts
// createImageData to render into
const ctx = canvas.getContext("2d") as CanvasRenderingContext2D;
const imageData = ctx.createImageData(width, height);

// instantiate the module
const { run, memory } = await loadWasm("/client.wasm");

// The reset function returns a pointer to the "screen" memory arena
const memPtr: number = run.reset();
const screenData = new Uint8ClampedArray(
  memory.buffer,
  memPtr,
  width * height * 4
);

function render() {
  run.render();
  imageData.data.set(screenData);
  requestAnimationFrame(render);
}
```

On the C/WASM side, there are two exported functions, but basically everything is done via the statically allocated `memory` arena.

```c
#define __wasi__

// Macro for making functions "public" in WASM
#define export(NAME) __attribute__((visibility("default"), export_name(NAME)))

#define WIDTH 640
#define HEIGHT 480
uint8_t memory[WIDTH * HEIGHT * 4];

export("reset") uint8_t* reset() {
  printf("Resetting WASM\n");
  setup();
  memset(memory, 0, sizeof(memory));
  return memory;
}

export("render") void render() {
  update();
  draw();
}
```

### Bit banging graphics

I have not included the setup/update/draw functions here, but they are basically manipulating the RGBA pixel data in `memory` as you might expect. As an example though, here is the `rect()` drawing function.

```c
void rect(int x, int y, int width, int height, uint32_t color) {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int pixel_index = ((x + i) + (y + j) * WIDTH) * 4;
      if (pixel_index >= 0 && pixel_index < WIDTH * HEIGHT * 4) {
        memory[pixel_index + 0] = color >> 24 & 0xFF;  // Red channel
        memory[pixel_index + 1] = color >> 16 & 0xFF;  // Green channel
        memory[pixel_index + 2] = color >> 8 & 0xFF;   // Blue channel
        memory[pixel_index + 3] = color & 0xFF;        // Alpha channel
      }
    }
  }
}
```

It's a bit crude, but it gets the job done. I'm not using any libraries yet since it adds a lot of complexity to compile and statically link most packages, and most depend on a lot more of the system interfaces than I have stubbed out thus far.

### A note on WASI

I have (deliberately) omitted the CLI arguments to actually compile this stuff, since it's pretty arcane and likely to be outdated already. For those interested in digging further, you need a very recent clang/LLVM with WASM support as well as an up to date WASI/sysroot to compile against.

```sh
/opt/homebrew/Cellar/llvm/20.1.5/bin/clang --target=wasm32 -nostdlib -O3 -I/opt/homebrew/Cellar/wasi-libc/25/share/wasi-sysroot/include/wasm32-wasi -Wl,--no-entry -Wl,--export-all -Wl,--import-memory -lc -L/opt/homebrew/Cellar/wasi-libc/25/share/wasi-sysroot/lib/wasm32-wasi -o client.wasm client.c
```

When running from `bun` I've found that `node:wasi` gives you pretty much everything you need, but on the browser side, you're pretty much on your own. Although some packages seemed promising, every one I tried had different issues so I rolled my own. It has meant writing three methods from `wasi_snapshot_preview1` - two file-access methods for being able to write to `stdout` and one time-related method so I could use `srand(time(NULL))`.

I'm sure there's something I can repurpose for this in `emscripten` or elsewhere, but it has been interesting to implement only the parts of WASI that I'm actually using.

### Next steps

As I hinted at, dealing with interop between C<->TS using pointers an structs is a bit unwieldy. I'm currently working on `stdint.ts` which adds some types and readers/writers for dealing with common data types.

```ts
const reader = new DataReader(dataView, readPtr);
const width = reader.read("uint16_t");
const height = reader.read("int");
```
