---
title: Multiple Foreign Keys
---

I'd like to document a problem that I've never had before, and the solution
I arrived at. It was not a real complicated problem, but I got hung up on an
even simpler problem.

Say I want to store directories in the database, and the files within those
directories in an associated table. The actual problem is much more specific,
but I've made it generic. Here are some sample entries:

Directories:

    id: 1, name: home
    id: 2, name: example

Files:

    a_dir_id: 1, filename: 'test', content: 'some content'

Looking at this, it seemed fairly basic. The catch was that the
directory id and filename would have to be a composite primary key, which I
haven't really used all that much. On top of that, the directory id also needs
to be a foreign key. I read a bit and decided that this was probably doable,
so this is where I got to:

```ruby
require 'data_mapper'
DataMapper.setup(:default, 'mysql://root@127.0.0.1/sample')

class ADir
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :unique => true
  has n, :a_files
end

class AFile
  include DataMapper::Resource
  property :a_dir_id, Integer, :key => true
  property :filename, String, :key => true
  property :content, Text
  belongs_to :a_dir
end

DataMapper.auto_migrate!
```

Running this, I ended up with this cryptic error:

    ...Can't create table 'sample.#sql-1ed_113' (errno: 150) (DataObjects::SQLError)

It was not a helpful error message. I assumed that what I was trying was simply
not possible, but I blazed through and started writing the raw SQL to acheive
what I wanted, and it turns out that it certainly is possible in MySQL.

After many rabbit trails, it dawned on me that `Serial` columns are unsigned and
`Integer` columns are not. Adding a `:min` argument to this one line made it
work like a charm:

    property :a_dir_id, Integer, :min => 0, :key => true

Success!!
