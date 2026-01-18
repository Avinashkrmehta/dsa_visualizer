module DSAVisualizer
  module DataStructures
    class Stack
      def initialize
        @items = []
      end

      def push(item)
        @items.push(item)
      end

      def pop
        @items.pop
      end

      def peek
        @items.last
      end

      def empty?
        @items.empty?
      end

      def size
        @items.size
      end

      def visualize
        return "Empty stack" if @items.empty?
        
        result = "\n"
        @items.reverse.each_with_index do |item, idx|
          marker = (idx == 0) ? " ← TOP" : ""
          result += "  │ #{item.to_s.center(10)} │#{marker}\n"
          result += "  └────────────┘\n" if idx == @items.size - 1
          result += "  ├────────────┤\n" unless idx == @items.size - 1
        end
        result
      end

      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("STACK - Core Level Visualization")
        
        # Concept
        Visualizer.print_section("1. Stack Concept (LIFO)")
        puts "\nLast In, First Out - like a stack of plates"
        puts "Operations: push (add), pop (remove), peek (view top)"
        
        # Implementation Comparison
        Visualizer.print_section("2. Implementation Comparison")
        
        ruby_code = <<~RUBY
          class Stack
            def initialize
              @items = []  # Dynamic array
            end
            
            def push(item)
              @items.push(item)  # O(1) amortized
            end
            
            def pop
              @items.pop  # O(1)
            end
          end
        RUBY

        cpp_code = <<~CPP
          class Stack {
            std::vector<int> items;
          public:
            void push(int item) {
              items.push_back(item);  // O(1) amortized
            }
            
            int pop() {
              int top = items.back();
              items.pop_back();  // O(1)
              return top;
            }
          };
        CPP

        explanation = "Both use dynamic arrays internally. Ruby's Array and C++'s std::vector provide O(1) push/pop at end. Alternative: linked list implementation trades memory for guaranteed O(1) operations."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        # Demo Operations
        Visualizer.print_section("3. Stack Operations")
        tracker = MemoryTracker.new
        stack = Stack.new
        
        # Push operations
        Visualizer.print_step(1, "Pushing elements: 10, 20, 30")
        [10, 20, 30].each do |val|
          stack.push(val)
          tracker.track_operation("Push", "Pushed #{val}")
          puts stack.visualize
        end
        
        puts "\n🔍 Push Internals (Ruby):"
        puts "  1. Check array capacity"
        puts "  2. If full: allocate new array (2× size)"
        puts "  3. Copy existing elements (if resized)"
        puts "  4. Add element at end"
        puts "  5. Increment size counter"
        puts "  Amortized O(1) - occasional O(n) resize"
        
        puts "\n🔍 Push Internals (C++):"
        puts "  1. Check vector capacity"
        puts "  2. If full: allocate new memory"
        puts "  3. Move/copy elements (if resized)"
        puts "  4. Place element at end"
        puts "  5. Update size"
        puts "  Amortized O(1) - same as Ruby"
        
        # Peek operation
        Visualizer.print_step(2, "Peeking at top element")
        top = stack.peek
        puts "Top element: #{top}".colorize(:yellow)
        puts stack.visualize
        tracker.track_operation("Peek", "Viewed top: #{top}")
        
        # Pop operations
        Visualizer.print_step(3, "Popping elements")
        2.times do
          popped = stack.pop
          tracker.track_operation("Pop", "Popped #{popped}")
          puts "\nPopped: #{popped}".colorize(:red)
          puts stack.visualize
        end
        
        puts "\n🔍 Pop Internals:"
        puts "  Ruby:"
        puts "    1. Check if empty (raise error if true)"
        puts "    2. Get last element"
        puts "    3. Decrement size"
        puts "    4. Return element"
        puts "    O(1) operation"
        
        puts "\n  C++:"
        puts "    1. Access last element (no bounds check)"
        puts "    2. Call destructor if needed"
        puts "    3. Decrement size"
        puts "    4. Return value"
        puts "    O(1) operation"
        
        # Memory Layout
        Visualizer.print_section("4. Memory Layout")
        
        puts "\n📦 Array-based Stack Memory:"
        puts "  Ruby:"
        puts "    Stack object → Array object → [ref1, ref2, ref3, ...]"
        puts "    Each element is object reference"
        puts "    Overhead: Array header + references"
        
        puts "\n  C++:"
        puts "    Stack object → vector → [val1, val2, val3, ...]"
        puts "    Direct values in contiguous memory"
        puts "    Overhead: vector metadata only"
        
        # Use Cases
        Visualizer.print_section("5. Real-World Use Cases")
        
        puts "\n📚 Common Applications:"
        puts "  1. Function call stack (recursion)"
        puts "  2. Undo/Redo operations"
        puts "  3. Expression evaluation (postfix)"
        puts "  4. Backtracking algorithms"
        puts "  5. Browser history (back button)"
        
        puts "\n💡 Example: Function Call Stack"
        puts "  def factorial(n)"
        puts "    return 1 if n <= 1"
        puts "    n * factorial(n - 1)  # Each call pushed to stack"
        puts "  end"
        puts "\n  Call stack for factorial(3):"
        puts "    │ factorial(1) │ ← TOP (returns 1)"
        puts "    ├──────────────┤"
        puts "    │ factorial(2) │ (waits for result)"
        puts "    ├──────────────┤"
        puts "    │ factorial(3) │ (waits for result)"
        puts "    └──────────────┘"
        
        tracker.print_summary
        
        Comparator.compare_complexity(
          "Stack Operations",
          "Push/Pop: O(1) amortized, Peek: O(1)",
          "Push/Pop: O(1) amortized, Peek: O(1)",
          "Both implementations have same complexity. C++ is faster due to direct value storage vs Ruby's object references."
        )
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Stack is LIFO - Last In, First Out"
        puts "  2. Array-based implementation provides O(1) operations"
        puts "  3. Both Ruby and C++ use dynamic arrays internally"
        puts "  4. Perfect for reversing, backtracking, and nested structures"
        puts "  5. Function calls use stack internally (call stack)"
      end
    end
  end
end
