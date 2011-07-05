# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "anagram/version"

Gem::Specification.new do |s|
  s.name        = "anagram"
  s.version     = Anagram::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Orban Botond based on Dave Thomas"]
  s.email       = ["orbanbotond@logicoptimum.com"]
  s.homepage    = "http://www.logicoptimum.com"
  s.summary     = %q{small anagram}
  s.description = %q{hm... just anagram}

  s.rubyforge_project = "anagram"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
