module DSAVisualizer
  module Algorithms
    class GraphAlgorithms
      def self.learn_bfs
        Visualizer.print_header("BREADTH-FIRST SEARCH (BFS)")
        puts "\n📚 Coming soon: Level-order graph traversal"
        puts "Topics: Queue-based, shortest path in unweighted graph"
      end
      
      def self.learn_dfs
        Visualizer.print_header("DEPTH-FIRST SEARCH (DFS)")
        puts "\n📚 Coming soon: Deep exploration"
        puts "Topics: Stack/recursion-based, cycle detection, topological sort"
      end
      
      def self.learn_dijkstra
        Visualizer.print_header("DIJKSTRA'S ALGORITHM")
        puts "\n📚 Coming soon: Shortest path in weighted graph"
        puts "Topics: Priority queue, greedy approach, non-negative weights"
      end
    end
  end
end
