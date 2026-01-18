module DSAVisualizer
  module DataStructures
    class Array
      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("ARRAY - Core Level Visualization")
        
        # Memory Model Comparison
        Visualizer.print_section("1. Memory Model")
        Comparator.compare_memory_model(:array)
        
        # Creation and Memory Allocation
        Visualizer.print_section("2. Array Creation")
        tracker = MemoryTracker.new
        
        Visualizer.print_step(1, "Creating array in Ruby")
        arr = [10, 20, 30, 40, 50]
        tracker.track_allocation("Array", arr.size, arr)
        
        puts "\nRuby internals:"
        puts "  - Array object created on heap"
        puts "  - Stores references to Integer objects"
        puts "  - Dynamic resizing capability"
        Visualizer.visualize_memory_layout("Ruby Array", arr)
        
        puts "\nC++ equivalent:"
        puts "  int arr[5] = {10, 20, 30, 40, 50};"
        puts "  - Contiguous memory block"
        puts "  - Each int: 4 bytes"
        puts "  - Total: 20 bytes (5 × 4)"
        puts "  - Stack allocated (if local)"
        
        # Access Operation
        Visualizer.print_section("3. Element Access")
        Visualizer.print_step(2, "Accessing element at index 2")
        
        element = arr[2]
        tracker.track_operation("Access", "arr[2] = #{element}")
        Visualizer.visualize_array(arr, 2)
        
        puts "\n🔍 Ruby Process:"
        puts "  1. Check bounds (raises error if out of range)"
        puts "  2. Calculate: base_address + (index × pointer_size)"
        puts "  3. Dereference pointer to get object"
        puts "  4. Return object reference"
        
        puts "\n🔍 C++ Process:"
        puts "  1. Calculate: base_address + (index × sizeof(int))"
        puts "  2. Direct memory access"
        puts "  3. Return value (no indirection)"
        
        Comparator.compare_complexity(
          "Array Access",
          "O(1) - with bounds checking overhead",
          "O(1) - direct memory access",
          "Both are constant time, but C++ is faster due to no bounds checking and direct value access"
        )
        
        # Insertion
        Visualizer.print_section("4. Insertion")
        Visualizer.print_step(3, "Inserting 25 at index 2")
        
        puts "\nBefore:"
        Visualizer.visualize_array(arr)
        
        arr.insert(2, 25)
        tracker.track_operation("Insert", "Inserted 25 at index 2")
        
        puts "\nAfter:"
        Visualizer.visualize_array(arr, 2)
        
        puts "\n🔄 Ruby Process:"
        puts "  1. Check if resize needed (capacity vs size)"
        puts "  2. If needed: allocate new array (2× capacity)"
        puts "  3. Shift elements right from index 2"
        puts "  4. Insert new element"
        puts "  5. Update size"
        
        puts "\n🔄 C++ Process (std::vector):"
        puts "  1. Check capacity"
        puts "  2. If needed: allocate new memory"
        puts "  3. Copy elements to new location"
        puts "  4. Shift elements using memmove"
        puts "  5. Insert element"
        
        Comparator.compare_complexity(
          "Array Insertion (middle)",
          "O(n) - must shift elements",
          "O(n) - must shift elements",
          "Both require shifting elements. Ruby has additional overhead from object reference management."
        )
        
        # Memory Summary
        tracker.print_summary
        
        # Key Takeaways
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Ruby arrays are dynamic and store object references"
        puts "  2. C++ arrays can be static (fixed) or dynamic (std::vector)"
        puts "  3. Ruby provides safety (bounds checking) at cost of performance"
        puts "  4. C++ provides speed at cost of safety (manual management)"
        puts "  5. Both use contiguous memory, but Ruby adds indirection layer"
      end
    end
  end
end
