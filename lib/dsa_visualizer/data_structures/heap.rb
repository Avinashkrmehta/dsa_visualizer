module DSAVisualizer
  module DataStructures
    class Heap
      def self.learn_min
        Visualizer.print_header("MIN HEAP - Complete Binary Tree")
        
        puts "\n📖 CONCEPT:"
        puts "A Min Heap is a complete binary tree where:"
        puts "• Parent is always smaller than its children"
        puts "• Root contains the minimum element"
        puts "• Implemented using array for efficiency"
        puts "• Used in priority queues, heap sort, and graph algorithms"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Insert: O(log n)"
        puts "• Extract Min: O(log n)"
        puts "• Get Min: O(1)"
        puts "• Build Heap: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_min_heap
        demonstrate_operations
        show_array_representation
        show_ruby_vs_cpp
        show_practice_problems
      end
      
      def self.learn_max
        Visualizer.print_header("MAX HEAP - Complete Binary Tree")
        
        puts "\n📖 CONCEPT:"
        puts "A Max Heap is a complete binary tree where:"
        puts "• Parent is always larger than its children"
        puts "• Root contains the maximum element"
        puts "• Same structure as min heap, opposite ordering"
        puts "• Used in heap sort and finding kth largest element"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Insert: O(log n)"
        puts "• Extract Max: O(log n)"
        puts "• Get Max: O(1)"
        puts "• Build Heap: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_max_heap
      end

      def self.demonstrate_min_heap
        puts "\n" + "="*60
        puts "DEMONSTRATION: Min Heap Operations"
        puts "="*60
        
        heap = MinHeapImplementation.new
        values = [10, 20, 5, 30, 15, 3]
        
        puts "\nInserting: #{values.join(', ')}"
        values.each do |val|
          heap.insert(val)
          puts "Inserted #{val}, Min: #{heap.peek}"
        end
        
        puts "\n📊 Heap Structure:"
        puts "        3"
        puts "       / \\"
        puts "      15  5"
        puts "     / \\  /"
        puts "    30 20 10"
        
        puts "\nArray representation: #{heap.to_a.inspect}"
      end

      def self.demonstrate_max_heap
        puts "\n" + "="*60
        puts "DEMONSTRATION: Max Heap Operations"
        puts "="*60
        
        heap = MaxHeapImplementation.new
        values = [10, 20, 5, 30, 15, 3]
        
        puts "\nInserting: #{values.join(', ')}"
        values.each { |val| heap.insert(val) }
        
        puts "\n📊 Heap Structure:"
        puts "        30"
        puts "       /  \\"
        puts "      20   10"
        puts "     / \\   /"
        puts "    15  5  3"
        
        puts "\nExtracting max elements:"
        3.times { puts "Extracted: #{heap.extract_max}" }
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "MIN HEAP OPERATIONS"
        puts "="*60
        
        heap = MinHeapImplementation.new
        [10, 20, 5, 30, 15].each { |v| heap.insert(v) }
        
        puts "\n1️⃣  PEEK (Get Min):"
        puts "Minimum: #{heap.peek}"
        
        puts "\n2️⃣  EXTRACT MIN:"
        puts "Extracted: #{heap.extract_min}"
        puts "New minimum: #{heap.peek}"
        
        puts "\n3️⃣  HEAP SORT:"
        sorted = []
        sorted << heap.extract_min until heap.empty?
        puts "Sorted: #{sorted.join(', ')}"
      end

      def self.show_array_representation
        puts "\n" + "="*60
        puts "ARRAY REPRESENTATION"
        puts "="*60
        
        puts "\nFor node at index i:"
        puts "• Left child: 2*i + 1"
        puts "• Right child: 2*i + 2"
        puts "• Parent: (i-1)/2"
        
        puts "\nExample: [3, 15, 5, 30, 20, 10]"
        puts "Index:    0   1  2   3   4   5"
        puts ""
        puts "Node 3 (index 0): children at 1 and 2 → 15, 5"
        puts "Node 15 (index 1): children at 3 and 4 → 30, 20"
        puts "Node 30 (index 3): parent at (3-1)/2 = 1 → 15"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class MinHeap
            def initialize
              @heap = []
            end
            
            def insert(val)
              @heap << val
              heapify_up(@heap.size - 1)
            end
            
            def extract_min
              return nil if @heap.empty?
              min = @heap[0]
              @heap[0] = @heap.pop
              heapify_down(0) unless @heap.empty?
              min
            end
            
            def heapify_up(index)
              parent = (index - 1) / 2
              if parent >= 0 && @heap[index] < @heap[parent]
                @heap[index], @heap[parent] = @heap[parent], @heap[index]
                heapify_up(parent)
              end
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          #include <vector>
          
          class MinHeap {
              std::vector<int> heap;
          public:
              void insert(int val) {
                  heap.push_back(val);
                  heapifyUp(heap.size() - 1);
              }
              
              int extractMin() {
                  int min = heap[0];
                  heap[0] = heap.back();
                  heap.pop_back();
                  heapifyDown(0);
                  return min;
              }
              
              void heapifyUp(int index) {
                  int parent = (index - 1) / 2;
                  if (parent >= 0 && heap[index] < heap[parent]) {
                      swap(heap[index], heap[parent]);
                      heapifyUp(parent);
                  }
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Kth largest element in array",
          "2. Merge K sorted lists",
          "3. Find median from data stream",
          "4. Top K frequent elements",
          "5. Sort nearly sorted array",
          "6. Connect n ropes with minimum cost",
          "7. K closest points to origin",
          "8. Reorganize string (no adjacent duplicates)"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Use max heap for kth smallest, min heap for kth largest!"
        puts "💡 TIP: Building heap from array is O(n), not O(n log n)!"
      end

      class MinHeapImplementation
        def initialize
          @heap = []
        end
        
        def insert(val)
          @heap << val
          heapify_up(@heap.size - 1)
        end
        
        def extract_min
          return nil if @heap.empty?
          
          min = @heap[0]
          @heap[0] = @heap.pop
          heapify_down(0) unless @heap.empty?
          min
        end
        
        def peek
          @heap[0]
        end
        
        def empty?
          @heap.empty?
        end
        
        def size
          @heap.size
        end
        
        def to_a
          @heap.dup
        end
        
        private
        
        def heapify_up(index)
          return if index == 0
          
          parent = (index - 1) / 2
          if @heap[index] < @heap[parent]
            @heap[index], @heap[parent] = @heap[parent], @heap[index]
            heapify_up(parent)
          end
        end
        
        def heapify_down(index)
          left = 2 * index + 1
          right = 2 * index + 2
          smallest = index
          
          smallest = left if left < @heap.size && @heap[left] < @heap[smallest]
          smallest = right if right < @heap.size && @heap[right] < @heap[smallest]
          
          if smallest != index
            @heap[index], @heap[smallest] = @heap[smallest], @heap[index]
            heapify_down(smallest)
          end
        end
      end

      class MaxHeapImplementation
        def initialize
          @heap = []
        end
        
        def insert(val)
          @heap << val
          heapify_up(@heap.size - 1)
        end
        
        def extract_max
          return nil if @heap.empty?
          
          max = @heap[0]
          @heap[0] = @heap.pop
          heapify_down(0) unless @heap.empty?
          max
        end
        
        def peek
          @heap[0]
        end
        
        def empty?
          @heap.empty?
        end
        
        private
        
        def heapify_up(index)
          return if index == 0
          
          parent = (index - 1) / 2
          if @heap[index] > @heap[parent]
            @heap[index], @heap[parent] = @heap[parent], @heap[index]
            heapify_up(parent)
          end
        end
        
        def heapify_down(index)
          left = 2 * index + 1
          right = 2 * index + 2
          largest = index
          
          largest = left if left < @heap.size && @heap[left] > @heap[largest]
          largest = right if right < @heap.size && @heap[right] > @heap[largest]
          
          if largest != index
            @heap[index], @heap[largest] = @heap[largest], @heap[index]
            heapify_down(largest)
          end
        end
      end
    end
  end
end
