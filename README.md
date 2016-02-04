TermNote
--------

TermNote is a program that allows you to write presentations either in Ruby:

``` ruby
require 'termnote'

include TermNote

show.add chapter title: "Hello, World"
show.add code language: "ruby", source: <<-SOURCE
  puts "Hello, world!"
SOURCE
show.start
```
Or via a `.yaml` file:

``` yaml
---
type: chapter
title: Hello, World
subtitle: By Kurtis
---
type: code
source: |
  puts "Hello, world!"
```

and then with the `termnote` binary:

``` shell
$ termnote someshow.yml
```

Here's an example of the slides in use:

![Chapter](https://raw.github.com/krainboltgreene/termnote/master/example/chapter.png)
![Text](https://raw.github.com/krainboltgreene/termnote/master/example/text.png)
![List](https://raw.github.com/krainboltgreene/termnote/master/example/list.png)
![Code](https://raw.github.com/krainboltgreene/termnote/master/example/code.png)

You can then use **j** or **k** to navigate through the slides.

Installation
============

Install it yourself via:

    $ gem install termnote


Usage
=====

Usage is pretty simple, there are 4 types of slides:

  * Chapter, a single `title` [optional: and `subtitle`]
  * Text, a blob of text called `content` [optional: and `title`]
  * List, a list of `items` [optional: and `title`]
  * Code, a syntax highlighted blob called `source`

You can change the way things are printed out by overriding the classes for
your specific presentation, but only if you do things programatically.

Ruby Usage Examples
=============

**Add a title slide**

```ruby
show.add chapter title: "Title Slide"
```

**Add a text slide**

```ruby
show.add text title: "Content Title", content: "content blob"
```

**Add a list slide**

```ruby
show.add list title: "title", items: ["item 1", "item 2", "item 3"]
```

**Add a slide with code**

```ruby
show.add code language: "ruby", source: <<-SOURCE
  def method
    awesome = true
  end
SOURCE
```

Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

Contributors
============

  - [Halan Pinheiro](https://github.com/halan)
  - [Jessie A. Young](https://github.com/jessieay)
  - [Miles Z. Sterrett](https://github.com/mileszs)
