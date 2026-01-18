# DSA Visualizer - Zero to Hero

A comprehensive Ruby gem for learning Data Structures and Algorithms from scratch by visualizing concepts at the core level, comparing Ruby and C++ implementations with step-by-step execution details, detailed notes, and practice problems.

## 🎯 Features

- 📚 **Complete DSA Curriculum**: 12 sections covering fundamentals to advanced topics
- 🎨 **Visual Representations**: ASCII art visualizations of data structures
- 🔄 **Ruby vs C++ Comparisons**: Side-by-side implementation comparisons
- 🧠 **Core Level Explanations**: Deep dive into memory layout and internal workings
- 📊 **Memory Tracking**: Track allocations and operations
- ⏱️ **Complexity Analysis**: Time and space complexity for every operation
- 📝 **Detailed Notes**: Important points, common mistakes, best practices
- 🎯 **Real-World Examples**: Practical use cases for each concept
- 💪 **Practice Problems**: Curated problems for each topic
- 📈 **Progress Tracking**: Track your learning journey
- 🖥️ **Interactive CLI**: Command-based navigation through topics

## 📚 Complete Curriculum

### 1. Fundamentals
- Time & Space Complexity (Big O Notation)
- Memory Management (Stack vs Heap)
- Pointers & References
- Recursion Basics

### 2. Basic Data Structures
- Arrays
- Strings
- Linked Lists (Singly, Doubly, Circular)

### 3. Stack & Queue
- Stack (Array-based & Linked List-based)
- Queue (Array-based & Linked List-based)
- Circular Queue
- Deque
- Priority Queue

### 4. Hashing
- Hash Functions
- Hash Tables
- Collision Handling (Chaining, Open Addressing)
- Hash Maps & Sets

### 5. Trees
- Binary Trees
- Binary Search Trees (BST)
- Tree Traversals (Inorder, Preorder, Postorder, Level-order)
- AVL Trees
- Red-Black Trees
- B-Trees
- Segment Trees
- Fenwick Trees (Binary Indexed Tree)
- Trie (Prefix Tree)

### 6. Heaps
- Min Heap & Max Heap
- Heap Operations (Insert, Extract, Heapify)
- Heap Sort

### 7. Graphs
- Graph Representations (Adjacency Matrix, Adjacency List)
- BFS (Breadth-First Search)
- DFS (Depth-First Search)
- Topological Sort
- Shortest Path Algorithms (Dijkstra, Bellman-Ford)
- Minimum Spanning Tree (Kruskal, Prim)
- Floyd-Warshall Algorithm

### 8. Sorting Algorithms
- Bubble Sort, Selection Sort, Insertion Sort
- Merge Sort, Quick Sort, Heap Sort
- Counting Sort, Radix Sort, Bucket Sort

### 9. Searching Algorithms
- Linear Search, Binary Search
- Ternary Search, Jump Search
- Interpolation Search

### 10. Advanced Algorithms
- Dynamic Programming (Fibonacci, Knapsack, LCS, Matrix Chain)
- Greedy Algorithms
- Backtracking
- Divide and Conquer

### 11. String Algorithms
- Pattern Matching (Naive, KMP, Rabin-Karp)
- Z Algorithm

### 12. Advanced Data Structures
- Disjoint Set (Union-Find)
- Suffix Array & Suffix Tree
- Skip List

## 🚀 Installation

Add this line to your application's Gemfile:

```ruby
gem 'dsa_visualizer'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install dsa_visualizer
```

## 💻 Usage

### Interactive CLI (Recommended)

Start the interactive learning interface:

```bash
ruby -Ilib bin/dsa_visualizer
```

Or in your Ruby code:

```ruby
require 'dsa_visualizer'

DSAVisualizer.start_cli
```

This launches an interactive menu where you can:
- Navigate through 12 sections of DSA topics
- Select specific topics by number (e.g., "2.1" for Arrays)
- Track your learning progress
- View saved notes

### Direct Topic Access

Learn specific topics programmatically:

```ruby
require 'dsa_visualizer'

# Fundamentals
DSAVisualizer.learn(:complexity_basics)
DSAVisualizer.learn(:memory_basics)
DSAVisualizer.learn(:pointers_basics)
DSAVisualizer.learn(:recursion_basics)

# Data Structures
DSAVisualizer.learn(:array)
DSAVisualizer.learn(:linked_list)
DSAVisualizer.learn(:stack)
DSAVisualizer.learn(:queue)
DSAVisualizer.learn(:hash_table)
DSAVisualizer.learn(:binary_tree)
DSAVisualizer.learn(:bst)

# Algorithms
DSAVisualizer.learn(:bubble_sort)
DSAVisualizer.learn(:binary_search)
DSAVisualizer.learn(:bfs)
DSAVisualizer.learn(:dfs)
DSAVisualizer.learn(:dijkstra)
```

