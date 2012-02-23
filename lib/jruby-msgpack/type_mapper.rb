module MessagePack
  class TypeMapper
    def to_ruby_object(message_pack_object)
      case message_pack_object.type
      when org.msgpack.type.ValueType::ARRAY
        message_pack_object.asArrayValue.elementArray.map { |o| to_ruby_object(o) }
      when org.msgpack.type.ValueType::BOOLEAN
        message_pack_object.asBooleanValue.getBoolean
      when org.msgpack.type.ValueType::FLOAT
        message_pack_object.asFloatValue.getDouble
      when org.msgpack.type.ValueType::INTEGER
        message_pack_object.asIntegerValue.getLong
      when org.msgpack.type.ValueType::MAP
        Hash[message_pack_object.asMapValue.map { |k, v| [to_ruby_object(k), to_ruby_object(v)] }]
      when org.msgpack.type.ValueType::NIL
        nil
      when org.msgpack.type.ValueType::RAW
        String.from_java_bytes(message_pack_object.asRawValue.byteArray)
      end
    end
  end
end
