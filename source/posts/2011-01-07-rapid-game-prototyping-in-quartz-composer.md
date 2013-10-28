---
title: Rapid Game Prototyping in Quartz Composer
---
I am a Quartz Composer junky. I love tinkering with ideas and hacking together logic gates within this kind of visual programming environment.

I think this it's the best way to teach core CS techniques that are often obscured in text-based code. Things like logic gates, the value of modularity, and application structure start to really make sense when you lay them out visually. It's like a UML diagram that functions and evaluates in real-time.

As an example, I will use a game-idea I had, and how I quickly mocked it up in Quartz Composer. It's called "Stellar Debris", and the point of the prototype is to demonstrate vertical parallax motion in a 2D game (like the background scrolling in Canabalt).

The storyline is that your character is a flying robot(spaceship?) that takes off from the surface and must make it through the layer of orbiting debris in a post-apocalyptic earth. The controls are very basic, click to takeoff, mouse back and forth to move and click to shoot.

Here's the start screen. The graphics are very rudimentary (prototype remember!).
<div class="separator" style="clear: both; text-align: center;">[![](http://3.bp.blogspot.com/_ZApMPFF0N4c/TSdxTfHERcI/AAAAAAAABH4/JyBV3W7qbzU/s320/Screen%2Bshot%2B2011-01-07%2Bat%2B1.01.50%2BPM.png)](http://3.bp.blogspot.com/_ZApMPFF0N4c/TSdxTfHERcI/AAAAAAAABH4/JyBV3W7qbzU/s1600/Screen%2Bshot%2B2011-01-07%2Bat%2B1.01.50%2BPM.png)</div>

Once you click, the character takes off and you can control his motion and fire bullets.
<div class="separator" style="clear: both; text-align: center;">[![](http://1.bp.blogspot.com/_ZApMPFF0N4c/TSdx3k7Fa_I/AAAAAAAABIA/QgbL0WU524Y/s320/Screen%2Bshot%2B2011-01-07%2Bat%2B1.03.45%2BPM.png)](http://1.bp.blogspot.com/_ZApMPFF0N4c/TSdx3k7Fa_I/AAAAAAAABIA/QgbL0WU524Y/s1600/Screen%2Bshot%2B2011-01-07%2Bat%2B1.03.45%2BPM.png)</div>

You'll notice the foreground has scrolled off screen already and there are blocks to shoot. The background scrolls much slower, and the sky doesn't scroll at all. It also gets darker as you ascend into the atmosphere.
<div class="separator" style="clear: both; text-align: center;">[![](http://1.bp.blogspot.com/_ZApMPFF0N4c/TSd0bTyu6kI/AAAAAAAABII/kSi4zXp1yM0/s320/Screen%2Bshot%2B2011-01-07%2Bat%2B1.14.41%2BPM.png)](http://1.bp.blogspot.com/_ZApMPFF0N4c/TSd0bTyu6kI/AAAAAAAABII/kSi4zXp1yM0/s1600/Screen%2Bshot%2B2011-01-07%2Bat%2B1.14.41%2BPM.png)</div>

### Game Logic

I don't think I would want to build an entire game in Quartz Composer. But having a mockup like this is great for prototyping because most of the game logic is there in a clear modular structure, which makes it a great starting point for porting it to your programming language of choice. Here's a look at the patches involved in making this "game" happen.
<div class="separator" style="clear: both; text-align: center;">[![](http://2.bp.blogspot.com/_ZApMPFF0N4c/TSd15vRWBJI/AAAAAAAABIQ/HkUsEsywbV4/s320/Screen%2Bshot%2B2011-01-07%2Bat%2B1.18.04%2BPM.png)](http://2.bp.blogspot.com/_ZApMPFF0N4c/TSd15vRWBJI/AAAAAAAABIQ/HkUsEsywbV4/s1600/Screen%2Bshot%2B2011-01-07%2Bat%2B1.18.04%2BPM.png)</div>

Rather than coding blindly, many of the logic bits required for gameplay are already in place. Things like "the bullet needs to know the character's position at the time of firing" or "each 2D layer needs to know the absolute position and multiply it by some factor" or even "the clouds look good enough as a blurred semi-opaque sprite".
