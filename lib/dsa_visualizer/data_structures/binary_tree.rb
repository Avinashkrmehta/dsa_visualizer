module DSAVisualizer
  module DataStructures
    class TreeNode
      attr_accessor :value, :left, :right
      
      def initialize(value)
        @value = value
        @left = nil
        @right = nil
      end
    end

    class BinaryTree
      attr_reader :root

      def initialize
        @root = nil
      end

      def insert(value)
        @root = insert_recursive(@root, value)
      end

      private

      def insert_recursive(node, value)
        return TreeNode.new(value) if node.nil?
        
        if value < node.value
          node.left = insert_recursive(node.left, value)
        else
          node.right = insert_recursive(node.right, value)
        end
        node
      end

      public

      def self.learn
        demo
      end
      
      def self.demo
        Visualizer.print_header("BINARY SEARCH TREE - Core Level Visualization")
        
        Visualizer.print_section("1. BST Concept")
        puts "\nBinary Search Tree properties:"
        puts "  - Left subtree < node < right subtree"
        puts "  - Enables O(log n) search in balanced tree"
        puts "  - Can degrade to O(n) if unbalanced"
        
        Visualizer.print_section("2. Implementation Comparison")
        
        ruby_code = <<~RUBY
          class TreeNode
            attr_accessor :value, :left, :right
            def initialize(value)
              @value = value
              @left = @right = nil
            end
          end
          
          # Ruby: object references for children
          # GC handles memory
        RUBY

        cpp_code = <<~CPP
          struct TreeNode {
            int value;
            TreeNode *left, *right;
            TreeNode(int v) : value(v), 
              left(nullptr), right(nullptr) {}
          };
          
          // C++: explicit pointers
          // Manual memory management
        CPP

        explanation = "Both use pointer-based structure. Ruby uses object references with GC, C++ uses raw pointers requiring manual deletion. Tree traversal is same in both."
        
        Visualizer.print_comparison(ruby_code, cpp_code, explanation)
        
        tree = BinaryTree.new
        values = [50, 30, 70, 20, 40, 60, 80]
        
        Visualizer.print_step(1, "Inserting values: #{values.join(', ')}")
        values.each { |v| tree.insert(v) }
        
        puts "\nTree structure:"
        puts "        50"
        puts "       /  \\"
        puts "      30   70"
        puts "     / \\   / \\"
        puts "    20 40 60 80"
        
        puts "\n\n🎯 Key Takeaways:".colorize(:green).bold
        puts "  1. BST enables efficient searching: O(log n) average"
        puts "  2. Insertion/deletion: O(log n) average"
        puts "  3. Worst case O(n) for unbalanced tree"
        puts "  4. Self-balancing trees (AVL, Red-Black) maintain O(log n)"
      end
    end
  end
end
