require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "nichy/rps"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :run do
  game = Nichy::Rps::RPS.new
  game.play
end
