module DSAVisualizer
  module Fundamentals
    class Memory
      def self.learn
        Visualizer.print_header("MEMORY MANAGEMENT - How Data Lives in Computer Memory")
        
        # Introduction
        puts "\n📖 UNDERSTANDING COMPUTER MEMORY".colorize(:cyan).bold
        puts "─" * 80
        puts "Memory is organized in a hierarchy:"
        puts "  Registers (fastest, smallest) → Cache → RAM → Disk (slowest, largest)"
        puts "\nWe primarily work with RAM (Random Access Memory)"
        
        # Memory Layout
        Visualizer.print_section("1. Memory Layout of a Program")
        puts "\n┌─────────────────────┐ High Address"
        puts "│   Command Line Args │"
        puts "├─────────────────────┤"
        puts "│   Stack             │ ← Grows downward"
        puts "│   (Local variables) │   Function calls"
        puts "│   (Function calls)  │   Automatic cleanup"
        puts "├─────────────────────┤"
        puts "│         ↓           │"
        puts "│                     │"
        puts "│         ↑           │"
        puts "├─────────────────────┤"
        puts "│   Heap              │ ← Grows upward"
        puts "│   (Dynamic memory)  │   Manual/GC managed"
        puts "│   (Objects)         │   Flexible size"
        puts "├─────────────────────┤"
        puts "│   BSS (Uninitialized)│"
        puts "├─────────────────────┤"
        puts "│   Data (Initialized)│"
        puts "├─────────────────────┤"
        puts "│   Text (Code)       │"
        puts "└─────────────────────┘ Low Address"
        
        # Stack vs Heap
        Visualizer.print_section("2. Stack vs Heap Memory")
        
        puts "\n🔵 STACK MEMORY:".colorize(:blue).bold
        puts "  • Fast allocation/deallocation (just move stack pointer)"
        puts "  • Limited size (typically 1-8 MB)"
        puts "  • Automatic cleanup (LIFO - Last In First Out)"
        puts "  • Stores: local variables, function parameters, return addresses"
        puts "  • Contiguous memory"
        
        puts "\n🟢 HEAP MEMORY:".colorize(:green).bold
        puts "  • Slower allocation (must find free block)"
        puts "  • Large size (limited by system RAM)"
        puts "  • Manual management (C++) or Garbage Collection (Ruby)"
        puts "  • Stores: dynamically allocated objects, large data structures"
        puts "  • Fragmented memory possible"
        
        # Ruby vs C++ Memory Management
        Visualizer.print_section("3. Ruby vs C++ Memory Management")
        
        ruby_code = <<~RUBY
          # Ruby - Automatic Memory Management
          def create_array
            arr = [1, 2, 3, 4, 5]  # Heap allocated
            # Ruby's GC will clean up automatically
            arr
          end
          
          result = create_array
          # 'arr' in function is gone (stack)
          # but array object still exists (heap)
          # GC tracks references
          
          # When no references exist:
          result = nil  # Array becomes eligible for GC
        RUBY
        
        cpp_code = <<~CPP
          // C++ - Manual Memory Management
          int* createArray() {
            int* arr = new int[5]{1,2,3,4,5};  // Heap
            // Must manually delete!
            return arr;
          }
          
          int* result = createArray();
          // Use the array...
          
          delete[] result;  // MUST free memory!
          result = nullptr; // Good practice
          
          // Forgetting delete[] = memory leak!
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Ruby uses Garbage Collection (automatic). C++ requires manual memory management with new/delete.")
        
        # Stack Example
        Visualizer.print_section("4. Stack Memory Example")
        
        ruby_code = <<~RUBY
          def factorial(n)
            return 1 if n <= 1
            n * factorial(n - 1)
          end
          
          factorial(4)
          
          # Call Stack:
          # factorial(4) → calls factorial(3)
          # factorial(3) → calls factorial(2)
          # factorial(2) → calls factorial(1)
          # factorial(1) → returns 1
          # Then unwinds: 2*1, 3*2, 4*6 = 24
        RUBY
        
        cpp_code = <<~CPP
          int factorial(int n) {
            if(n <= 1) return 1;
            return n * factorial(n - 1);
          }
          
          factorial(4);
          
          // Stack frames:
          // [factorial(4)] ← top
          // [factorial(3)]
          // [factorial(2)]
          // [factorial(1)] ← base
          // Each frame stores: n, return address
        CPP
        
        puts "\nStack Frame Visualization:"
        puts "┌──────────────────┐"
        puts "│ factorial(4)     │ ← Current"
        puts "│ n=4, ret_addr    │"
        puts "├──────────────────┤"
        puts "│ factorial(3)     │"
        puts "│ n=3, ret_addr    │"
        puts "├──────────────────┤"
        puts "│ factorial(2)     │"
        puts "│ n=2, ret_addr    │"
        puts "├──────────────────┤"
        puts "│ factorial(1)     │"
        puts "│ n=1, ret_addr    │"
        puts "└──────────────────┘"
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Both use call stack for recursion. Deep recursion can cause stack overflow!")
        
        # Heap Example
        Visualizer.print_section("5. Heap Memory Example")
        
        ruby_code = <<~RUBY
          class Node
            attr_accessor :data, :next
            def initialize(data)
              @data = data
              @next = nil
            end
          end
          
          # Creating linked list
          head = Node.new(10)      # Heap allocated
          head.next = Node.new(20) # Heap allocated
          head.next.next = Node.new(30)
          
          # All Node objects on heap
          # GC tracks references
          # When head = nil, all become eligible for GC
        RUBY
        
        cpp_code = <<~CPP
          struct Node {
            int data;
            Node* next;
          };
          
          // Creating linked list
          Node* head = new Node{10, nullptr};
          head->next = new Node{20, nullptr};
          head->next->next = new Node{30, nullptr};
          
          // Must manually free each node!
          Node* temp;
          while(head) {
            temp = head;
            head = head->next;
            delete temp;  // Free each node
          }
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code,
          "Heap allows dynamic sizing. Ruby's GC vs C++'s manual delete. Memory leaks happen when you forget to free!")
        
        # Memory Leaks
        Visualizer.print_section("6. Memory Leaks")
        
        puts "\n❌ Common Memory Leak in C++:"
        puts "```cpp"
        puts "void leak() {"
        puts "  int* arr = new int[1000];"
        puts "  // Forgot to delete[]!"
        puts "  // Memory is lost forever (until program ends)"
        puts "}"
        puts "```"
        
        puts "\n✅ Proper Memory Management:"
        puts "```cpp"
        puts "void noLeak() {"
        puts "  int* arr = new int[1000];"
        puts "  // Use the array..."
        puts "  delete[] arr;  // Clean up!"
        puts "}"
        puts "```"
        
        puts "\n✅ Modern C++ (RAII - Resource Acquisition Is Initialization):"
        puts "```cpp"
        puts "void modern() {"
        puts "  std::vector<int> arr(1000);  // Automatic cleanup!"
        puts "  std::unique_ptr<int[]> ptr(new int[1000]);"
        puts "  // Automatically deleted when out of scope"
        puts "}"
        puts "```"
        
        # Cache Locality
        Visualizer.print_section("7. Cache Locality & Performance")
        
        puts "\nCPU Cache is much faster than RAM:"
        puts "  L1 Cache: ~1 ns"
        puts "  L2 Cache: ~4 ns"
        puts "  L3 Cache: ~10 ns"
        puts "  RAM:      ~100 ns"
        
        puts "\n🚀 Good Cache Locality (Array):"
        puts "  [1][2][3][4][5] ← Contiguous memory"
        puts "  CPU loads chunk into cache"
        puts "  Accessing next element is fast (already in cache)"
        
        puts "\n🐌 Poor Cache Locality (Linked List):"
        puts "  [1]→...→[2]→...→[3]→...→[4] ← Scattered memory"
        puts "  Each access might miss cache"
        puts "  Must fetch from RAM (100× slower!)"
        
        # Important Notes
        notes = [
          "Stack: Fast, automatic, limited size, LIFO structure",
          "Heap: Flexible, larger, requires management (manual or GC)",
          "Ruby uses Garbage Collection - automatic but has overhead",
          "C++ requires manual memory management - fast but error-prone",
          "Modern C++ uses RAII and smart pointers for safety",
          "Stack overflow happens with deep recursion or large local arrays",
          "Memory leaks occur when heap memory isn't freed",
          "Cache locality matters - contiguous memory is faster",
          "Pointer size: 8 bytes on 64-bit systems, 4 bytes on 32-bit"
        ]
        NotesManager.print_notes("Memory Management", notes)
        
        # Key Points
        key_points = [
          "Stack is for local variables, Heap is for dynamic allocation",
          "Ruby's GC trades performance for safety and convenience",
          "C++ gives control but requires discipline (use smart pointers!)",
          "Arrays have better cache locality than linked lists",
          "Deep recursion uses stack memory - can cause overflow",
          "Always free what you allocate in C++ (or use RAII)",
          "Memory alignment affects performance (CPU reads in chunks)"
        ]
        NotesManager.print_key_points(key_points)
        
        # Common Mistakes
        mistakes = [
          "Forgetting to delete[] in C++ (memory leak)",
          "Deleting same memory twice (double free - crash!)",
          "Using memory after freeing it (dangling pointer)",
          "Creating too deep recursion (stack overflow)",
          "Allocating huge arrays on stack (use heap instead)",
          "Not considering cache locality in performance-critical code"
        ]
        NotesManager.print_common_mistakes(mistakes)
        
        puts "\n💡 PRO TIP:".colorize(:yellow).bold
        puts "In C++, prefer std::vector over raw arrays, and std::unique_ptr/shared_ptr"
        puts "over raw pointers. They provide automatic memory management!"
      end
    end
  end
end
