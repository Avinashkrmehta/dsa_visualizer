module DSAVisualizer
  module Algorithms
    class Sorting
      def self.learn_bubble
        demo
      end
      
      def self.learn_merge
        Visualizer.print_header("MERGE SORT - Divide and Conquer")
        
        puts "\n📖 CONCEPT:"
        puts "Merge Sort divides array into halves, sorts them, and merges:"
        puts "• Divide: Split array into two halves"
        puts "• Conquer: Recursively sort both halves"
        puts "• Combine: Merge sorted halves"
        puts "• Stable sort, predictable performance"
        
        puts "\n⏱️  TIME COMPLEXITY: O(n log n) - all cases"
        puts "💾 SPACE COMPLEXITY: O(n) - needs auxiliary array"
        
        demonstrate_merge_sort
      end
      
      def self.learn_quick
        Visualizer.print_header("QUICK SORT - Partition-based")
        
        puts "\n📖 CONCEPT:"
        puts "Quick Sort picks a pivot and partitions around it:"
        puts "• Choose pivot element"
        puts "• Partition: elements < pivot on left, > pivot on right"
        puts "• Recursively sort left and right partitions"
        puts "• In-place sorting, cache-friendly"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Average: O(n log n)"
        puts "• Worst: O(n²) - when pivot is always min/max"
        puts "💾 SPACE COMPLEXITY: O(log n) - recursion stack"
        
        demonstrate_quick_sort
      end
      
      def self.demonstrate_merge_sort
        puts "\n" + "="*60
        puts "MERGE SORT DEMONSTRATION"
        puts "="*60
        
        arr = [38, 27, 43, 3, 9, 82, 10]
        puts "\nOriginal: #{arr.inspect}"
        
        puts "\nDivide phase:"
        puts "[38, 27, 43, 3, 9, 82, 10]"
        puts "[38, 27, 43, 3] | [9, 82, 10]"
        puts "[38, 27] [43, 3] | [9, 82] [10]"
        puts "[38] [27] [43] [3] | [9] [82] [10]"
        
        puts "\nMerge phase:"
        puts "[27, 38] [3, 43] | [9, 82] [10]"
        puts "[3, 27, 38, 43] | [9, 10, 82]"
        puts "[3, 9, 10, 27, 38, 43, 82]"
        
        sorted = merge_sort(arr.dup)
        puts "\nSorted: #{sorted.inspect}"
      end
      
      def self.demonstrate_quick_sort
        puts "\n" + "="*60
        puts "QUICK SORT DEMONSTRATION"
        puts "="*60
        
        arr = [10, 7, 8, 9, 1, 5]
        puts "\nOriginal: #{arr.inspect}"
        puts "Pivot: #{arr.last} (choosing last element)"
        
        puts "\nPartitioning:"
        puts "Elements < 5: [1]"
        puts "Pivot: [5]"
        puts "Elements > 5: [10, 7, 8, 9]"
        
        sorted = quick_sort(arr.dup)
        puts "\nSorted: #{sorted.inspect}"
      end
      
      def self.merge_sort(arr)
        return arr if arr.length <= 1
        
        mid = arr.length / 2
        left = merge_sort(arr[0...mid])
        right = merge_sort(arr[mid..-1])
        
        merge(left, right)
      end
      
      def self.merge(left, right)
        result = []
        i = j = 0
        
        while i < left.length && j < right.length
          if left[i] <= right[j]
            result << left[i]
            i += 1
          else
            result << right[j]
            j += 1
          end
        end
        
        result + left[i..-1] + right[j..-1]
      end
      
      def self.quick_sort(arr)
        return arr if arr.length <= 1
        
        pivot = arr.pop
        left = arr.select { |x| x <= pivot }
        right = arr.select { |x| x > pivot }
        
        quick_sort(left) + [pivot] + quick_sort(right)
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
