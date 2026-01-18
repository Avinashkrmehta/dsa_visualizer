# DSA Visualizer - Complete Usage Guide

## Table of Contents
1. [Getting Started](#getting-started)
2. [Interactive CLI](#interactive-cli)
3. [Topic Navigation](#topic-navigation)
4. [Understanding Output](#understanding-output)
5. [Progress Tracking](#progress-tracking)
6. [Learning Tips](#learning-tips)

## Getting Started

### Installation

```bash
gem install dsa_visualizer
```

Or add to your Gemfile:

```ruby
gem 'dsa_visualizer'
bundle install
```

### First Run

Start the interactive CLI:

```bash
ruby -Ilib bin/dsa_visualizer
```

You'll see the main menu with all 12 sections of the curriculum.

## Interactive CLI

### Main Menu

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                    DSA VISUALIZER - Zero to Hero                             ║
║              Ruby vs C++ Implementation Comparison                           ║
╚══════════════════════════════════════════════════════════════════════════════╝

📚 CURRICULUM
────────────────────────────────────────────────────────────────────────────────

1. Fundamentals
   1.1. Time & Space Complexity
   1.2. Memory Management
   1.3. Pointers & References
   1.4. Recursion Basics

2. Basic Data Structures
   2.1. Arrays
   2.2. Strings
   2.3. Linked Lists
   ...

Commands:
  • Enter topic number (e.g., 2.1 for Arrays)
  • Type 'progress' to see your learning progress
  • Type 'notes' to view saved notes
  • Type '0' to exit
────────────────────────────────────────────────────────────────────────────────

➤ Enter your choice:
```

### Navigation Commands

- **Topic Number** (e.g., `1.1`, `2.1`): Learn specific topic
- **`progress`**: View your learning progress
- **`notes`**: View saved notes (coming soon)
- **`0`**: Exit the program

## Topic Navigation

### Recommended Learning Path

#### Beginners (Week 1-2)
```
1.1 → 1.2 → 1.3 → 1.4  (Fundamentals)
2.1 → 2.2 → 2.3        (Basic Data Structures)
3.1 → 3.3              (Stack & Queue basics)
```

#### Intermediate (Week 3-4)
```
4.1 → 4.2 → 4.3        (Hashing)
5.1 → 5.2 → 5.3        (Trees basics)
8.1 → 8.4 → 8.5        (Sorting)
9.1 → 9.2              (Searching)
```

#### Advanced (Week 5-8)
```
6.1 → 6.2              (Heaps)
7.1 → 7.2 → 7.3 → 7.5  (Graphs)
10.1 → 10.2 → 10.3     (Dynamic Programming)
```

### Direct Topic Access (Programmatic)

```ruby
require 'dsa_visualizer'

# Learn fundamentals
DSAVisualizer.learn(:complexity_basics)
DSAVisualizer.learn(:memory_basics)
DSAVisualizer.learn(:pointers_basics)
DSAVisualizer.learn(:recursion_basics)

# Learn data structures
DSAVisualizer.learn(:array)
DSAVisualizer.learn(:linked_list)
DSAVisualizer.learn(:stack)
DSAVisualizer.learn(:queue)
DSAVisualizer.learn(:hash_table)
DSAVisualizer.learn(:binary_tree)

# Learn algorithms
DSAVisualizer.learn(:bubble_sort)
DSAVisualizer.learn(:binary_search)
DSAVisualizer.learn(:bfs)
DSAVisualizer.learn(:dfs)
```

## Understanding Output

Each topic provides comprehensive information in this structure:

### 1. Header
```
================================================================================
                    TOPIC NAME - Description
================================================================================
```

### 2. Introduction
- What is this concept?
- Why is it important?
- Where is it used?

### 3. Code Comparisons
```
┌─ Ruby Implementation ─────────────────────────────────────────────────────┐
│ Ruby code here                                                             │
└────────────────────────────────────────────────────────────────────────────┘

┌─ C++ Implementation ──────────────────────────────────────────────────────┐
│ C++ code here                                                              │
└────────────────────────────────────────────────────────────────────────────┘

💡 Core Difference:
   Explanation of key differences
```

### 4. Visual Representations
- ASCII art diagrams
- Memory layouts
- Step-by-step operations

### 5. Complexity Analysis
```
⏱️  TIME COMPLEXITY SUMMARY
────────────────────────────────────────────────────────────────────────────────
  Operation                      → Complexity
  Access                         → O(1)
  Search                         → O(n)
  Insertion                      → O(n)
  Deletion                       → O(n)
```

### 6. Important Notes
```
📝 IMPORTANT NOTES - Topic Name
════════════════════════════════════════════════════════════════════════════════
1. First important point
2. Second important point
...
```

### 7. Key Points
```
🎯 KEY POINTS TO REMEMBER
────────────────────────────────────────────────────────────────────────────────
  ✓ Key point 1
  ✓ Key point 2
  ...
```

### 8. When to Use
```
✅ WHEN TO USE
────────────────────────────────────────────────────────────────────────────────
  ✓ Use case 1
  ✓ Use case 2
  ...
```

### 9. Common Mistakes
```
⚠️  COMMON MISTAKES TO AVOID
────────────────────────────────────────────────────────────────────────────────
  ⚠  Mistake 1
  ⚠  Mistake 2
  ...
```

### 10. Practice Problems
```
💪 PRACTICE PROBLEMS
────────────────────────────────────────────────────────────────────────────────
  1. Problem Title [Difficulty]
     Description
  ...
```

## Progress Tracking

### View Progress

Type `progress` in the CLI to see:

```
📊 YOUR LEARNING PROGRESS
────────────────────────────────────────────────────────────────────────────────

Completed: 5/50 topics
Progress: ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ 10%

✅ Completed Topics:
   • 1.1 - Time & Space Complexity
   • 1.2 - Memory Management
   • 2.1 - Arrays
   • 2.3 - Linked Lists
   • 3.1 - Stack
```

Progress is automatically saved to `~/.dsa_visualizer_progress`

## Learning Tips

### 1. Start with Fundamentals
Don't skip section 1! Understanding complexity, memory, and pointers is crucial.

### 2. Code Along
Don't just read - implement the structures yourself:

```ruby
# After learning linked lists, implement it:
class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

# Test your implementation
head = Node.new(10)
head.next = Node.new(20)
```

### 3. Compare Languages
Pay attention to Ruby vs C++ differences:
- Ruby: High-level, automatic memory management
- C++: Low-level, manual control, better performance

### 4. Visualize
Draw the structures on paper as you learn:
```
Array:  [1][2][3][4][5]  ← Contiguous

Linked List:  [1]→[2]→[3]→[4]→nil  ← Scattered
```

### 5. Practice Problems
After each topic, solve the practice problems provided.

### 6. Review Notes
Revisit "Important Notes" and "Key Points" sections regularly.

### 7. Understand Trade-offs
Every data structure has pros and cons. Learn when to use what.

### 8. Track Progress
Use the progress tracker to stay motivated and see your journey.

## Advanced Usage

### Custom Learning Path

Create your own learning script:

```ruby
require 'dsa_visualizer'

# Focus on trees
topics = [:binary_tree, :bst, :heap]
topics.each do |topic|
  DSAVisualizer.learn(topic)
  puts "\n\nPress Enter to continue..."
  gets
end
```

### Integration with Your Code

```ruby
require 'dsa_visualizer'

# Learn before implementing
DSAVisualizer.learn(:hash_table)

# Then implement your own
class MyHashTable
  # Your implementation
end
```

## Troubleshooting

### Colors Not Showing
Install colorize gem:
```bash
gem install colorize
```

### CLI Not Starting
Make sure you're in the gem directory:
```bash
cd path/to/dsa_visualizer
ruby -Ilib bin/dsa_visualizer
```

### Topic Not Found
Check the topic key in the main menu. Use exact format (e.g., `2.1` not `2-1`).

## Next Steps

1. Complete all fundamentals (Section 1)
2. Master basic data structures (Sections 2-3)
3. Learn hashing and trees (Sections 4-5)
4. Study algorithms (Sections 8-9)
5. Tackle advanced topics (Sections 10-12)

## Support

For issues or questions:
- Check the README.md
- Review this USAGE.md
- Open an issue on GitHub

---

**Happy Learning! Master DSA one topic at a time! 🚀**
