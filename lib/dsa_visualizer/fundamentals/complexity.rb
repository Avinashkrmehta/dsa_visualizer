module DSAVisualizer
  module Fundamentals
    class Complexity
      def self.learn
        Visualizer.print_header("TIME & SPACE COMPLEXITY - Foundation of Algorithm Analysis")
        
        # Introduction
        puts "\n📖 WHAT IS COMPLEXITY ANALYSIS?".colorize(:cyan).bold
        puts "─" * 80
        puts "Complexity analysis helps us understand how an algorithm's performance"
        puts "scales with input size. We measure two things:"
        puts "  1. Time Complexity - How execution time grows"
        puts "  2. Space Complexity - How memory usage grows"
        
        # Big O Notation
        Visualizer.print_section("1. Big O Notation")
        puts "\nBig O describes the upper bound (worst case) of algorithm growth."
        puts "\nCommon Time Complexities (from best to worst):"
        
        complexities = [
          ["O(1)", "Constant", "Array access, hash lookup"],
          ["O(log n)", "Logarithmic", "Binary search, balanced tree ops"],
          ["O(n)", "Linear", "Array traversal, linear search"],
          ["O(n log n)", "Linearithmic", "Merge sort, quick sort (avg)"],
          ["O(n²)", "Quadratic", "Bubble sort, nested loops"],
          ["O(n³)", "Cubic", "Triple nested loops"],
          ["O(2ⁿ)", "Exponential", "Recursive fibonacci, subsets"],
          ["O(n!)", "Factorial", "Permutations, traveling salesman"]
        ]
        
        complexities.each do |notation, name, example|
          puts "  #{notation.ljust(12)} #{name.ljust(15)} → #{example}".colorize(:light_blue)
        end
        
        # Visual Growth Comparison
        Visualizer.print_section("2. Growth Rate Visualization")
        puts "\nFor n = 100:"
        puts "  O(1)      = 1 operation"
        puts "  O(log n)  = 7 operations"
        puts "  O(n)      = 100 operations"
        puts "  O(n log n)= 700 operations"
        puts "  O(n²)     = 10,000 operations"
        puts "  O(2ⁿ)     = 1,267,650,600,228,229,401,496,703,205,376 operations 💥"
        
        # Example 1: O(1) - Constant Time
        Visualizer.print_section("3. Example: O(1) - Constant Time")
        
        ruby_code = <<~RUBY
          def get_first_element(arr)
            arr[0]  # Always 1 operation
          end
          
          # Time: O(1)
          # No matter if array has 10 or 10,000 elements
        RUBY
        
        cpp_code = <<~CPP
          int getFirstElement(int arr[]) {
            return arr[0];  // Direct memory access
          }
          
          // Time: O(1)
          // Single memory read operation
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code, 
          "Both are O(1). Array indexing is constant time in both languages.")
        
        # Example 2: O(n) - Linear Time
        Visualizer.print_section("4. Example: O(n) - Linear Time")
        
        ruby_code = <<~RUBY
          def find_max(arr)
            max = arr[0]
            arr.each do |num|  # Loop runs n times
              max = num if num > max
            end
            max
          end
          
          # Time: O(n) - must check every element
        RUBY
        
        cpp_code = <<~CPP
          int findMax(int arr[], int n) {
            int max = arr[0];
            for(int i = 1; i < n; i++) {  // n iterations
              if(arr[i] > max)
                max = arr[i];
            }
            return max;
          }
          
          // Time: O(n) - linear scan
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Both O(n). Must examine each element once. Time grows linearly with input size.")
        
        # Example 3: O(n²) - Quadratic Time
        Visualizer.print_section("5. Example: O(n²) - Quadratic Time")
        
        ruby_code = <<~RUBY
          def print_pairs(arr)
            arr.each do |i|        # n times
              arr.each do |j|      # n times for each i
                puts "\#{i}, \#{j}"
              end
            end
          end
          
          # Time: O(n²) - nested loops
          # Total operations: n × n = n²
        RUBY
        
        cpp_code = <<~CPP
          void printPairs(int arr[], int n) {
            for(int i = 0; i < n; i++) {      // n times
              for(int j = 0; j < n; j++) {    // n times
                cout << arr[i] << "," << arr[j];
              }
            }
          }
          
          // Time: O(n²) - quadratic growth
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Both O(n²). Nested loops multiply. For n=100, runs 10,000 times!")
        
        # Example 4: O(log n) - Logarithmic Time
        Visualizer.print_section("6. Example: O(log n) - Logarithmic Time")
        
        ruby_code = <<~RUBY
          def binary_search(arr, target)
            left, right = 0, arr.length - 1
            
            while left <= right
              mid = (left + right) / 2
              return mid if arr[mid] == target
              
              if arr[mid] < target
                left = mid + 1    # Eliminate left half
              else
                right = mid - 1   # Eliminate right half
              end
            end
            -1
          end
          
          # Time: O(log n) - halves search space each iteration
        RUBY
        
        cpp_code = <<~CPP
          int binarySearch(int arr[], int n, int target) {
            int left = 0, right = n - 1;
            
            while(left <= right) {
              int mid = left + (right - left) / 2;
              if(arr[mid] == target) return mid;
              
              if(arr[mid] < target)
                left = mid + 1;   // Discard left half
              else
                right = mid - 1;  // Discard right half
            }
            return -1;
          }
          
          // Time: O(log n) - logarithmic search
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Both O(log n). Dividing problem in half each step. For n=1,000,000 only ~20 steps!")
        
        # Space Complexity
        Visualizer.print_section("7. Space Complexity")
        puts "\nSpace complexity measures memory usage:"
        puts "  • Input space - memory for input (usually not counted)"
        puts "  • Auxiliary space - extra memory used by algorithm"
        puts "  • Total space = Input space + Auxiliary space"
        
        puts "\nExample - Iterative vs Recursive Sum:"
        
        ruby_code = <<~RUBY
          # Iterative - O(1) space
          def sum_iterative(n)
            total = 0
            (1..n).each { |i| total += i }
            total
          end
          # Only uses 'total' variable
          
          # Recursive - O(n) space
          def sum_recursive(n)
            return 0 if n == 0
            n + sum_recursive(n - 1)
          end
          # Each call adds to call stack
          # n recursive calls = O(n) space
        RUBY
        
        cpp_code = <<~CPP
          // Iterative - O(1) space
          int sumIterative(int n) {
            int total = 0;
            for(int i = 1; i <= n; i++)
              total += i;
            return total;
          }
          
          // Recursive - O(n) space
          int sumRecursive(int n) {
            if(n == 0) return 0;
            return n + sumRecursive(n - 1);
          }
          // Call stack grows to depth n
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Recursion uses call stack memory. Each recursive call adds a stack frame.")
        
        # Important Notes
        notes = [
          "Big O describes worst-case scenario (upper bound)",
          "Drop constants: O(2n) → O(n), O(n/2) → O(n)",
          "Drop non-dominant terms: O(n² + n) → O(n²)",
          "Different inputs use different variables: O(a + b) not O(n)",
          "Best case (Ω), Average case (Θ), Worst case (O)",
          "Space complexity includes call stack for recursion",
          "In-place algorithms use O(1) extra space",
          "Amortized analysis considers average over sequence of operations"
        ]
        NotesManager.print_notes("Complexity Analysis", notes)
        
        # Key Points
        key_points = [
          "O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)",
          "Nested loops usually mean multiplication: O(n × m)",
          "Consecutive loops mean addition: O(n + m)",
          "Recursive algorithms often have O(n) space due to call stack",
          "Binary search is O(log n) because it halves the problem",
          "Sorting comparison-based algorithms can't be better than O(n log n)"
        ]
        NotesManager.print_key_points(key_points)
        
        # Practice Problems
        problems = [
          { title: "Analyze nested loop complexity", difficulty: "Easy",
            description: "Given code with 3 nested loops, determine time complexity" },
          { title: "Space complexity of merge sort", difficulty: "Medium",
            description: "Calculate auxiliary space used by merge sort algorithm" },
          { title: "Optimize O(n²) to O(n)", difficulty: "Medium",
            description: "Use hash table to improve two-sum problem from O(n²) to O(n)" }
        ]
        NotesManager.print_practice_problems(problems)
        
        puts "\n💡 PRO TIP:".colorize(:yellow).bold
        puts "Always analyze both time AND space complexity."
        puts "Sometimes you trade space for time (memoization) or vice versa."
      end
    end
  end
end
