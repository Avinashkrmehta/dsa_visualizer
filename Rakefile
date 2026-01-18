require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc "Run a demo"
task :demo, [:concept] do |t, args|
  require_relative 'lib/dsa_visualizer'
  concept = args[:concept] || 'array'
  DSAVisualizer.demo(concept.to_sym)
end

desc "Run all demos"
task :demo_all do
  require_relative 'lib/dsa_visualizer'
  [:array, :linked_list, :stack, :queue, :hash_table, :binary_tree, :sorting, :searching].each do |concept|
    DSAVisualizer.demo(concept)
    puts "\n" + "=" * 80 + "\n"
  end
end
