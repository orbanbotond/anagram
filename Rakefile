require 'bundler'
Bundler::GemHelper.install_tasks

task :default => [:test]

desc "Run all the tests against the gem"
task :test do
  ruby "test/test_anagram.rb"
  ruby "test/test_options.rb"
end
