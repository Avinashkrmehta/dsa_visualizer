module DSAVisualizer
  module DataStructures
    class PriorityQueue
      def self.learn
        Visualizer.print_header("PRIORITY QUEUE - Heap-Based Queue")
        
        puts "\n📖 CONCEPT:"
        puts "A Priority Queue is an abstract data type where:"
        puts "• Each element has a priority"
        puts "• Higher priority elements are dequeued first"
        puts "• Typically implemented using heaps"
        puts "• Used in scheduling, graph algorithms (Dijkstra, Prim)"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Insert: O(log n)"
        puts "• Extract Max/Min: O(log n)"
        puts "• Peek: O(1)"
        puts "• Build: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_priority_queue
        demonstrate_applications
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_priority_queue
        puts "\n" + "="*60
        puts "DEMONSTRATION: Priority Queue Operations"
        puts "="*60
        
        pq = PriorityQueueImplementation.new
        
        puts "\nInserting tasks with priorities:"
        tasks = [
          { task: "Email", priority: 2 },
          { task: "Meeting", priority: 5 },
          { task: "Coffee", priority: 1 },
          { task: "Deadline", priority: 10 },
          { task: "Lunch", priority: 3 }
        ]
        
        tasks.each do |t|
          pq.insert(t[:task], t[:priority])
          puts "Added: #{t[:task]} (priority: #{t[:priority]})"
        end
        
        puts "\n📊 Processing by priority (highest first):"
        until pq.empty?
          task, priority = pq.extract_max
          puts "Processing: #{task} (priority: #{priority})"
        end
      end

      def self.demonstrate_applications
        puts "\n" + "="*60
        puts "REAL-WORLD APPLICATIONS"
        puts "="*60
        
        puts "\n1️⃣  CPU SCHEDULING:"
        puts "Process with highest priority gets CPU time first"
        
        puts "\n2️⃣  DIJKSTRA'S ALGORITHM:"
        puts "Always process vertex with minimum distance"
        
        puts "\n3️⃣  HUFFMAN CODING:"
        puts "Build tree by merging nodes with lowest frequency"
        
        puts "\n4️⃣  EVENT-DRIVEN SIMULATION:"
        puts "Process events in chronological order"
        
        puts "\n5️⃣  LOAD BALANCING:"
        puts "Assign tasks to least loaded server"
        
        puts "\n6️⃣  A* PATHFINDING:"
        puts "Explore nodes with best estimated cost first"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class PriorityQueue
            def initialize
              @heap = []
            end
            
            def insert(item, priority)
              @heap << [item, priority]
              heapify_up(@heap.size - 1)
            end
            
            def extract_max
              return nil if @heap.empty?
              max = @heap[0]
              @heap[0] = @heap.pop
              heapify_down(0) unless @heap.empty?
              max
            end
            
            def heapify_up(index)
              parent = (index - 1) / 2
              if parent >= 0 && @heap[index][1] > @heap[parent][1]
                @heap[index], @heap[parent] = @heap[parent], @heap[index]
                heapify_up(parent)
              end
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          #include <queue>
          #include <vector>
          
          // Using STL priority_queue (max heap by default)
          std::priority_queue<int> pq;
          pq.push(10);
          pq.push(30);
          pq.push(20);
          int max = pq.top();  // 30
          pq.pop();
          
          // Min heap version
          std::priority_queue<int, std::vector<int>, std::greater<int>> minPQ;
          
          // Custom comparator
          struct Task {
              string name;
              int priority;
          };
          
          auto cmp = [](Task a, Task b) { return a.priority < b.priority; };
          std::priority_queue<Task, std::vector<Task>, decltype(cmp)> taskPQ(cmp);
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Kth largest element in stream",
          "2. Merge K sorted arrays",
          "3. Find median in data stream",
          "4. Task scheduler with cooldown",
          "5. Meeting rooms II (min rooms needed)",
          "6. Top K frequent words",
          "7. Reorganize string",
          "8. Minimum cost to connect sticks"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Use min heap when you need smallest, max heap for largest!"
        puts "💡 TIP: Priority queue is perfect for 'Kth largest/smallest' problems"
      end

      class PriorityQueueImplementation
        def initialize
          @heap = []  # Array of [item, priority] pairs
        end
        
        def insert(item, priority)
          @heap << [item, priority]
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
        
        def size
          @heap.size
        end
        
        private
        
        def heapify_up(index)
          return if index == 0
          
          parent = (index - 1) / 2
          if @heap[index][1] > @heap[parent][1]
            @heap[index], @heap[parent] = @heap[parent], @heap[index]
            heapify_up(parent)
          end
        end
        
        def heapify_down(index)
          left = 2 * index + 1
          right = 2 * index + 2
          largest = index
          
          largest = left if left < @heap.size && @heap[left][1] > @heap[largest][1]
          largest = right if right < @heap.size && @heap[right][1] > @heap[largest][1]
          
          if largest != index
            @heap[index], @heap[largest] = @heap[largest], @heap[index]
            heapify_down(largest)
          end
        end
      end
    end
  end
end
