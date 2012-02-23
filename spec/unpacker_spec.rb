require "spec_helper"

describe MessagePack::Unpacker do
  it "unpacks arrays" do
    bytes = org.msgpack.MessagePack.new.write(["a", "b", "c"])

    subject.feed(bytes)
    subject.first.should == ["a", "b", "c"]
  end

  it "unpacks booleans" do
    bytes = org.msgpack.MessagePack.new.write(true)

    subject.feed(bytes)
    subject.first.should == true
  end

  it "unpacks floats" do
    bytes = org.msgpack.MessagePack.new.write(3.1415)

    subject.feed(bytes)
    subject.first.should == 3.1415
  end

  it "unpacks integers" do
    bytes = org.msgpack.MessagePack.new.write(12345)

    subject.feed(bytes)
    subject.first.should == 12345
  end

  it "unpacks maps" do
    bytes = org.msgpack.MessagePack.new.write("foo" => "bar")

    subject.feed(bytes)
    subject.first.should == {"foo" => "bar"}
  end

  it "unpacks nils" do
    bytes = org.msgpack.MessagePack.new.write(nil)

    subject.feed(bytes)
    subject.first.should == nil
  end

  it "unpacks strings" do
    bytes = org.msgpack.MessagePack.new.write("abc123")

    subject.feed(bytes)
    subject.first.should == "abc123"
  end

  it "unpacks strings with binary data" do
    bytes = org.msgpack.MessagePack.new.write("\xC0abc\x00".to_java_bytes)

    subject.feed(bytes)
    subject.first.should == "\xC0abc\x00"
  end
end
