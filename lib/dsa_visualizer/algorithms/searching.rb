module DSAVisualizer
  module Algorithms
    class Searching
      def self.learn_linear
        demo
      end
      
      def self.learn_binary
        demo
      end
      
      def self.demo
        Visualizer.print_header("SEARCHING ALGORITHMS - Core Level Visualization")
        
        Visualizer.print_section("1. Linear Search")
        
        ruby_code = <<~RUBY
          def linear_search(arr, target)
            arr.each_with_index do |val, idx|
              return idx if val == target
            end
            -1
          end
        RUBY

        cpp_code = <<~CPP
          int linearSearch(int arr[], int n, int target) {
            for(int i = 0; i < n; i++) {
              if(arr[i] == target)
                return i;
            }
            return -1;
          }
        CPP

        explanation = "Sequential scan through array. Time: O(n), Space: O(1). Works on unsorted arrays."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        Visualizer.print_section("2. Binary Search")
        
        ruby_code2 = <<~RUBY
          def binary_search(arr, target)
            left, right = 0, arr.length - 1
            while left <= right
              mid = (left + right) / 2
              return mid if arr[mid] == target
              arr[mid] < target ? left = mid + 1 : right = mid - 1
            end
            -1
          end
        RUBY

        cpp_code2 = <<~CPP
          int binarySearch(int arr[], int n, int target) {
            int left = 0, right = n - 1;
            while(left <= right) {
              int mid = left + (right - left) / 2;
              if(arr[mid] == target) return mid;
              if(arr[mid] < target) left = mid + 1;
              else right = mid - 1;
            }
            return -1;
          }
        CPP

        explanation2 = "Divide and conquer on sorted array. Time: O(log n), Space: O(1). Requires sorted input."
        
        Visualizer.print_comparison(ruby_code2, cpp_code2, explanation2)
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Linear: O(n) - works on any array"
        puts "  2. Binary: O(log n) - requires sorted array"
        puts "  3. Binary search eliminates half the search space each iteration"
      end
    end
  end
end
