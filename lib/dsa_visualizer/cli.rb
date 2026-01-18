require 'io/console'

module DSAVisualizer
  class CLI
    CURRICULUM = {
      "1" => {
        title: "Fundamentals",
        topics: {
          "1.1" => { name: "Time & Space Complexity", key: :complexity_basics },
          "1.2" => { name: "Memory Management", key: :memory_basics },
          "1.3" => { name: "Pointers & References", key: :pointers_basics },
          "1.4" => { name: "Recursion Basics", key: :recursion_basics }
        }
      },
      "2" => {
        title: "Basic Data Structures",
        topics: {
          "2.1" => { name: "Arrays", key: :array },
          "2.2" => { name: "Strings", key: :string },
          "2.3" => { name: "Linked Lists", key: :linked_list },
          "2.4" => { name: "Doubly Linked Lists", key: :doubly_linked_list },
          "2.5" => { name: "Circular Linked Lists", key: :circular_linked_list }
        }
      },
      "3" => {
        title: "Stack & Queue",
        topics: {
          "3.1" => { name: "Stack (Array-based)", key: :stack },
          "3.2" => { name: "Stack (Linked List-based)", key: :stack_linked },
          "3.3" => { name: "Queue (Array-based)", key: :queue },
          "3.4" => { name: "Queue (Linked List-based)", key: :queue_linked },
          "3.5" => { name: "Circular Queue", key: :circular_queue },
          "3.6" => { name: "Deque", key: :deque },
          "3.7" => { name: "Priority Queue", key: :priority_queue }
        }
      },
      "4" => {
        title: "Hashing",
        topics: {
          "4.1" => { name: "Hash Functions", key: :hash_functions },
          "4.2" => { name: "Hash Tables", key: :hash_table },
          "4.3" => { name: "Collision Handling", key: :collision_handling },
          "4.4" => { name: "Hash Maps & Sets", key: :hash_map_set }
        }
      },
      "5" => {
        title: "Trees",
        topics: {
          "5.1" => { name: "Binary Trees", key: :binary_tree },
          "5.2" => { name: "Binary Search Trees", key: :bst },
          "5.3" => { name: "Tree Traversals", key: :tree_traversals },
          "5.4" => { name: "AVL Trees", key: :avl_tree },
          "5.5" => { name: "Red-Black Trees", key: :red_black_tree },
          "5.6" => { name: "B-Trees", key: :b_tree },
          "5.7" => { name: "Segment Trees", key: :segment_tree },
          "5.8" => { name: "Fenwick Trees", key: :fenwick_tree },
          "5.9" => { name: "Trie", key: :trie }
        }
      },
      "6" => {
        title: "Heaps",
        topics: {
          "6.1" => { name: "Min Heap", key: :min_heap },
          "6.2" => { name: "Max Heap", key: :max_heap },
          "6.3" => { name: "Heap Operations", key: :heap_operations },
          "6.4" => { name: "Heap Sort", key: :heap_sort }
        }
      },
      "7" => {
        title: "Graphs",
        topics: {
          "7.1" => { name: "Graph Representations", key: :graph_representation },
          "7.2" => { name: "BFS (Breadth-First Search)", key: :bfs },
          "7.3" => { name: "DFS (Depth-First Search)", key: :dfs },
          "7.4" => { name: "Topological Sort", key: :topological_sort },
          "7.5" => { name: "Shortest Path (Dijkstra)", key: :dijkstra },
          "7.6" => { name: "Shortest Path (Bellman-Ford)", key: :bellman_ford },
          "7.7" => { name: "Minimum Spanning Tree (Kruskal)", key: :kruskal },
          "7.8" => { name: "Minimum Spanning Tree (Prim)", key: :prim },
          "7.9" => { name: "Floyd-Warshall", key: :floyd_warshall }
        }
      },
      "8" => {
        title: "Sorting Algorithms",
        topics: {
          "8.1" => { name: "Bubble Sort", key: :bubble_sort },
          "8.2" => { name: "Selection Sort", key: :selection_sort },
          "8.3" => { name: "Insertion Sort", key: :insertion_sort },
          "8.4" => { name: "Merge Sort", key: :merge_sort },
          "8.5" => { name: "Quick Sort", key: :quick_sort },
          "8.6" => { name: "Heap Sort", key: :heap_sort },
          "8.7" => { name: "Counting Sort", key: :counting_sort },
          "8.8" => { name: "Radix Sort", key: :radix_sort },
          "8.9" => { name: "Bucket Sort", key: :bucket_sort }
        }
      },
      "9" => {
        title: "Searching Algorithms",
        topics: {
          "9.1" => { name: "Linear Search", key: :linear_search },
          "9.2" => { name: "Binary Search", key: :binary_search },
          "9.3" => { name: "Ternary Search", key: :ternary_search },
          "9.4" => { name: "Jump Search", key: :jump_search },
          "9.5" => { name: "Interpolation Search", key: :interpolation_search }
        }
      },
      "10" => {
        title: "Advanced Algorithms",
        topics: {
          "10.1" => { name: "Dynamic Programming Intro", key: :dp_intro },
          "10.2" => { name: "Fibonacci (DP)", key: :dp_fibonacci },
          "10.3" => { name: "Knapsack Problem", key: :knapsack },
          "10.4" => { name: "Longest Common Subsequence", key: :lcs },
          "10.5" => { name: "Matrix Chain Multiplication", key: :matrix_chain },
          "10.6" => { name: "Greedy Algorithms", key: :greedy_intro },
          "10.7" => { name: "Backtracking", key: :backtracking },
          "10.8" => { name: "Divide and Conquer", key: :divide_conquer }
        }
      },
      "11" => {
        title: "String Algorithms",
        topics: {
          "11.1" => { name: "Pattern Matching (Naive)", key: :pattern_naive },
          "11.2" => { name: "KMP Algorithm", key: :kmp },
          "11.3" => { name: "Rabin-Karp", key: :rabin_karp },
          "11.4" => { name: "Z Algorithm", key: :z_algorithm }
        }
      },
      "12" => {
        title: "Advanced Data Structures",
        topics: {
          "12.1" => { name: "Disjoint Set (Union-Find)", key: :union_find },
          "12.2" => { name: "Suffix Array", key: :suffix_array },
          "12.3" => { name: "Suffix Tree", key: :suffix_tree },
          "12.4" => { name: "Skip List", key: :skip_list }
        }
      }
    }

    def self.start
      new.run
    end

    def run
      loop do
        clear_screen
        print_header
        print_menu
        choice = get_input
        
        break if choice == "0"
        handle_choice(choice)
      end
      
      puts "\n👋 Happy Learning! Keep practicing DSA!".colorize(:green)
    end

    private

    def clear_screen
      system('cls') || system('clear')
    end

    def print_header
      puts "╔" + "═" * 78 + "╗"
      puts "║" + " DSA VISUALIZER - Zero to Hero ".center(78).colorize(:cyan).bold + "║"
      puts "║" + " Ruby vs C++ Implementation Comparison ".center(78).colorize(:yellow) + "║"
      puts "╚" + "═" * 78 + "╝"
      puts ""
    end

    def print_menu
      puts "📚 CURRICULUM".colorize(:green).bold
      puts "─" * 80
      
      CURRICULUM.each do |section_num, section|
        puts "\n#{section_num}. #{section[:title]}".colorize(:yellow).bold
        section[:topics].each do |topic_num, topic|
          puts "   #{topic_num}. #{topic[:name]}"
        end
      end
      
      puts "\n" + "─" * 80
      puts "Commands:".colorize(:cyan)
      puts "  • Enter topic number (e.g., 2.1 for Arrays)"
      puts "  • Type 'progress' to see your learning progress"
      puts "  • Type 'notes' to view saved notes"
      puts "  • Type '0' to exit"
      puts "─" * 80
    end

    def get_input
      print "\n➤ Enter your choice: ".colorize(:green)
      gets.chomp.strip
    end

    def handle_choice(choice)
      case choice.downcase
      when 'progress'
        show_progress
      when 'notes'
        show_notes
      else
        run_topic(choice)
      end
    end

    def run_topic(topic_code)
      section_num = topic_code.split('.').first
      section = CURRICULUM[section_num]
      
      unless section
        puts "\n❌ Invalid section number!".colorize(:red)
        wait_for_key
        return
      end
      
      topic = section[:topics][topic_code]
      
      unless topic
        puts "\n❌ Invalid topic number!".colorize(:red)
        wait_for_key
        return
      end
      
      clear_screen
      DSAVisualizer.learn(topic[:key])
      mark_completed(topic_code)
      wait_for_key
    end

    def show_progress
      clear_screen
      puts "\n📊 YOUR LEARNING PROGRESS".colorize(:cyan).bold
      puts "─" * 80
      
      completed = load_progress
      total = CURRICULUM.values.sum { |s| s[:topics].size }
      
      puts "\nCompleted: #{completed.size}/#{total} topics"
      puts "Progress: #{'█' * (completed.size * 50 / total)}#{'░' * (50 - completed.size * 50 / total)} #{(completed.size * 100 / total)}%"
      
      if completed.any?
        puts "\n✅ Completed Topics:"
        completed.each { |topic| puts "   • #{topic}" }
      end
      
      wait_for_key
    end

    def show_notes
      clear_screen
      puts "\n📝 YOUR NOTES".colorize(:cyan).bold
      puts "─" * 80
      puts "\nFeature coming soon! Notes will be saved automatically as you learn."
      wait_for_key
    end

    def mark_completed(topic_code)
      completed = load_progress
      completed << topic_code unless completed.include?(topic_code)
      save_progress(completed)
    end

    def load_progress
      file = File.join(Dir.home, '.dsa_visualizer_progress')
      return [] unless File.exist?(file)
      File.read(file).split("\n")
    end

    def save_progress(completed)
      file = File.join(Dir.home, '.dsa_visualizer_progress')
      File.write(file, completed.join("\n"))
    end

    def wait_for_key
      puts "\n\nPress any key to continue...".colorize(:light_black)
      STDIN.getch
    end
  end
end
