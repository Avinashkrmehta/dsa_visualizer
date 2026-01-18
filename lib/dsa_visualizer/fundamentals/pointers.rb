module DSAVisualizer
  module Fundamentals
    class Pointers
      def self.learn
        Visualizer.print_header("POINTERS & REFERENCES - The Foundation of Data Structures")
        
        puts "\n📖 WHAT ARE POINTERS?".colorize(:cyan).bold
        puts "─" * 80
        puts "A pointer is a variable that stores a memory address."
        puts "It 'points to' another variable's location in memory."
        
        # Basic Concept
        Visualizer.print_section("1. Pointer Basics")
        
        puts "\nMemory Visualization:"
        puts "┌─────────┬──────────┬─────────┐"
        puts "│ Address │   Name   │  Value  │"
        puts "├─────────┼──────────┼─────────┤"
        puts "│ 0x1000  │   x      │   42    │ ← Regular variable"
        puts "│ 0x1004  │   ptr    │ 0x1000  │ ← Pointer (stores address of x)"
        puts "└─────────┴──────────┴─────────┘"
        
        # Ruby vs C++
        Visualizer.print_section("2. Ruby References vs C++ Pointers")
        
        ruby_code = <<~RUBY
          # Ruby - No explicit pointers
          # Everything is an object reference
          
          x = 42
          y = x  # y references same object
          
          puts x.object_id  # Memory address
          puts y.object_id  # Same address!
          
          # For immutable objects (numbers, symbols):
          x = 43  # Creates NEW object
          # y still references old object (42)
          
          # For mutable objects (arrays, hashes):
          arr1 = [1, 2, 3]
          arr2 = arr1  # Both reference same array
          arr2 << 4    # Modifies shared array
          puts arr1    # [1, 2, 3, 4]
        RUBY
        
        cpp_code = <<~CPP
          // C++ - Explicit pointers
          
          int x = 42;
          int* ptr = &x;  // ptr stores address of x
          
          cout << x;      // 42 (value)
          cout << &x;     // 0x1000 (address)
          cout << ptr;    // 0x1000 (address stored in ptr)
          cout << *ptr;   // 42 (dereference - get value)
          
          *ptr = 43;      // Modify x through pointer
          cout << x;      // 43 (x changed!)
          
          // Pointer arithmetic
          int arr[] = {1, 2, 3};
          int* p = arr;   // Points to first element
          p++;            // Now points to second element
          cout << *p;     // 2
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Ruby uses implicit references (managed by GC). C++ uses explicit pointers (manual control).")
        
        # Pointer Operations
        Visualizer.print_section("3. C++ Pointer Operations")
        
        puts "\n🔹 Declaration:"
        puts "  int* ptr;        // Pointer to int"
        puts "  int *ptr;        // Same thing (style choice)"
        puts "  int* p1, p2;     // p1 is pointer, p2 is int! (confusing)"
        puts "  int *p1, *p2;    // Both are pointers"
        
        puts "\n🔹 Address-of operator (&):"
        puts "  int x = 10;"
        puts "  int* ptr = &x;   // Get address of x"
        
        puts "\n🔹 Dereference operator (*):"
        puts "  int value = *ptr; // Get value at address"
        puts "  *ptr = 20;        // Set value at address"
        
        puts "\n🔹 Null pointer:"
        puts "  int* ptr = nullptr;  // C++11 (preferred)"
        puts "  int* ptr = NULL;     // Old style"
        puts "  int* ptr = 0;        // Also works"
        
        # Pointer Arithmetic
        Visualizer.print_section("4. Pointer Arithmetic")
        
        puts "\nArray in memory:"
        puts "┌────┬────┬────┬────┬────┐"
        puts "│ 10 │ 20 │ 30 │ 40 │ 50 │"
        puts "└────┴────┴────┴────┴────┘"
        puts "0x100 0x104 0x108 0x10C 0x110  (each int = 4 bytes)"
        
        cpp_code = <<~CPP
          int arr[] = {10, 20, 30, 40, 50};
          int* ptr = arr;  // Points to arr[0]
          
          cout << *ptr;      // 10
          cout << *(ptr+1);  // 20 (moves 4 bytes, not 1!)
          cout << *(ptr+2);  // 30
          
          ptr++;             // Now points to arr[1]
          cout << *ptr;      // 20
          
          // Array indexing is pointer arithmetic!
          arr[2] == *(arr + 2)  // TRUE!
        CPP
        
        puts "\n#{cpp_code}"
        puts "\n💡 Key Insight: ptr+1 doesn't add 1 byte, it adds sizeof(int) bytes!"
        puts "   The compiler knows the type and adjusts automatically."
        
        # Pointers and Arrays
        Visualizer.print_section("5. Pointers and Arrays")
        
        cpp_code = <<~CPP
          int arr[5] = {1, 2, 3, 4, 5};
          int* ptr = arr;  // Array name is pointer to first element
          
          // These are equivalent:
          arr[0]  ==  *arr      ==  *(arr + 0)
          arr[1]  ==  *(arr+1)  ==  ptr[1]
          arr[2]  ==  *(ptr+2)  ==  ptr[2]
          
          // Passing array to function:
          void process(int* arr, int size) {
            // arr is just a pointer!
            // Size information is lost
          }
        CPP
        
        puts "\n#{cpp_code}"
        
        # Pointers in Data Structures
        Visualizer.print_section("6. Pointers in Data Structures")
        
        puts "\n🔗 Linked List Node:"
        cpp_code = <<~CPP
          struct Node {
            int data;
            Node* next;  // Pointer to next node
          };
          
          Node* head = new Node{10, nullptr};
          head->next = new Node{20, nullptr};
          head->next->next = new Node{30, nullptr};
          
          // Traversal:
          Node* current = head;
          while(current != nullptr) {
            cout << current->data;
            current = current->next;  // Move to next node
          }
        CPP
        puts cpp_code
        
        puts "\n🌳 Binary Tree Node:"
        cpp_code = <<~CPP
          struct TreeNode {
            int data;
            TreeNode* left;   // Pointer to left child
            TreeNode* right;  // Pointer to right child
          };
          
          TreeNode* root = new TreeNode{50, nullptr, nullptr};
          root->left = new TreeNode{30, nullptr, nullptr};
          root->right = new TreeNode{70, nullptr, nullptr};
        CPP
        puts cpp_code
        
        # Ruby Equivalent
        Visualizer.print_section("7. Ruby's Object References")
        
        ruby_code = <<~RUBY
          # Ruby doesn't have pointers, but references work similarly
          
          class Node
            attr_accessor :data, :next
            def initialize(data)
              @data = data
              @next = nil  # Reference to next node
            end
          end
          
          head = Node.new(10)
          head.next = Node.new(20)
          head.next.next = Node.new(30)
          
          # Traversal:
          current = head
          while current
            puts current.data
            current = current.next  # Follow reference
          end
          
          # Key difference: No manual memory management!
          # GC handles cleanup automatically
        RUBY
        
        puts ruby_code
        
        # Common Pointer Errors
        Visualizer.print_section("8. Common Pointer Errors (C++)")
        
        puts "\n❌ 1. Dangling Pointer:"
        puts "```cpp"
        puts "int* ptr = new int(42);"
        puts "delete ptr;"
        puts "cout << *ptr;  // ERROR! Memory freed, pointer still points there"
        puts "ptr = nullptr; // Good practice after delete"
        puts "```"
        
        puts "\n❌ 2. Memory Leak:"
        puts "```cpp"
        puts "int* ptr = new int(42);"
        puts "ptr = new int(100);  // Lost reference to first allocation!"
        puts "// First allocation leaked - can't free it now"
        puts "```"
        
        puts "\n❌ 3. Null Pointer Dereference:"
        puts "```cpp"
        puts "int* ptr = nullptr;"
        puts "cout << *ptr;  // CRASH! Can't dereference null"
        puts "// Always check: if(ptr != nullptr) { *ptr = 10; }"
        puts "```"
        
        puts "\n❌ 4. Wild Pointer:"
        puts "```cpp"
        puts "int* ptr;  // Uninitialized! Contains garbage"
        puts "*ptr = 42; // CRASH! Writing to random memory"
        puts "// Always initialize: int* ptr = nullptr;"
        puts "```"
        
        # Smart Pointers
        Visualizer.print_section("9. Modern C++ Smart Pointers")
        
        puts "\n✅ Smart pointers provide automatic memory management:"
        
        cpp_code = <<~CPP
          #include <memory>
          
          // unique_ptr - Single ownership
          std::unique_ptr<int> ptr1(new int(42));
          // or better:
          auto ptr1 = std::make_unique<int>(42);
          // Automatically deleted when out of scope!
          
          // shared_ptr - Shared ownership (reference counting)
          std::shared_ptr<int> ptr2 = std::make_shared<int>(42);
          std::shared_ptr<int> ptr3 = ptr2;  // Both own it
          // Deleted when last shared_ptr goes out of scope
          
          // weak_ptr - Non-owning reference (breaks cycles)
          std::weak_ptr<int> ptr4 = ptr2;
          // Doesn't prevent deletion
        CPP
        
        puts cpp_code
        
        # Notes
        notes = [
          "Pointer stores memory address, not the value itself",
          "& (address-of) gets address, * (dereference) gets value",
          "Ruby uses implicit references, C++ uses explicit pointers",
          "Array name is pointer to first element in C++",
          "Pointer arithmetic: ptr+1 moves by sizeof(type) bytes",
          "Always initialize pointers (nullptr in C++)",
          "Check for nullptr before dereferencing",
          "Use smart pointers in modern C++ (unique_ptr, shared_ptr)",
          "Ruby's GC eliminates pointer management complexity"
        ]
        NotesManager.print_notes("Pointers & References", notes)
        
        # Key Points
        key_points = [
          "Pointers enable dynamic data structures (linked lists, trees, graphs)",
          "Ruby abstracts pointers as object references with automatic GC",
          "C++ pointers give control but require careful management",
          "Null pointer dereference is a common crash cause",
          "Memory leaks happen when you lose pointer to allocated memory",
          "Smart pointers (C++11+) provide safety with RAII",
          "Understanding pointers is crucial for DSA implementation"
        ]
        NotesManager.print_key_points(key_points)
        
        # Common Mistakes
        mistakes = [
          "Dereferencing null or uninitialized pointer (crash!)",
          "Using pointer after freeing memory (dangling pointer)",
          "Forgetting to free allocated memory (memory leak)",
          "Confusing pointer and value (missing * or &)",
          "Array out of bounds with pointer arithmetic",
          "Double-freeing same memory (crash!)"
        ]
        NotesManager.print_common_mistakes(mistakes)
        
        puts "\n💡 PRO TIP:".colorize(:yellow).bold
        puts "In C++, prefer references (&) for function parameters when you don't need"
        puts "pointer arithmetic or reassignment. Use smart pointers for ownership."
      end
    end
  end
end
