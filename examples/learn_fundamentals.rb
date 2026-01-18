#!/usr/bin/env ruby

# Example: Learning Fundamentals
# This script demonstrates how to learn DSA fundamentals programmatically

require_relative '../lib/dsa_visualizer'

puts "=" * 80
puts "DSA VISUALIZER - Learning Fundamentals Example".center(80)
puts "=" * 80
puts "\nThis example will teach you the 4 fundamental concepts:"
puts "  1. Time & Space Complexity"
puts "  2. Memory Management"
puts "  3. Pointers & References"
puts "  4. Recursion Basics"
puts "\nPress Enter to start..."
gets

# Learn each fundamental topic
fundamentals = [
  { key: :complexity_basics, name: "Time & Space Complexity" },
  { key: :memory_basics, name: "Memory Management" },
  { key: :pointers_basics, name: "Pointers & References" },
  { key: :recursion_basics, name: "Recursion Basics" }
]

fundamentals.each_with_index do |topic, index|
  puts "\n\n"
  puts "=" * 80
  puts "TOPIC #{index + 1}/4: #{topic[:name]}".center(80)
  puts "=" * 80
  puts "\nPress Enter to continue..."
  gets
  
  # Learn the topic
  DSAVisualizer.learn(topic[:key])
  
  puts "\n\n✅ Completed: #{topic[:name]}"
  puts "\nPress Enter to continue to next topic..."
  gets unless index == fundamentals.length - 1
end

puts "\n\n"
puts "=" * 80
puts "🎉 CONGRATULATIONS! 🎉".center(80)
puts "=" * 80
puts "\nYou've completed all fundamental topics!"
puts "\nNext steps:"
puts "  1. Review the notes and key points"
puts "  2. Practice the problems provided"
puts "  3. Move on to Basic Data Structures (Section 2)"
puts "\nTo continue learning, run:"
puts "  ruby -Ilib bin/dsa_visualizer"
puts "\nOr learn specific topics:"
puts "  DSAVisualizer.learn(:array)"
puts "  DSAVisualizer.learn(:linked_list)"
puts "  DSAVisualizer.learn(:stack)"
puts "\nHappy Learning! 🚀"
