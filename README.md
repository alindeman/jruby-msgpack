# jruby-msgpack

[![Build Status](https://secure.travis-ci.org/alindeman/jruby-msgpack.png)](http://travis-ci.org/alindeman/jruby-msgpack)

Helps bridge that gap between the native Java msgpack library and JRuby!

Implemented:
* `MessagePack::Unpacker`

## Installation

Add this line to your application's Gemfile:

    gem 'jruby-msgpack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jruby-msgpack

## Usage

### Unpacking a File (or Other IO)

```ruby
require "jruby-msgpack"

unpacker = MessagePack::Unpacker.new
File.open("/my/file.mpac", "r") do |io|
  begin
    buffer = ""
    while io.sysread(1024, buffer)
      unpacker.feed(buffer)

      unpacker.each do |obj|
        puts obj
      end
    end
  rescue EOFError
    # EOF reached
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
