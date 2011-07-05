class Anagram
  attr_reader :anagrams
  def initialize dictfile, words
    raise RuntimeError.new if words.nil?
    raise RuntimeError.new if dictfile.nil?
    @signatures = Hash.new
    @anagrams = Hash.new
    calculate dictfile, words
  end

  def calculate dictfile, words
    calculate_signatures dictfile
    
    words.each do |word|
      signature = signature_of(word)
      @anagrams[word] = @signatures[signature]
    end
  end
  
  def calculate_signatures dictfile
    File.foreach(dictfile) do |line|
      word = line.chomp
      signature = signature_of(word)
      (@signatures[signature] ||= []) << word
    end 
  end
private  
  def signature_of(word)
    word.unpack("c*").sort.pack("c*")
  end

end