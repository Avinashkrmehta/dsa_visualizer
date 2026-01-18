module DSAVisualizer
  module Fundamentals
    class Recursion
      def self.learn
        Visualizer.print_header("RECURSION - Function Calling Itself")
        
        puts "\n📖 WHAT IS RECURSION?".colorize(:cyan).bold
        puts "─" * 80
        puts "Recursion is when a function calls itself to solve a problem"
        puts "by breaking it down into smaller subproblems."
        
        Visualizer.print_section("1. Basic Recursion Example")
        
        ruby_code = <<~RUBY
          def factorial(n)
            return 1 if n <= 1  # Base case
            n * factorial(n - 1)  # Recursive case
          end
          
          factorial(5)
          # 5 * factorial(4)
          # 5 * 4 * factorial(3)
          # 5 * 4 * 3 * factorial(2)
          # 5 * 4 * 3 * 2 * factorial(1)
          # 5 * 4 * 3 * 2 * 1 = 120
        RUBY
        
        cpp_code = <<~CPP
          int factorial(int n) {
            if(n <= 1) return 1;  // Base case
            return n * factorial(n - 1);  // Recursive
          }
          
          factorial(5);
          // Call stack grows then unwinds
          // Space: O(n) due to call stack
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Both use call stack. Each recursive call adds a stack frame. Must have base case to stop!")
        
        notes = [
          "Every recursion needs a base case (stopping condition)",
          "Recursive case must progress toward base case",
          "Space complexity: O(n) for call stack depth n",
          "Can cause stack overflow if too deep",
          "Some recursions can be optimized with tail call optimization",
          "Iterative solutions often more efficient (no stack overhead)"
        ]
        NotesManager.print_notes("Recursion", notes)
        
        key_points = [
          "Recursion = function calling itself",
          "Base case prevents infinite recursion",
          "Call stack stores each recursive call",
          "Useful for tree/graph traversal, divide-and-conquer",
          "Trade-off: elegant code vs stack space"
        ]
        NotesManager.print_key_points(key_points)
      end
    end
  end
end
