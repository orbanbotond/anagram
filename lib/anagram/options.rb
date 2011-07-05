require 'optparse'

class Options
  attr_reader :dictionary
  attr_reader :words

  def initialize args
    @dictionary = '/usr/share/dict/words'

    parser = OptionParser.new do |opts|
      opts.banner = "Usage:  anagram [ options ]  word..."

      opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
        @dictionary = dict
      end

      opts.on("-h", "--help", "Show help message") do
        puts opts
        exit
      end
    end

    begin
      args << "-h" if args.empty?
      parser.parse! args
      @words = args
    rescue OptionParser::ParseError => e
      STDERR.puts e.message, "\n", parser
      exit(-1)
    end

  end
end
