module DSAVisualizer
  module DataStructures
    class Deque
      def self.learn
        Visualizer.print_header("DEQUE - Double-Ended Queue")
        
        puts "\n📖 CONCEPT:"
        puts "A Deque (Double-Ended Queue) allows insertion and deletion at both ends:"
        puts "• Push/Pop from front"
        puts "• Push/Pop from back"
        puts "• Can be used as both stack and queue"
        puts "• Often implemented using circular array or doubly linked list"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Push front/back: O(1)"
        puts "• Pop front/back: O(1)"
        puts "• Access front/back: O(1)"
        puts "• Search: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_deque
        demonstrate_operations
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_deque
        puts "\n" + "="*60
        puts "DEMONSTRATION: Deque Operations"
        puts "="*60
        
        deque = DequeImplementation.new
        
        puts "\nPush back: 10, 20, 30"
        deque.push_back(10)
        deque.push_back(20)
        deque.push_back(30)
        deque.display
        
        puts "\nPush front: 5, 1"
        deque.push_front(5)
        deque.push_front(1)
        deque.display
        
        puts "\n📊 Current state: [1, 5, 10, 20, 30]"
        puts "Front: #{deque.front}, Back: #{deque.back}"
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "DEQUE OPERATIONS"
        puts "="*60
        
        deque = DequeImplementation.new
        [10, 20, 30].each { |v| deque.push_back(v) }
        
        puts "\n1️⃣  POP FRONT:"
        puts "Popped: #{deque.pop_front}"
        deque.display
        
        puts "\n2️⃣  POP BACK:"
        puts "Popped: #{deque.pop_back}"
        deque.display
        
        puts "\n3️⃣  USING AS STACK (LIFO):"
        stack_deque = DequeImplementation.new
        stack_deque.push_back(1)
        stack_deque.push_back(2)
        stack_deque.push_back(3)
        puts "Push: 1, 2, 3"
        puts "Pop: #{stack_deque.pop_back}, #{stack_deque.pop_back}"
        
        puts "\n4️⃣  USING AS QUEUE (FIFO):"
        queue_deque = DequeImplementation.new
        queue_deque.push_back(1)
        queue_deque.push_back(2)
        queue_deque.push_back(3)
        puts "Enqueue: 1, 2, 3"
        puts "Dequeue: #{queue_deque.pop_front}, #{queue_deque.pop_front}"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class Deque
            def initialize
              @items = []
            end
            
            def push_front(item)
              @items.unshift(item)
            end
            
            def push_back(item)
              @items.push(item)
            end
            
            def pop_front
              @items.shift
            end
            
            def pop_back
              @items.pop
            end
            
            def front
              @items.first
            end
            
            def back
              @items.last
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          #include <deque>
          
          std::deque<int> dq;
          
          // Operations
          dq.push_front(10);  // Add to front
          dq.push_back(20);   // Add to back
          dq.pop_front();     // Remove from front
          dq.pop_back();      // Remove from back
          
          int front = dq.front();  // Access front
          int back = dq.back();    // Access back
          
          // Or manual implementation with circular array
          class Deque {
              int* arr;
              int front, rear, size, capacity;
          public:
              void pushFront(int x) {
                  front = (front - 1 + capacity) % capacity;
                  arr[front] = x;
                  size++;
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Sliding window maximum using deque",
          "2. Implement stack using deque",
          "3. Implement queue using deque",
          "4. First negative in every window of size k",
          "5. Maximum of all subarrays of size k",
          "6. Design a data structure with O(1) operations",
          "7. Palindrome checker using deque",
          "8. Deque with min/max in O(1)"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Deque is perfect for sliding window problems!"
        puts "💡 TIP: Ruby's Array class supports deque operations efficiently"
      end

      class DequeImplementation
        def initialize
          @items = []
        end
        
        def push_front(item)
          @items.unshift(item)
        end
        
        def push_back(item)
          @items.push(item)
        end
        
        def pop_front
          return nil if empty?
          @items.shift
        end
        
        def pop_back
          return nil if empty?
          @items.pop
        end
        
        def front
          @items.first
        end
        
        def back
          @items.last
        end
        
        def empty?
          @items.empty?
        end
        
        def size
          @items.size
        end
        
        def display
          puts "Deque: [#{@items.join(', ')}]"
        end
      end
    end
  end
end
