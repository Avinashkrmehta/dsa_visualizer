module DSAVisualizer
  module Algorithms
    class Sorting
      def self.learn_bubble
        demo
      end
      
      def self.learn_merge
        puts "\n📚 Coming soon: Merge Sort - Divide and Conquer"
      end
      
      def self.learn_quick
        puts "\n📚 Coming soon: Quick Sort - Partition-based"
      end
      
      def self.demo
        Visualizer.print_header("SORTING ALGORITHMS - Core Level Visualization")
        
        Visualizer.print_section("1. Bubble Sort")
        
        ruby_code = <<~RUBY
          def bubble_sort(arr)
            n = arr.length
            (n-1).times do |i|
              (n-i-1).times do |j|
                if arr[j] > arr[j+1]
                  arr[j], arr[j+1] = arr[j+1], arr[j]
                end
              end
            end
            arr
          end
        RUBY

        cpp_code = <<~CPP
          void bubbleSort(int arr[], int n) {
            for(int i = 0; i < n-1; i++) {
              for(int j = 0; j < n-i-1; j++) {
                if(arr[j] > arr[j+1]) {
                  std::swap(arr[j], arr[j+1]);
                }
              }
            }
          }
        CPP

        explanation = "Both implementations identical in logic. Ruby's swap is cleaner syntax. Time: O(n²), Space: O(1). Stable sort."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        arr = [64, 34, 25, 12, 22]
        puts "\nOriginal: #{arr.inspect}"
        
        # Simulate one pass
        puts "\nAfter first pass:"
        n = arr.length
        (n-1).times do |j|
          if arr[j] > arr[j+1]
            arr[j], arr[j+1] = arr[j+1], arr[j]
            puts "  Swapped #{arr[j+1]} and #{arr[j]}: #{arr.inspect}"
          end
        end
        
        Visualizer.print_section("2. Quick Sort")
        puts "\nDivide and conquer algorithm"
        puts "Average: O(n log n), Worst: O(n²)"
        puts "In-place, not stable"
        
        puts "\n\n🎯 Sorting Comparison:".colorize(:green).bold
        puts "  Bubble Sort: O(n²) - simple, slow"
        puts "  Quick Sort: O(n log n) - fast, in-place"
        puts "  Merge Sort: O(n log n) - stable, needs extra space"
        puts "  Heap Sort: O(n log n) - in-place, not stable"
      end
    end
  end
end
