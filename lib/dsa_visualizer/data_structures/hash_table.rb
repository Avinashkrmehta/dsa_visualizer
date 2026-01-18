module DSAVisualizer
  module DataStructures
    class HashTable
      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("HASH TABLE - Core Level Visualization")
        
        Visualizer.print_section("1. Hash Table Concept")
        puts "\nKey-Value storage with O(1) average access time"
        puts "Uses hash function to map keys to array indices"
        
        Visualizer.print_section("2. Implementation Comparison")
        
        ruby_code = <<~RUBY
          hash = { "name" => "Alice", "age" => 30 }
          
          # Ruby Hash internals:
          # - Uses MurmurHash
          # - Open addressing with linear probing
          # - Maintains insertion order (since Ruby 1.9)
          # - Automatic resizing at 75% capacity
        RUBY

        cpp_code = <<~CPP
          #include <unordered_map>
          std::unordered_map<std::string, int> map;
          map["name"] = "Alice";
          
          // C++ unordered_map:
          // - Uses hash function (std::hash)
          // - Separate chaining (linked lists)
          // - No order guarantee
          // - Rehashing at load factor threshold
        CPP

        explanation = "Ruby Hash maintains insertion order and uses open addressing. C++ unordered_map uses separate chaining and doesn't maintain order. Both provide O(1) average case, O(n) worst case."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        Visualizer.print_section("3. Hash Function Demo")
        
        keys = ["apple", "banana", "cherry"]
        puts "\nHash values for keys:"
        keys.each do |key|
          hash_val = key.hash
          bucket = hash_val % 10
          puts "  '#{key}' → hash: #{hash_val} → bucket: #{bucket}"
        end
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. Hash tables provide O(1) average lookup"
        puts "  2. Collision handling: chaining vs open addressing"
        puts "  3. Ruby maintains order, C++ doesn't"
        puts "  4. Load factor triggers resizing"
      end
    end
  end
end