## 📖 Example Output

When you run `DSAVisualizer.learn(:complexity_basics)`:

```
================================================================================
          TIME & SPACE COMPLEXITY - Foundation of Algorithm Analysis
================================================================================

📖 WHAT IS COMPLEXITY ANALYSIS?
────────────────────────────────────────────────────────────────────────────────
Complexity analysis helps us understand how an algorithm's performance
scales with input size. We measure two things:
  1. Time Complexity - How execution time grows
  2. Space Complexity - How memory usage grows

1. Big O Notation
────────────────────────────────────────────────────────────────────────────────

Big O describes the upper bound (worst case) of algorithm growth.

Common Time Complexities (from best to worst):
  O(1)         Constant        → Array access, hash lookup
  O(log n)     Logarithmic     → Binary search, balanced tree ops
  O(n)         Linear          → Array traversal, linear search
  O(n log n)   Linearithmic    → Merge sort, quick sort (avg)
  O(n²)        Quadratic       → Bubble sort, nested loops
  ...

[Detailed examples with Ruby and C++ code comparisons follow]
```

## 🎓 Learning Path

### For Beginners (Start Here!)
1. Start with **Fundamentals** (Section 1)
   - Understand complexity analysis first
   - Learn memory management basics
   - Master pointers/references concept
   - Practice recursion

2. Move to **Basic Data Structures** (Section 2)
   - Arrays and Strings
   - Linked Lists

3. Learn **Stack & Queue** (Section 3)

### Intermediate Level
4. **Hashing** (Section 4)
5. **Trees** (Section 5)
6. **Heaps** (Section 6)
7. **Sorting & Searching** (Sections 8-9)

### Advanced Level
8. **Graphs** (Section 7)
9. **Advanced Algorithms** (Section 10)
10. **String Algorithms** (Section 11)
11. **Advanced Data Structures** (Section 12)

## 🎯 What Makes This Gem Special?

1. **Zero to Hero Approach**: Complete curriculum from basics to advanced
2. **Core Level Understanding**: Shows what happens in memory, not just theory
3. **Language Comparison**: Learn by comparing Ruby's abstractions with C++'s control
4. **Visual Learning**: ASCII visualizations make abstract concepts concrete
5. **Step-by-Step**: Track each operation with detailed explanations
6. **Comprehensive Notes**: Important points, common mistakes, best practices
7. **Practice Problems**: Curated problems for each topic
8. **Progress Tracking**: See your learning journey
9. **Real-World Context**: Understand when and why to use each structure
10. **Interactive CLI**: Easy navigation through topics

## 📝 Each Topic Includes

- ✅ Concept explanation
- ✅ Ruby implementation with code
- ✅ C++ implementation with code
- ✅ Side-by-side comparison
- ✅ Memory layout visualization
- ✅ Time complexity analysis
- ✅ Space complexity analysis
- ✅ Step-by-step operation walkthrough
- ✅ Important notes and key points
- ✅ When to use / when not to use
- ✅ Real-world applications
- ✅ Common mistakes to avoid
- ✅ Practice problems

## 🛠️ Requirements

- Ruby >= 2.7.0
- colorize gem (for colored output)
- tty-box gem (for visual boxes)
- tty-table gem (for tables)

## 🔧 Development

After checking out the repo, run:

```bash
bundle install
```

To run the interactive CLI:

```bash
ruby -Ilib bin/dsa_visualizer
```

To run a specific topic:

```bash
ruby -Ilib -r dsa_visualizer -e "DSAVisualizer.learn(:array)"
```

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration.

## 📄 License

The gem is available as open source under the terms of the MIT License.

## 🗺️ Roadmap

- [x] Core fundamentals (Complexity, Memory, Pointers, Recursion)
- [x] Basic data structures (Array, Linked List, Stack, Queue)
- [x] Interactive CLI with progress tracking
- [ ] Complete all tree implementations
- [ ] Complete all graph algorithms
- [ ] Complete all sorting algorithms
- [ ] Add dynamic programming examples
- [ ] Add more practice problems
- [ ] Add quiz mode
- [ ] Export notes to PDF
- [ ] Web interface
- [ ] Video tutorials integration

## 💡 Tips for Learning

1. **Follow the order**: Start with fundamentals, don't skip ahead
2. **Practice coding**: Don't just read, implement the structures yourself
3. **Understand, don't memorize**: Focus on why, not just how
4. **Compare languages**: See how Ruby and C++ approach the same problem
5. **Solve practice problems**: Apply what you learn
6. **Track progress**: Use the built-in progress tracker
7. **Review notes**: Revisit important points regularly

## 🙏 Credits

Created for developers who want to truly understand data structures and algorithms at a fundamental level, with practical comparisons between high-level (Ruby) and low-level (C++) implementations.

---

**Happy Learning! 🚀 Master DSA one topic at a time!**
