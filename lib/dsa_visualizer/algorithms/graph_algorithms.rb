module DSAVisualizer
  module Algorithms
    class GraphAlgorithms
      def self.learn_bfs
        Visualizer.print_header("BREADTH-FIRST SEARCH (BFS)")
        
        puts "\n📖 CONCEPT:"
        puts "BFS explores graph level by level using a queue:"
        puts "• Start from source vertex"
        puts "• Visit all neighbors before going deeper"
        puts "• Uses queue (FIFO) for traversal"
        puts "• Finds shortest path in unweighted graphs"
        
        puts "\n⏱️  TIME COMPLEXITY: O(V + E)"
        puts "💾 SPACE COMPLEXITY: O(V) - for queue and visited set"
        
        demonstrate_bfs
        show_ruby_vs_cpp_bfs
      end
      
      def self.learn_dfs
        Visualizer.print_header("DEPTH-FIRST SEARCH (DFS)")
        
        puts "\n📖 CONCEPT:"
        puts "DFS explores as deep as possible before backtracking:"
        puts "• Start from source vertex"
        puts "• Go deep into one path before exploring others"
        puts "• Uses stack (recursion or explicit)"
        puts "• Used for cycle detection, topological sort"
        
        puts "\n⏱️  TIME COMPLEXITY: O(V + E)"
        puts "💾 SPACE COMPLEXITY: O(V) - for recursion stack"
        
        demonstrate_dfs
        show_ruby_vs_cpp_dfs
      end
      
      def self.learn_dijkstra
        Visualizer.print_header("DIJKSTRA'S ALGORITHM")
        
        puts "\n📖 CONCEPT:"
        puts "Dijkstra finds shortest path in weighted graphs:"
        puts "• Greedy algorithm"
        puts "• Uses priority queue (min heap)"
        puts "• Works only with non-negative weights"
        puts "• Finds shortest path from source to all vertices"
        
        puts "\n⏱️  TIME COMPLEXITY: O((V + E) log V) with min heap"
        puts "💾 SPACE COMPLEXITY: O(V)"
        
        demonstrate_dijkstra
        show_ruby_vs_cpp_dijkstra
      end

      def self.demonstrate_bfs
        puts "\n" + "="*60
        puts "BFS DEMONSTRATION"
        puts "="*60
        
        graph = {
          'A' => ['B', 'C'],
          'B' => ['D', 'E'],
          'C' => ['F'],
          'D' => [],
          'E' => ['F'],
          'F' => []
        }
        
        puts "\nGraph:"
        puts "    A"
        puts "   / \\"
        puts "  B   C"
        puts " / \\   \\"
        puts "D   E   F"
        
        puts "\nBFS Traversal from A:"
        result = bfs(graph, 'A')
        puts "Order: #{result.join(' → ')}"
        
        puts "\nLevel-by-level:"
        puts "Level 0: A"
        puts "Level 1: B, C"
        puts "Level 2: D, E, F"
      end

      def self.demonstrate_dfs
        puts "\n" + "="*60
        puts "DFS DEMONSTRATION"
        puts "="*60
        
        graph = {
          'A' => ['B', 'C'],
          'B' => ['D', 'E'],
          'C' => ['F'],
          'D' => [],
          'E' => ['F'],
          'F' => []
        }
        
        puts "\nGraph:"
        puts "    A"
        puts "   / \\"
        puts "  B   C"
        puts " / \\   \\"
        puts "D   E   F"
        
        puts "\nDFS Traversal from A:"
        result = dfs(graph, 'A')
        puts "Order: #{result.join(' → ')}"
        
        puts "\nPath exploration:"
        puts "A → B → D (backtrack)"
        puts "B → E → F (backtrack)"
        puts "A → C → F (already visited)"
      end

      def self.demonstrate_dijkstra
        puts "\n" + "="*60
        puts "DIJKSTRA'S ALGORITHM DEMONSTRATION"
        puts "="*60
        
        graph = {
          'A' => [['B', 4], ['C', 2]],
          'B' => [['D', 5]],
          'C' => [['B', 1], ['D', 8]],
          'D' => []
        }
        
        puts "\nWeighted Graph:"
        puts "    A"
        puts "   /4\\2"
        puts "  B   C"
        puts "  |5 /8"
        puts "   D"
        
        puts "\nFinding shortest paths from A:"
        distances = dijkstra(graph, 'A')
        distances.each do |vertex, dist|
          puts "A → #{vertex}: #{dist}"
        end
      end

      def self.bfs(graph, start)
        visited = Set.new
        queue = [start]
        result = []
        
        until queue.empty?
          vertex = queue.shift
          next if visited.include?(vertex)
          
          visited.add(vertex)
          result << vertex
          
          graph[vertex].each do |neighbor|
            queue << neighbor unless visited.include?(neighbor)
          end
        end
        
        result
      end

      def self.dfs(graph, start, visited = Set.new, result = [])
        return result if visited.include?(start)
        
        visited.add(start)
        result << start
        
        graph[start].each do |neighbor|
          dfs(graph, neighbor, visited, result)
        end
        
        result
      end

      def self.dijkstra(graph, start)
        distances = Hash.new(Float::INFINITY)
        distances[start] = 0
        pq = [[0, start]]
        visited = Set.new
        
        until pq.empty?
          dist, vertex = pq.min_by { |d, _| d }
          pq.delete([dist, vertex])
          
          next if visited.include?(vertex)
          visited.add(vertex)
          
          graph[vertex].each do |neighbor, weight|
            new_dist = distances[vertex] + weight
            if new_dist < distances[neighbor]
              distances[neighbor] = new_dist
              pq << [new_dist, neighbor]
            end
          end
        end
        
        distances
      end

      def self.show_ruby_vs_cpp_bfs
        puts "\n" + "="*60
        puts "RUBY vs C++ - BFS"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          def bfs(graph, start)
            visited = Set.new
            queue = [start]
            
            until queue.empty?
              vertex = queue.shift
              next if visited.include?(vertex)
              
              visited.add(vertex)
              puts vertex
              
              graph[vertex].each do |neighbor|
                queue << neighbor unless visited.include?(neighbor)
              end
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          void bfs(unordered_map<int, vector<int>>& graph, int start) {
              unordered_set<int> visited;
              queue<int> q;
              q.push(start);
              
              while (!q.empty()) {
                  int vertex = q.front();
                  q.pop();
                  
                  if (visited.count(vertex)) continue;
                  visited.insert(vertex);
                  cout << vertex << endl;
                  
                  for (int neighbor : graph[vertex]) {
                      if (!visited.count(neighbor))
                          q.push(neighbor);
                  }
              }
          }
        CPP
      end

      def self.show_ruby_vs_cpp_dfs
        puts "\n" + "="*60
        puts "RUBY vs C++ - DFS"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          def dfs(graph, vertex, visited = Set.new)
            return if visited.include?(vertex)
            
            visited.add(vertex)
            puts vertex
            
            graph[vertex].each do |neighbor|
              dfs(graph, neighbor, visited)
            end
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          void dfs(unordered_map<int, vector<int>>& graph, 
                   int vertex, unordered_set<int>& visited) {
              if (visited.count(vertex)) return;
              
              visited.insert(vertex);
              cout << vertex << endl;
              
              for (int neighbor : graph[vertex]) {
                  dfs(graph, neighbor, visited);
              }
          }
        CPP
      end

      def self.show_ruby_vs_cpp_dijkstra
        puts "\n" + "="*60
        puts "RUBY vs C++ - DIJKSTRA"
        puts "="*60
        
        puts "\n🔴 RUBY:"
        puts <<~RUBY
          def dijkstra(graph, start)
            distances = Hash.new(Float::INFINITY)
            distances[start] = 0
            pq = [[0, start]]
            
            until pq.empty?
              dist, vertex = pq.min_by { |d, _| d }
              pq.delete([dist, vertex])
              
              graph[vertex].each do |neighbor, weight|
                new_dist = distances[vertex] + weight
                if new_dist < distances[neighbor]
                  distances[neighbor] = new_dist
                  pq << [new_dist, neighbor]
                end
              end
            end
            distances
          end
        RUBY
        
        puts "\n🔵 C++:"
        puts <<~CPP
          map<int, int> dijkstra(map<int, vector<pair<int,int>>>& graph, int start) {
              map<int, int> distances;
              priority_queue<pair<int,int>, vector<pair<int,int>>, greater<>> pq;
              pq.push({0, start});
              distances[start] = 0;
              
              while (!pq.empty()) {
                  auto [dist, vertex] = pq.top();
                  pq.pop();
                  
                  for (auto [neighbor, weight] : graph[vertex]) {
                      int newDist = distances[vertex] + weight;
                      if (newDist < distances[neighbor]) {
                          distances[neighbor] = newDist;
                          pq.push({newDist, neighbor});
                      }
                  }
              }
              return distances;
          }
        CPP
      end
    end
  end
end
