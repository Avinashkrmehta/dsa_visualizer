module DSAVisualizer
  module DataStructures
    class Trie
      class TrieNode
        attr_accessor :children, :is_end_of_word
        
        def initialize
          @children = {}
          @is_end_of_word = false
        end
      end

      def self.learn
        Visualizer.print_header("TRIE - Prefix Tree")
        
        puts "\n📖 CONCEPT:"
        puts "A Trie (Prefix Tree) is a tree-like data structure for storing strings:"
        puts "• Each node represents a character"
        puts "• Root represents empty string"
        puts "• Path from root to node = prefix"
        puts "• Efficient for prefix-based operations"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Insert: O(m) where m = word length"
        puts "• Search: O(m)"
        puts "• Prefix search: O(m)"
        puts "• Delete: O(m)"
        
        puts "\n💾 SPACE COMPLEXITY: O(ALPHABET_SIZE * N * M)"
        
        demonstrate_trie
        demonstrate_operations
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_trie
        puts "\n" + "="*60
        puts "DEMONSTRATION: Building a Trie"
        puts "="*60
        
        trie = TrieImplementation.new
        words = ["cat", "car", "card", "care", "dog", "dodge"]
        
        puts "\nInserting words: #{words.join(', ')}"
        words.each { |word| trie.insert(word) }
        
        puts "\n📊 Trie Structure:"
        puts "        root"
        puts "       /    \\"
        puts "      c      d"
        puts "      |      |"
        puts "      a      o"
        puts "     / \\     |"
        puts "    t   r    g"
        puts "        |\\   |"
        puts "        d e  e"
        puts "        |    |"
        puts "        e    (dodge)"
        
        puts "\n🔍 Searching:"
        ["cat", "can", "card"].each do |word|
          result = trie.search(word)
          puts "Search '#{word}': #{result ? '✓ Found' : '✗ Not found'}"
        end
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "TRIE OPERATIONS"
        puts "="*60
        
        trie = TrieImplementation.new
        ["apple", "app", "application", "apply"].each { |w| trie.insert(w) }
        
        puts "\n1️⃣  PREFIX SEARCH:"
        prefix = "app"
        words = trie.words_with_prefix(prefix)
        puts "Words starting with '#{prefix}': #{words.join(', ')}"
        
        puts "\n2️⃣  AUTOCOMPLETE:"
        puts "Type 'appl'..."
        suggestions = trie.words_with_prefix("appl")
        puts "Suggestions: #{suggestions.join(', ')}"
        
        puts "\n3️⃣  COUNT WORDS:"
        puts "Total words: #{trie.count_words}"
        
        puts "\n4️⃣  LONGEST PREFIX:"
        puts "Longest common prefix: '#{trie.longest_common_prefix}'"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class TrieNode
            attr_accessor :children, :is_end_of_word
            def initialize
              @children = {}
              @is_end_of_word = false
            end
          end
          
          class Trie
            def initialize
              @root = TrieNode.new
            end
            
            def insert(word)
              node = @root
              word.each_char do |char|
                node.children[char] ||= TrieNode.new
                node = node.children[char]
              end
              node.is_end_of_word = true
            end
            
            def search(word)
              node = @root
              word.each_char do |char|
                return false unless node.children[char]
                node = node.children[char]
              end
              node.is_end_of_word
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          struct TrieNode {
              unordered_map<char, TrieNode*> children;
              bool isEndOfWord;
              TrieNode() : isEndOfWord(false) {}
          };
          
          class Trie {
              TrieNode* root;
          public:
              Trie() { root = new TrieNode(); }
              
              void insert(string word) {
                  TrieNode* node = root;
                  for (char c : word) {
                      if (!node->children[c])
                          node->children[c] = new TrieNode();
                      node = node->children[c];
                  }
                  node->isEndOfWord = true;
              }
              
              bool search(string word) {
                  TrieNode* node = root;
                  for (char c : word) {
                      if (!node->children[c]) return false;
                      node = node->children[c];
                  }
                  return node->isEndOfWord;
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Implement autocomplete system",
          "2. Word search in 2D grid",
          "3. Design search autocomplete system",
          "4. Replace words (dictionary)",
          "5. Longest word in dictionary",
          "6. Add and search word (with wildcards)",
          "7. Word break problem",
          "8. Maximum XOR of two numbers"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Trie is perfect for prefix-based searches!"
        puts "💡 TIP: Space-time tradeoff: uses more space for faster search"
      end

      class TrieImplementation
        def initialize
          @root = TrieNode.new
        end
        
        def insert(word)
          node = @root
          word.each_char do |char|
            node.children[char] ||= TrieNode.new
            node = node.children[char]
          end
          node.is_end_of_word = true
        end
        
        def search(word)
          node = find_node(word)
          node && node.is_end_of_word
        end
        
        def starts_with(prefix)
          !find_node(prefix).nil?
        end
        
        def words_with_prefix(prefix)
          node = find_node(prefix)
          return [] unless node
          
          words = []
          collect_words(node, prefix, words)
          words
        end
        
        def count_words
          count_words_recursive(@root)
        end
        
        def longest_common_prefix
          return "" if @root.children.empty?
          
          prefix = ""
          node = @root
          
          while node.children.size == 1 && !node.is_end_of_word
            char = node.children.keys.first
            prefix += char
            node = node.children[char]
          end
          
          prefix
        end
        
        private
        
        def find_node(word)
          node = @root
          word.each_char do |char|
            return nil unless node.children[char]
            node = node.children[char]
          end
          node
        end
        
        def collect_words(node, prefix, words)
          words << prefix if node.is_end_of_word
          
          node.children.each do |char, child_node|
            collect_words(child_node, prefix + char, words)
          end
        end
        
        def count_words_recursive(node)
          count = node.is_end_of_word ? 1 : 0
          node.children.each_value do |child|
            count += count_words_recursive(child)
          end
          count
        end
      end
    end
  end
end
