module DSAVisualizer
  module DataStructures
    class DoublyLinkedList
      class Node
        attr_accessor :data, :prev, :next
        
        def initialize(data)
          @data = data
          @prev = nil
          @next = nil
        end
      end

      def self.learn
        Visualizer.print_header("DOUBLY LINKED LIST - Bidirectional Navigation")
        
        puts "\n📖 CONCEPT:"
        puts "A Doubly Linked List has nodes with two pointers:"
        puts "• next: Points to the next node"
        puts "• prev: Points to the previous node"
        puts "• Allows bidirectional traversal"
        puts "• More memory overhead but more flexible than singly linked list"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Access: O(n)"
        puts "• Search: O(n)"
        puts "• Insert at head/tail: O(1)"
        puts "• Delete at head/tail: O(1)"
        puts "• Insert/Delete at position: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n) - extra pointer per node"
        
        demonstrate_dll
        demonstrate_operations
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_dll
        puts "\n" + "="*60
        puts "DEMONSTRATION: Building a Doubly Linked List"
        puts "="*60
        
        dll = DLLImplementation.new
        
        puts "\nInserting at tail: 10, 20, 30"
        dll.insert_tail(10)
        dll.insert_tail(20)
        dll.insert_tail(30)
        dll.display
        
        puts "\nInserting at head: 5"
        dll.insert_head(5)
        dll.display
        
        puts "\n📊 Structure:"
        puts "nil ← [5] ⇄ [10] ⇄ [20] ⇄ [30] → nil"
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "DOUBLY LINKED LIST OPERATIONS"
        puts "="*60
        
        dll = DLLImplementation.new
        [10, 20, 30, 40].each { |v| dll.insert_tail(v) }
        
        puts "\n1️⃣  FORWARD TRAVERSAL:"
        dll.display
        
        puts "\n2️⃣  BACKWARD TRAVERSAL:"
        dll.display_reverse
        
        puts "\n3️⃣  DELETE FROM HEAD:"
        dll.delete_head
        dll.display
        
        puts "\n4️⃣  DELETE FROM TAIL:"
        dll.delete_tail
        dll.display
        
        puts "\n5️⃣  SEARCH:"
        puts "Search 30: #{dll.search(30) ? '✓ Found' : '✗ Not found'}"
        puts "Search 99: #{dll.search(99) ? '✓ Found' : '✗ Not found'}"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class Node
            attr_accessor :data, :prev, :next
            def initialize(data)
              @data = data
              @prev = @next = nil
            end
          end
          
          class DoublyLinkedList
            def insert_tail(data)
              new_node = Node.new(data)
              if @head.nil?
                @head = @tail = new_node
              else
                @tail.next = new_node
                new_node.prev = @tail
                @tail = new_node
              end
            end
            
            def delete_head
              return if @head.nil?
              @head = @head.next
              @head.prev = nil if @head
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          struct Node {
              int data;
              Node* prev;
              Node* next;
              Node(int val) : data(val), prev(nullptr), next(nullptr) {}
          };
          
          class DoublyLinkedList {
              Node* head;
              Node* tail;
          public:
              void insertTail(int data) {
                  Node* newNode = new Node(data);
                  if (head == nullptr) {
                      head = tail = newNode;
                  } else {
                      tail->next = newNode;
                      newNode->prev = tail;
                      tail = newNode;
                  }
              }
              
              void deleteHead() {
                  if (head == nullptr) return;
                  head = head->next;
                  if (head) head->prev = nullptr;
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Reverse a doubly linked list",
          "2. Find pairs with given sum in sorted DLL",
          "3. Remove duplicates from sorted DLL",
          "4. Convert binary tree to DLL (in-order)",
          "5. Clone a DLL with random pointers",
          "6. Find triplets with given sum",
          "7. Rotate DLL by N nodes",
          "8. Implement LRU cache using DLL"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: DLL allows O(1) deletion when node reference is given!"
        puts "💡 TIP: Perfect for implementing LRU cache and browser history"
      end

      class DLLImplementation
        attr_reader :head, :tail
        
        def initialize
          @head = nil
          @tail = nil
        end
        
        def insert_head(data)
          new_node = Node.new(data)
          if @head.nil?
            @head = @tail = new_node
          else
            new_node.next = @head
            @head.prev = new_node
            @head = new_node
          end
        end
        
        def insert_tail(data)
          new_node = Node.new(data)
          if @head.nil?
            @head = @tail = new_node
          else
            @tail.next = new_node
            new_node.prev = @tail
            @tail = new_node
          end
        end
        
        def delete_head
          return if @head.nil?
          
          if @head == @tail
            @head = @tail = nil
          else
            @head = @head.next
            @head.prev = nil
          end
        end
        
        def delete_tail
          return if @tail.nil?
          
          if @head == @tail
            @head = @tail = nil
          else
            @tail = @tail.prev
            @tail.next = nil
          end
        end
        
        def search(data)
          current = @head
          while current
            return true if current.data == data
            current = current.next
          end
          false
        end
        
        def display
          return puts "List is empty" if @head.nil?
          
          current = @head
          result = []
          while current
            result << current.data
            current = current.next
          end
          puts "Forward: #{result.join(' ⇄ ')}"
        end
        
        def display_reverse
          return puts "List is empty" if @tail.nil?
          
          current = @tail
          result = []
          while current
            result << current.data
            current = current.prev
          end
          puts "Backward: #{result.join(' ⇄ ')}"
        end
      end
    end
  end
end
