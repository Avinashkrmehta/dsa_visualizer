#!/usr/bin/env ruby

# Example: Comparing Ruby and C++ implementations
# This demonstrates the language comparison feature

require_relative '../lib/dsa_visualizer'

puts "=" * 80
puts "Ruby vs C++ Comparison Example".center(80)
puts "=" * 80

puts "\n📚 This example shows how DSA Visualizer compares Ruby and C++"
puts "   implementations for the same data structure or algorithm."
puts "\nWe'll look at Arrays to see the differences..."
puts "\nPress Enter to continue..."
gets

# Learn about arrays with Ruby vs C++ comparison
DSAVisualizer.learn(:array)

puts "\n\n" + "=" * 80
puts "Key Takeaways from Ruby vs C++ Comparison".center(80)
puts "=" * 80

puts "\n🔵 RUBY:"
puts "  ✓ High-level, easy to use"
puts "  ✓ Automatic memory management (Garbage Collection)"
puts "  ✓ Dynamic typing and sizing"
puts "  ✓ Slower performance (overhead from abstractions)"
puts "  ✓ Safer (bounds checking, no manual memory management)"

puts "\n🟢 C++:"
puts "  ✓ Low-level, more control"
puts "  ✓ Manual memory management (new/delete)"
puts "  ✓ Static typing, fixed or dynamic sizing"
puts "  ✓ Faster performance (direct memory access)"
puts "  ✓ More dangerous (buffer overflows, memory leaks possible)"

puts "\n💡 When to use each:"
puts "\n  Use Ruby when:"
puts "    • Rapid development is priority"
puts "    • Safety and ease of use matter more than raw speed"
puts "    • Building web applications, scripts, prototypes"

puts "\n  Use C++ when:"
puts "    • Performance is critical"
puts "    • Working with system-level programming"
puts "    • Building games, embedded systems, high-frequency trading"

puts "\n\nTry other topics to see more comparisons:"
puts "  DSAVisualizer.learn(:linked_list)"
puts "  DSAVisualizer.learn(:stack)"
puts "  DSAVisualizer.learn(:binary_tree)"
