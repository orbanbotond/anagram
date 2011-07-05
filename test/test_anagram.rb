require 'minitest/autorun'
require_relative "../lib/anagram/anagram"

describe "Anagram" do
  before do
    @dictfile = "/usr/share/dict/words"
  end
  describe "Invalid params" do
    it "should raise for the nil input" do
      proc { Anagram.new nil, ["word"] }.must_raise RuntimeError
      proc { Anagram.new "dictfile", nil }.must_raise RuntimeError
    end
    it "should return an empty array if for the empty input" do
      a = Anagram.new @dictfile, []
      a.anagrams.must_be_empty
    end
  end
  describe "calculate anagram" do
    before do
      @input = ["horse"]
      @anagram = Anagram.new @dictfile, @input
    end
    it "should contain the same size return" do
      @anagram.anagrams.size.must_equal @input.size
    end
    it "should return the right anagrams" do
      @anagram.anagrams[@input.first].must_equal ["horse","shoer", "shore"]
    end
  end
end
