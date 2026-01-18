#!/usr/bin/env ruby

# Example: Custom Learning Path
# Create your own curriculum based on your goals

require_relative '../lib/dsa_visualizer'

puts "=" * 80
puts "Custom Learning Path Example".center(80)
puts "=" * 80

puts "\n📚 Choose your learning path:\n"
puts "1. Interview Preparation (Most Common Topics)"
puts "2. Web Development Focus"
puts "3. Algorithms Competition"
puts "4. System Programming"
puts "\nEnter your choice (1-4): "

choice = gets.chomp.to_i

learning_paths = {
  1 => {
    name: "Interview Preparation",
    topics: [
      :array, :linked_list, :stack, :queue,
      :hash_table, :binary_tree, :bst,
      :bubble_sort, :merge_sort, :quick_sort,
      :binary_search, :bfs, :dfs,
      :dp_intro, :dp_fibonacci
    ]
  },
  2 => {
    name: "Web Development Focus",
    topics: [
      :complexity_basics, :array, :hash_table,
      :stack, :queue, :binary_search,
      :bubble_sort, :merge_sort
    ]
  },
  3 => {
    name: "Algorithms Competition",
    topics: [
      :complexity_basics, :array, :linked_list,
      :stack, :queue, :hash_table,
      :binary_tree, :bst, :heap,
      :graph_representation, :bfs, :dfs,
      :dijkstra, :dp_intro, :dp_fibonacci,
      :knapsack, :union_find
    ]
  },
  4 => {
    name: "System Programming",
    topics: [
      :memory_basics, :pointers_basics,
      :array, :linked_list, :stack, :queue,
      :hash_table, :binary_tree,
      :merge_sort, :quick_sort, :binary_search
    ]
  }
}

path = learning_paths[choice]

if path.nil?
  puts "Invalid choice!"
  exit
end

puts "\n✅ Selected: #{path[:name]}"
puts "Topics to cover: #{path[:topics].length}"
puts "\nPress Enter to start..."
gets

path[:topics].each_with_index do |topic, index|
  puts "\n\n" + "=" * 80
  puts "Topic #{index + 1}/#{path[:topics].length}: #{topic}".center(80)
  puts "=" * 80
  puts "\nPress Enter to learn (or 's' to skip)..."
  
  input = gets.chomp.downcase
  next if input == 's'
  
  DSAVisualizer.learn(topic)
  
  puts "\n✅ Completed: #{topic}"
  puts "\nPress Enter to continue..."
  gets unless index == path[:topics].length - 1
end

puts "\n\n" + "=" * 80
puts "🎉 Learning Path Completed! 🎉".center(80)
puts "=" * 80
puts "\nYou've finished the #{path[:name]} path!"
puts "\nNext steps:"
puts "  • Review and practice"
puts "  • Solve real problems on LeetCode/HackerRank"
puts "  • Build projects using these concepts"
puts "\nKeep learning! 🚀"
