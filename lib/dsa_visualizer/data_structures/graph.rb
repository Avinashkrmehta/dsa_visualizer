module DSAVisualizer
  module DataStructures
    class Graph
      def self.learn
        Visualizer.print_header("GRAPH - Vertices and Edges")
        
        puts "\n📖 CONCEPT:"
        puts "A Graph is a collection of vertices (nodes) connected by edges:"
        puts "• Directed: Edges have direction (A → B)"
        puts "• Undirected: Edges are bidirectional (A ↔ B)"
        puts "• Weighted: Edges have associated costs"
        puts "• Unweighted: All edges have equal weight"
        
        puts "\n⏱️  TIME COMPLEXITY (Adjacency List):"
        puts "• Add vertex: O(1)"
        puts "• Add edge: O(1)"
        puts "• Remove vertex: O(V + E)"
        puts "• Remove edge: O(E)"
        puts "• Check if edge exists: O(V)"
        
        puts "\n💾 SPACE COMPLEXITY:"
        puts "• Adjacency List: O(V + E)"
        puts "• Adjacency Matrix: O(V²)"
        
        demonstrate_graph
        demonstrate_representations
        show_ruby_vs_cpp
        show_practice_problems
      end

      def self.demonstrate_graph
        puts "\n" + "="*60
        puts "DEMONSTRATION: Building a Graph"
        puts "="*60
        
        graph = GraphImplementation.new
        
        puts "\nAdding vertices: A, B, C, D, E"
        ['A', 'B', 'C', 'D', 'E'].each { |v| graph.add_vertex(v) }
        
        puts "\nAdding edges:"
        edges = [['A', 'B'], ['A', 'C'], ['B', 'D'], ['C', 'D'], ['D', 'E']]
        edges.each do |from, to|
          graph.add_edge(from, to)
          puts "#{from} → #{to}"
        end
        
        puts "\n📊 Graph Structure:"
        puts "    A"
        puts "   / \\"
        puts "  B   C"
        puts "   \\ /"
        puts "    D"
        puts "    |"
        puts "    E"
        
        graph.display
      end

      def self.demonstrate_representations
        puts "\n" + "="*60
        puts "GRAPH REPRESENTATIONS"
        puts "="*60
        
        puts "\n1️⃣  ADJACENCY LIST:"
        puts "Space efficient for sparse graphs"
        puts "A: [B, C]"
        puts "B: [D]"
        puts "C: [D]"
        puts "D: [E]"
        puts "E: []"
        
        puts "\n2️⃣  ADJACENCY MATRIX:"
        puts "Fast edge lookup, more space"
        puts "    A B C D E"
        puts "A [[0,1,1,0,0],"
        puts "B  [0,0,0,1,0],"
        puts "C  [0,0,0,1,0],"
        puts "D  [0,0,0,0,1],"
        puts "E  [0,0,0,0,0]]"
        
        puts "\n3️⃣  EDGE LIST:"
        puts "Simple but less efficient"
        puts "[(A,B), (A,C), (B,D), (C,D), (D,E)]"
      end

      def self.show_ruby_vs_cpp
        puts "\n" + "="*60
        puts "RUBY vs C++ IMPLEMENTATION"
        puts "="*60
        
        puts "\n🔴 RUBY (Adjacency List):"
        puts <<~RUBY
          class Graph
            def initialize
              @adj_list = Hash.new { |h, k| h[k] = [] }
            end
            
            def add_vertex(vertex)
              @adj_list[vertex] ||= []
            end
            
            def add_edge(from, to, directed = true)
              @adj_list[from] << to
              @adj_list[to] << from unless directed
            end
            
            def neighbors(vertex)
              @adj_list[vertex]
            end
          end
        RUBY
        
        puts "\n🔵 C++ (Adjacency List):"
        puts <<~CPP
          class Graph {
              unordered_map<int, vector<int>> adjList;
          public:
              void addVertex(int vertex) {
                  if (adjList.find(vertex) == adjList.end())
                      adjList[vertex] = vector<int>();
              }
              
              void addEdge(int from, int to, bool directed = true) {
                  adjList[from].push_back(to);
                  if (!directed)
                      adjList[to].push_back(from);
              }
              
              vector<int> neighbors(int vertex) {
                  return adjList[vertex];
              }
          };
        CPP
      end

      def self.show_practice_problems
        puts "\n" + "="*60
        puts "PRACTICE PROBLEMS"
        puts "="*60
        
        problems = [
          "1. Clone a graph",
          "2. Number of islands",
          "3. Course schedule (cycle detection)",
          "4. Word ladder",
          "5. Network delay time",
          "6. Minimum spanning tree",
          "7. Shortest path in binary matrix",
          "8. Critical connections in network"
        ]
        
        problems.each { |p| puts p }
        
        puts "\n💡 TIP: Use adjacency list for sparse graphs!"
        puts "💡 TIP: Use adjacency matrix when you need O(1) edge lookup"
      end

      class GraphImplementation
        def initialize(directed = true)
          @adj_list = Hash.new { |h, k| h[k] = [] }
          @directed = directed
        end
        
        def add_vertex(vertex)
          @adj_list[vertex] ||= []
        end
        
        def add_edge(from, to)
          @adj_list[from] << to
          @adj_list[to] << from unless @directed
        end
        
        def remove_edge(from, to)
          @adj_list[from].delete(to)
          @adj_list[to].delete(from) unless @directed
        end
        
        def neighbors(vertex)
          @adj_list[vertex]
        end
        
        def has_edge?(from, to)
          @adj_list[from].include?(to)
        end
        
        def vertices
          @adj_list.keys
        end
        
        def display
          puts "\nAdjacency List:"
          @adj_list.each do |vertex, neighbors|
            puts "#{vertex}: #{neighbors.join(', ')}"
          end
        end
      end
    end
  end
end
