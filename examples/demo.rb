#!/usr/bin/env ruby

require_relative '../lib/dsa_visualizer'

puts "DSA Visualizer - Interactive Demo"
puts "=" * 80
puts "\nAvailable demos:"
puts "  1. Array"
puts "  2. Linked List"
puts "  3. Stack"
puts "  4. Queue"
puts "  5. Hash Table"
puts "  6. Binary Tree"
puts "  7. Sorting Algorithms"
puts "  8. Searching Algorithms"
puts "  9. Run All"
puts "  0. Exit"

print "\nSelect a demo (0-9): "
choice = gets.chomp.to_i

case choice
when 1
  DSAVisualizer.demo(:array)
when 2
  DSAVisualizer.demo(:linked_list)
when 3
  DSAVisualizer.demo(:stack)
when 4
  DSAVisualizer.demo(:queue)
when 5
  DSAVisualizer.demo(:hash_table)
when 6
  DSAVisualizer.demo(:binary_tree)
when 7
  DSAVisualizer.demo(:sorting)
when 8
  DSAVisualizer.demo(:searching)
when 9
  [:array, :linked_list, :stack, :queue, :hash_table, :binary_tree, :sorting, :searching].each do |concept|
    DSAVisualizer.demo(concept)
    puts "\n\nPress Enter to continue..."
    gets
  end
when 0
  puts "Goodbye!"
else
  puts "Invalid choice!"
end
