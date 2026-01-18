module DSAVisualizer
  module DataStructures
    class BST
      class Node
        attr_accessor :value, :left, :right
        
        def initialize(value)
          @value = value
          @left = nil
          @right = nil
        end
      end

      def self.learn
        Visualizer.print_header("BINARY SEARCH TREE - Ordered Binary Tree")
        
        puts "\n📖 CONCEPT:"
        puts "A Binary Search Tree (BST) is a binary tree where:"
        puts "• Left subtree contains nodes with values less than parent"
        puts "• Right subtree contains nodes with values greater than parent"
        puts "• Both left and right subtrees are also BSTs"
        puts "• Enables efficient searching, insertion, and deletion"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Search: O(log n) average, O(n) worst case"
        puts "• Insert: O(log n) average, O(n) worst case"
        puts "• Delete: O(log n) average, O(n) worst case"
        puts "• Traversal: O(n)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_bst
        demonstrate_operations
        demonstrate_traversals
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_bst
        puts "\n" + "="*60
        puts "DEMONSTRATION: Building a BST"
        puts "="*60
        
        bst = BSTImplementation.new
        values = [50, 30, 70, 20, 40, 60, 80]
        
        puts "\nInserting values: #{values.join(', ')}"
        values.each do |val|
          bst.insert(val)
          puts "Inserted #{val}"
        end
        
        puts "\n📊 Tree Structure:"
        puts "        50"
        puts "       /  \\"
        puts "      30   70"
        puts "     / \\   / \\"
        puts "    20 40 60 80"
        
        puts "\n🔍 Searching for values:"
        [40, 90].each do |val|
          result = bst.search(val)
          puts "Search #{val}: #{result ? '✓ Found' : '✗ Not found'}"
        end
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "BST OPERATIONS"
        puts "="*60
        
        bst = BSTImplementation.new
        [50, 30, 70, 20, 40, 60, 80].each { |v| bst.insert(v) }
        
        puts "\n1️⃣  FIND MINIMUM:"
        puts "Minimum value: #{bst.find_min}"
        
        puts "\n2️⃣  FIND MAXIMUM:"
        puts "Maximum value: #{bst.find_max}"
        
        puts "\n3️⃣  DELETE NODE:"
        puts "Deleting 30 (node with two children)..."
        bst.delete(30)
        puts "✓ Deleted successfully"
      end

      def self.demonstrate_traversals
        puts "\n" + "="*60
        puts "TREE TRAVERSALS"
        puts "="*60
        
        bst = BSTImplementation.new
        [50, 30, 70, 20, 40, 60, 80].each { |v| bst.insert(v) }
        
        puts "\n1️⃣  IN-ORDER (Left → Root → Right):"
        puts "Result: #{bst.inorder.join(', ')}"
        puts "Note: Gives sorted order!"
        
        puts "\n2️⃣  PRE-ORDER (Root → Left → Right):"
        puts "Result: #{bst.preorder.join(', ')}"
        
        puts "\n3️⃣  POST-ORDER (Left → Right → Root):"
        puts "Result: #{bst.postorder.join(', ')}"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class Node
            attr_accessor :value, :left, :right
            def initialize(value)
              @value = value
              @left = @right = nil
            end
          end
          
          class BST
            def insert(value, node = @root)
              return Node.new(value) if node.nil?
              if value < node.value
                node.left = insert(value, node.left)
              else
                node.right = insert(value, node.right)
              end
              node
            end
            
            def search(value, node = @root)
              return false if node.nil?
              return true if node.value == value
              value < node.value ? search(value, node.left) : search(value, node.right)
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          struct Node {
              int value;
              Node* left;
              Node* right;
              Node(int val) : value(val), left(nullptr), right(nullptr) {}
          };
          
          class BST {
              Node* root;
          public:
              Node* insert(Node* node, int value) {
                  if (node == nullptr) return new Node(value);
                  if (value < node->value)
                      node->left = insert(node->left, value);
                  else
                      node->right = insert(node->right, value);
                  return node;
              }
              
              bool search(Node* node, int value) {
                  if (node == nullptr) return false;
                  if (node->value == value) return true;
                  return value < node->value ? 
                      search(node->left, value) : search(node->right, value);
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Validate if a binary tree is a valid BST",
          "2. Find the kth smallest element in a BST",
          "3. Convert sorted array to balanced BST",
          "4. Find lowest common ancestor in BST",
          "5. Check if two BSTs are identical",
          "6. Find the inorder successor of a node",
          "7. Convert BST to sorted doubly linked list",
          "8. Find the distance between two nodes"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: In-order traversal of BST gives sorted order!"
        puts "💡 TIP: BST property: left < root < right for all nodes"
      end

      class BSTImplementation
        attr_reader :root
        
        def initialize
          @root = nil
        end
        
        def insert(value)
          @root = insert_recursive(@root, value)
        end
        
        def search(value)
          search_recursive(@root, value)
        end
        
        def delete(value)
          @root = delete_recursive(@root, value)
        end
        
        def find_min
          node = @root
          node = node.left while node&.left
          node&.value
        end
        
        def find_max
          node = @root
          node = node.right while node&.right
          node&.value
        end
        
        def inorder
          result = []
          inorder_recursive(@root, result)
          result
        end
        
        def preorder
          result = []
          preorder_recursive(@root, result)
          result
        end
        
        def postorder
          result = []
          postorder_recursive(@root, result)
          result
        end
        
        private
        
        def insert_recursive(node, value)
          return Node.new(value) if node.nil?
          
          if value < node.value
            node.left = insert_recursive(node.left, value)
          elsif value > node.value
            node.right = insert_recursive(node.right, value)
          end
          
          node
        end
        
        def search_recursive(node, value)
          return false if node.nil?
          return true if node.value == value
          
          value < node.value ? search_recursive(node.left, value) : search_recursive(node.right, value)
        end
        
        def delete_recursive(node, value)
          return nil if node.nil?
          
          if value < node.value
            node.left = delete_recursive(node.left, value)
          elsif value > node.value
            node.right = delete_recursive(node.right, value)
          else
            # Node to delete found
            return node.right if node.left.nil?
            return node.left if node.right.nil?
            
            # Node has two children
            min_node = find_min_node(node.right)
            node.value = min_node.value
            node.right = delete_recursive(node.right, min_node.value)
          end
          
          node
        end
        
        def find_min_node(node)
          node = node.left while node.left
          node
        end
        
        def inorder_recursive(node, result)
          return if node.nil?
          inorder_recursive(node.left, result)
          result << node.value
          inorder_recursive(node.right, result)
        end
        
        def preorder_recursive(node, result)
          return if node.nil?
          result << node.value
          preorder_recursive(node.left, result)
          preorder_recursive(node.right, result)
        end
        
        def postorder_recursive(node, result)
          return if node.nil?
          postorder_recursive(node.left, result)
          postorder_recursive(node.right, result)
          result << node.value
        end
      end
    end
  end
end
