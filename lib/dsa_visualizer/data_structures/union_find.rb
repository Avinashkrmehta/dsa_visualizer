module DSAVisualizer
  module DataStructures
    class UnionFind
      def self.learn
        Visualizer.print_header("UNION-FIND (Disjoint Set)")
        
        puts "\n📖 CONCEPT:"
        puts "Union-Find (Disjoint Set Union) tracks connected components:"
        puts "• Find: Determine which set an element belongs to"
        puts "• Union: Merge two sets together"
        puts "• Path compression: Flatten tree during find"
        puts "• Union by rank: Attach smaller tree to larger"
        
        puts "\n⏱️  TIME COMPLEXITY:"
        puts "• Find: O(α(n)) ≈ O(1) amortized"
        puts "• Union: O(α(n)) ≈ O(1) amortized"
        puts "• α(n) is inverse Ackermann function (very slow growing)"
        
        puts "\n💾 SPACE COMPLEXITY: O(n)"
        
        demonstrate_union_find
        demonstrate_operations
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_union_find
        puts "\n" + "="*60
        puts "DEMONSTRATION: Union-Find Operations"
        puts "="*60
        
        uf = UnionFindImplementation.new(10)
        
        puts "\nInitial state: Each element is its own set"
        puts "Sets: {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}"
        
        puts "\nPerforming unions:"
        unions = [[0, 1], [2, 3], [4, 5], [6, 7], [0, 2], [4, 6]]
        unions.each do |a, b|
          uf.union(a, b)
          puts "Union(#{a}, #{b})"
        end
        
        puts "\n📊 Current sets:"
        puts "Set 1: {0, 1, 2, 3}"
        puts "Set 2: {4, 5, 6, 7}"
        puts "Set 3: {8}"
        puts "Set 4: {9}"
        
        puts "\nNumber of components: #{uf.count}"
      end

      def self.demonstrate_operations
        puts "\n" + "="*60
        puts "UNION-FIND OPERATIONS"
        puts "="*60
        
        uf = UnionFindImplementation.new(6)
        
        puts "\n1️⃣  FIND OPERATION:"
        puts "Find(0): #{uf.find(0)}"
        puts "Find(3): #{uf.find(3)}"
        
        puts "\n2️⃣  UNION OPERATION:"
        uf.union(0, 1)
        uf.union(2, 3)
        puts "After Union(0,1) and Union(2,3)"
        puts "Connected(0, 1): #{uf.connected?(0, 1)}"
        puts "Connected(0, 2): #{uf.connected?(0, 2)}"
        
        puts "\n3️⃣  CHECK CONNECTIVITY:"
        uf.union(1, 2)
        puts "After Union(1,2)"
        puts "Connected(0, 3): #{uf.connected?(0, 3)}"
        
        puts "\n4️⃣  COUNT COMPONENTS:"
        puts "Number of disjoint sets: #{uf.count}"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          class UnionFind
            def initialize(n)
              @parent = (0...n).to_a
              @rank = Array.new(n, 0)
            end
            
            def find(x)
              if @parent[x] != x
                @parent[x] = find(@parent[x])  # Path compression
              end
              @parent[x]
            end
            
            def union(x, y)
              root_x = find(x)
              root_y = find(y)
              return if root_x == root_y
              
              # Union by rank
              if @rank[root_x] < @rank[root_y]
                @parent[root_x] = root_y
              elsif @rank[root_x] > @rank[root_y]
                @parent[root_y] = root_x
              else
                @parent[root_y] = root_x
                @rank[root_x] += 1
              end
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          class UnionFind {
              vector<int> parent, rank;
          public:
              UnionFind(int n) : parent(n), rank(n, 0) {
                  iota(parent.begin(), parent.end(), 0);
              }
              
              int find(int x) {
                  if (parent[x] != x)
                      parent[x] = find(parent[x]);  // Path compression
                  return parent[x];
              }
              
              void unite(int x, int y) {
                  int rootX = find(x);
                  int rootY = find(y);
                  if (rootX == rootY) return;
                  
                  // Union by rank
                  if (rank[rootX] < rank[rootY]) {
                      parent[rootX] = rootY;
                  } else if (rank[rootX] > rank[rootY]) {
                      parent[rootY] = rootX;
                  } else {
                      parent[rootY] = rootX;
                      rank[rootX]++;
                  }
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Number of connected components in graph",
          "2. Detect cycle in undirected graph",
          "3. Friend circles / Number of provinces",
          "4. Redundant connection",
          "5. Accounts merge",
          "6. Most stones removed",
          "7. Satisfiability of equality equations",
          "8. Smallest string with swaps"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Union-Find is perfect for dynamic connectivity problems!"
        puts "💡 TIP: Use for Kruskal's MST algorithm"
      end

      class UnionFindImplementation
        def initialize(n)
          @parent = (0...n).to_a
          @rank = Array.new(n, 0)
          @count = n
        end
        
        def find(x)
          if @parent[x] != x
            @parent[x] = find(@parent[x])  # Path compression
          end
          @parent[x]
        end
        
        def union(x, y)
          root_x = find(x)
          root_y = find(y)
          return if root_x == root_y
          
          # Union by rank
          if @rank[root_x] < @rank[root_y]
            @parent[root_x] = root_y
          elsif @rank[root_x] > @rank[root_y]
            @parent[root_y] = root_x
          else
            @parent[root_y] = root_x
            @rank[root_x] += 1
          end
          
          @count -= 1
        end
        
        def connected?(x, y)
          find(x) == find(y)
        end
        
        def count
          @count
        end
      end
    end
  end
end
