require 'minitest/autorun'
require_relative "../lib/anagram/options"
 
describe Options do
  before do
    @options = Options.new ["dummyword"]
  end

  describe "The dictionary file" do
    it "should be initially '/usr/share/dict/words'" do
      @options.dictionary.must_equal '/usr/share/dict/words'
    end
    it "should be the specified one" do
      @options = Options.new ["-d", "custom"]
      @options.dictionary.must_equal 'custom'
    end
    it "should be the specified one" do
      @options = Options.new ["--dict", "custom2"]
      @options.dictionary.must_equal 'custom2'
    end
  end
  describe "specified word" do
    it "should contains the words" do
      @options.words.include?('dummyword').must_equal true
    end
    it "should contains every passed word" do
      @options = Options.new ["word1", "word2", "word3"]
      @options.words.include?('word1').must_equal true
      @options.words.include?('word2').must_equal true
      @options.words.include?('word3').must_equal true
    end
  end
  #  
  # describe "when asked about blending possibilities" do
  #   it "won't say no" do
  #     @meme.does_it_blend?.wont_match /^no/i
  #   end
  # end
end
