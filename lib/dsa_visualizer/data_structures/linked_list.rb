module DSAVisualizer
  module DataStructures
    class Node
      attr_accessor :data, :next
      
      def initialize(data)
        @data = data
        @next = nil
      end
    end

    class LinkedList
      attr_reader :head

      def initialize
        @head = nil
      end

      def append(data)
        new_node = Node.new(data)
        
        if @head.nil?
          @head = new_node
          return
        end

        current = @head
        current = current.next while current.next
        current.next = new_node
      end

      def visualize
        return "Empty list" if @head.nil?
        
        result = ""
        current = @head
        while current
          result += "[#{current.data}|•]"
          result += " -> " if current.next
          current = current.next
        end
        result += " -> nil"
        result
      end

      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("LINKED LIST - Core Level Visualization")
        
        # Memory Model
        Visualizer.print_section("1. Memory Model Comparison")
        
        ruby_code = <<~RUBY
          class Node
            attr_accessor :data, :next
            def initialize(data)
              @data = data
              @next = nil
            end
          end
          # Each node is a Ruby object
          # @next stores reference to next node
        RUBY

        cpp_code = <<~CPP
          struct Node {
            int data;
            Node* next;
            Node(int d) : data(d), next(nullptr) {}
          };
          // Each node allocated on heap
          // next is explicit pointer
        CPP

        explanation = "Ruby uses object references (implicit pointers), C++ uses explicit pointers. Both achieve same structure but Ruby adds GC overhead while C++ requires manual memory management."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        # Creation
        Visualizer.print_section("2. Creating Linked List")
        tracker = MemoryTracker.new
        list = LinkedList.new
        
        Visualizer.print_step(1, "Adding nodes: 10, 20, 30")
        
        [10, 20, 30].each do |value|
          list.append(value)
          tracker.track_operation("Append", "Added node with value #{value}")
        end
        
        puts "\n" + list.visualize
        
        puts "\n📦 Memory Layout:"
        current = list.head
        index = 0
        while current
          puts "  Node #{index}:"
          puts "    Address: 0x#{current.object_id.to_s(16)}"
          puts "    Data: #{current.data}"
          puts "    Next: #{current.next ? "0x#{current.next.object_id.to_s(16)}" : "nil"}"
          current = current.next
          index += 1
        end
        
        puts "\n🔍 Ruby Internals:"
        puts "  - Each Node is a Ruby object (heap allocated)"
        puts "  - @next is object reference (managed by GC)"
        puts "  - No manual memory management needed"
        puts "  - Overhead: object header + reference tracking"
        
        puts "\n🔍 C++ Internals:"
        puts "  - Each Node allocated with 'new'"
        puts "  - next is raw pointer (8 bytes on 64-bit)"
        puts "  - Must manually delete nodes"
        puts "  - No overhead beyond struct size"
        
        # Traversal
        Visualizer.print_section("3. Traversal")
        Visualizer.print_step(2, "Traversing to find value 20")
        
        puts "\nProcess:"
        current = list.head
        position = 0
        while current
          if current.data == 20
            puts "  Position #{position}: [#{current.data}] ← FOUND!".colorize(:green)
          else
            puts "  Position #{position}: [#{current.data}]"
          end
          current = current.next
          position += 1
        end
        
        Comparator.compare_complexity(
          "Linked List Traversal",
          "O(n) - must follow references",
          "O(n) - must follow pointers",
          "Both require sequential access. No random access like arrays. Cache performance worse due to non-contiguous memory."
        )
        
        # Insertion
        Visualizer.print_section("4. Insertion at Beginning")
        Visualizer.print_step(3, "Inserting 5 at head")
        
        puts "\nBefore: " + list.visualize
        
        new_node = Node.new(5)
        new_node.next = list.head
        list.instance_variable_set(:@head, new_node)
        tracker.track_operation("Insert", "Inserted 5 at head")
        
        puts "After:  " + list.visualize
        
        puts "\n🔄 Ruby Process:"
        puts "  1. Create new Node object (GC manages)"
        puts "  2. Set new_node.next = current head"
        puts "  3. Update head reference"
        puts "  4. O(1) operation"
        
        puts "\n🔄 C++ Process:"
        puts "  1. Allocate: Node* new_node = new Node(5)"
        puts "  2. Set: new_node->next = head"
        puts "  3. Update: head = new_node"
        puts "  4. O(1) operation"
        
        # Memory comparison
        Visualizer.print_section("5. Memory Comparison")
        
        puts "\n📊 Array vs Linked List:"
        puts "\nArray:"
        puts "  ✓ Contiguous memory (better cache)"
        puts "  ✓ O(1) random access"
        puts "  ✗ O(n) insertion/deletion (middle)"
        puts "  ✗ Fixed size (or expensive resize)"
        
        puts "\nLinked List:"
        puts "  ✓ O(1) insertion/deletion (at known position)"
        puts "  ✓ Dynamic size (no resize needed)"
        puts "  ✗ O(n) random access"
        puts "  ✗ Poor cache locality"
        puts "  ✗ Extra memory for pointers/references"
        
        tracker.print_summary
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Linked lists trade random access for efficient insertion/deletion"
        puts "  2. Ruby's GC simplifies memory management vs C++ manual management"
        puts "  3. Non-contiguous memory means poor cache performance"
        puts "  4. Each node has pointer/reference overhead"
        puts "  5. Best for frequent insertions/deletions, not random access"
      end
    end
  end
end
