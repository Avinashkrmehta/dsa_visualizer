module DSAVisualizer
  class Comparator
    def self.compare_memory_model(concept)
      case concept
      when :array
        ruby_model = <<~RUBY
          # Ruby Array (Dynamic)
          arr = [1, 2, 3]
          # Internally: Array of object references
          # Each element is a pointer to Ruby object
          # Heap allocated, garbage collected
        RUBY

        cpp_model = <<~CPP
          // C++ Array (Static)
          int arr[3] = {1, 2, 3};
          // Contiguous memory block
          // Direct values, no indirection
          // Stack or heap allocated
        CPP

        explanation = "Ruby arrays store references to objects (indirection), while C++ arrays store actual values in contiguous memory. Ruby provides dynamic sizing with overhead, C++ offers fixed size with better cache locality."

        Visualizer.print_comparison(ruby_model, cpp_model, explanation)

      when :pointer
        ruby_model = <<~RUBY
          # Ruby (No explicit pointers)
          obj = Object.new
          ref = obj  # Reference copy
          # Both point to same object
          # Managed by GC
        RUBY

        cpp_model = <<~CPP
          // C++ (Explicit pointers)
          int* ptr = new int(42);
          int* ref = ptr;  // Pointer copy
          // Manual memory management
          delete ptr;  // Must free
        CPP

        explanation = "Ruby abstracts pointers as object references with automatic memory management. C++ exposes raw pointers requiring manual allocation/deallocation, offering more control but more responsibility."

        Visualizer.print_comparison(ruby_model, cpp_model, explanation)
      end
    end

    def self.compare_complexity(operation, ruby_complexity, cpp_complexity, explanation)
      puts "\n⏱️  Time Complexity Comparison:".colorize(:yellow).bold
      puts "   Operation: #{operation}"
      puts "   Ruby:  #{ruby_complexity}".colorize(:red)
      puts "   C++:   #{cpp_complexity}".colorize(:green)
      puts "   Why: #{explanation}"
    end
  end
end
