require File.join(File.dirname(__FILE__), "type_mapper")

module MessagePack
  class Unpacker
    include Enumerable

    def initialize
      @msgpack  = org.msgpack.MessagePack.new
      @unpacker = org.msgpack.unpacker.MessagePackBufferUnpacker.new(@msgpack)
      @mapper   = TypeMapper.new
    end

    def feed(bytes)
      if bytes.respond_to?(:to_java_bytes)
        @unpacker.feed(bytes.to_java_bytes)
      else
        @unpacker.feed(bytes)
      end
    end

    def each
      @unpacker.each do |mpo|
        yield @mapper.to_ruby_object(mpo)
      end
    end
  end
end
