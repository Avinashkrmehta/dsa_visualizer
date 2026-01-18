require 'colorize'
require 'tty-box'
require 'tty-table'

require_relative 'dsa_visualizer/version'
require_relative 'dsa_visualizer/visualizer'
require_relative 'dsa_visualizer/memory_tracker'
require_relative 'dsa_visualizer/comparator'
require_relative 'dsa_visualizer/cli'
require_relative 'dsa_visualizer/notes_manager'

# Fundamentals
require_relative 'dsa_visualizer/fundamentals/complexity'
require_relative 'dsa_visualizer/fundamentals/memory'
require_relative 'dsa_visualizer/fundamentals/pointers'
require_relative 'dsa_visualizer/fundamentals/recursion'

# Data Structures
require_relative 'dsa_visualizer/data_structures/array'
require_relative 'dsa_visualizer/data_structures/string'
require_relative 'dsa_visualizer/data_structures/linked_list'
require_relative 'dsa_visualizer/data_structures/doubly_linked_list'
require_relative 'dsa_visualizer/data_structures/stack'
require_relative 'dsa_visualizer/data_structures/queue'
require_relative 'dsa_visualizer/data_structures/deque'
require_relative 'dsa_visualizer/data_structures/priority_queue'
require_relative 'dsa_visualizer/data_structures/hash_table'
require_relative 'dsa_visualizer/data_structures/binary_tree'
require_relative 'dsa_visualizer/data_structures/bst'
require_relative 'dsa_visualizer/data_structures/heap'
require_relative 'dsa_visualizer/data_structures/graph'
require_relative 'dsa_visualizer/data_structures/trie'
require_relative 'dsa_visualizer/data_structures/union_find'

# Algorithms
require_relative 'dsa_visualizer/algorithms/sorting'
require_relative 'dsa_visualizer/algorithms/searching'
require_relative 'dsa_visualizer/algorithms/graph_algorithms'
require_relative 'dsa_visualizer/algorithms/dynamic_programming'
require_relative 'dsa_visualizer/algorithms/greedy'
require_relative 'dsa_visualizer/algorithms/string_algorithms'

module DSAVisualizer
  class Error < StandardError; end
  
  TOPIC_MAP = {
    # Fundamentals
    complexity_basics: -> { Fundamentals::Complexity.learn },
    memory_basics: -> { Fundamentals::Memory.learn },
    pointers_basics: -> { Fundamentals::Pointers.learn },
    recursion_basics: -> { Fundamentals::Recursion.learn },
    
    # Basic Data Structures
    array: -> { DataStructures::Array.learn },
    string: -> { DataStructures::String.learn },
    linked_list: -> { DataStructures::LinkedList.learn },
    doubly_linked_list: -> { DataStructures::DoublyLinkedList.learn },
    
    # Stack & Queue
    stack: -> { DataStructures::Stack.learn },
    queue: -> { DataStructures::Queue.learn },
    deque: -> { DataStructures::Deque.learn },
    priority_queue: -> { DataStructures::PriorityQueue.learn },
    
    # Hashing
    hash_table: -> { DataStructures::HashTable.learn },
    
    # Trees
    binary_tree: -> { DataStructures::BinaryTree.learn },
    bst: -> { DataStructures::BST.learn },
    trie: -> { DataStructures::Trie.learn },
    
    # Heaps
    min_heap: -> { DataStructures::Heap.learn_min },
    max_heap: -> { DataStructures::Heap.learn_max },
    
    # Graphs
    graph_representation: -> { DataStructures::Graph.learn },
    bfs: -> { Algorithms::GraphAlgorithms.learn_bfs },
    dfs: -> { Algorithms::GraphAlgorithms.learn_dfs },
    dijkstra: -> { Algorithms::GraphAlgorithms.learn_dijkstra },
    
    # Sorting
    bubble_sort: -> { Algorithms::Sorting.learn_bubble },
    merge_sort: -> { Algorithms::Sorting.learn_merge },
    quick_sort: -> { Algorithms::Sorting.learn_quick },
    
    # Searching
    linear_search: -> { Algorithms::Searching.learn_linear },
    binary_search: -> { Algorithms::Searching.learn_binary },
    
    # Advanced
    dp_intro: -> { Algorithms::DynamicProgramming.learn_intro },
    dp_fibonacci: -> { Algorithms::DynamicProgramming.learn_fibonacci },
    knapsack: -> { Algorithms::DynamicProgramming.learn_knapsack },
    
    # Union Find
    union_find: -> { DataStructures::UnionFind.learn }
  }
  
  def self.learn(topic)
    handler = TOPIC_MAP[topic]
    if handler
      handler.call
    else
      puts "❌ Topic not yet implemented: #{topic}".colorize(:red)
      puts "Coming soon in the next update!"
    end
  end
  
  def self.start_cli
    CLI.start
  end
end
