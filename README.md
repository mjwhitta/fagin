# Fagin

<a href="https://www.buymeacoffee.com/mjwhitta">🍪 Buy me a cookie</a>

## What is this?

This ruby gem allows you to dynamically `require` children classes.
This allows developers to write ruby gems which allow users to extend
the default functionality via custom classes.

## How to install

```
$ gem install fagin
```

## Usage

```ruby
require "fagin"

children = Fagin.find_children("ParentClass", "/path/to/dir")

children.each do |child_class_name, child_obj|
    ... # do stuff here
end
```

## Why the name fagin?

It's an [Oliver Twist](https://en.wikipedia.org/wiki/Fagin) reference.

## Links

- [Source](https://github.com/mjwhitta/fagin)
- [RubyGems](https://rubygems.org/gems/fagin)

## TODO

- Better README
- RDoc
