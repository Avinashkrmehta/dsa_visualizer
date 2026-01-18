module DSAVisualizer
  module DataStructures
    class Queue
      def initialize
        @items = []
      end

      def enqueue(item)
        @items.push(item)
      end

      def dequeue
        @items.shift
      end

      def front
        @items.first
      end

      def empty?
        @items.empty?
      end

      def size
        @items.size
      end

      def visualize
        return "Empty queue" if @items.empty?
        
        result = "\nFRONT → "
        @items.each_with_index do |item, idx|
          result += "[ #{item} ]"
          result += " → " unless idx == @items.size - 1
        end
        result += " ← REAR"
        result
      end

      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("QUEUE - Core Level Visualization")
        
        Visualizer.print_section("1. Queue Concept (FIFO)")
        puts "\nFirst In, First Out - like a line at a store"
        puts "Operations: enqueue (add at rear), dequeue (remove from front)"
        
        Visualizer.print_section("2. Implementation Comparison")
        
        ruby_code = <<~RUBY
          class Queue
            def initialize
              @items = []
            end
            
            def enqueue(item)
              @items.push(item)  # O(1)
            end
            
            def dequeue
              @items.shift  # O(n) - shifts all elements!
            end
          end
        RUBY

        cpp_code = <<~CPP
          #include <queue>
          std::queue<int> q;
          
          q.push(10);   // O(1)
          q.pop();      // O(1)
          
          // Internally uses deque (double-ended queue)
          // Efficient operations at both ends
        CPP

        explanation = "Ruby's Array.shift is O(n) because it shifts all elements. C++'s std::queue uses deque internally for O(1) operations at both ends. For better Ruby performance, use a circular buffer or linked list."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        tracker = MemoryTracker.new
        queue = Queue.new
        
        Visualizer.print_step(1, "Enqueuing: 10, 20, 30")
        [10, 20, 30].each do |val|
          queue.enqueue(val)
          tracker.track_operation("Enqueue", "Added #{val}")
          puts queue.visualize
        end
        
        Visualizer.print_step(2, "Dequeuing")
        dequeued = queue.dequeue
        tracker.track_operation("Dequeue", "Removed #{dequeued}")
        puts "\nRemoved: #{dequeued}".colorize(:red)
        puts queue.visualize
        
        tracker.print_summary
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Queue is FIFO - First In, First Out"
        puts "  2. Ruby Array.shift is O(n) - inefficient for large queues"
        puts "  3. C++ std::queue uses deque for O(1) operations"
        puts "  4. Use cases: task scheduling, BFS, buffering"
      end
    end
  end
end
