# Quick Start Guide - DSA Visualizer

Get started learning DSA in 5 minutes!

## Installation

```bash
gem install dsa_visualizer
```

## Start Learning

### Option 1: Interactive CLI (Recommended)

```bash
ruby -Ilib bin/dsa_visualizer
```

Then enter topic numbers like `1.1`, `2.1`, etc.

### Option 2: Direct in Ruby

```ruby
require 'dsa_visualizer'

# Start with fundamentals
DSAVisualizer.learn(:complexity_basics)
DSAVisualizer.learn(:memory_basics)

# Learn data structures
DSAVisualizer.learn(:array)
DSAVisualizer.learn(:linked_list)
DSAVisualizer.learn(:stack)
```

## Your First Day

### Morning (2 hours)
1. **Topic 1.1** - Time & Space Complexity
   ```ruby
   DSAVisualizer.learn(:complexity_basics)
   ```
   Learn: Big O notation, O(1), O(n), O(n²), O(log n)

2. **Topic 1.2** - Memory Management
   ```ruby
   DSAVisualizer.learn(:memory_basics)
   ```
   Learn: Stack vs Heap, how memory works

### Afternoon (2 hours)
3. **Topic 2.1** - Arrays
   ```ruby
   DSAVisualizer.learn(:array)
   ```
   Learn: Array internals, access, insertion, deletion

4. **Practice**: Implement your own array operations
   ```ruby
   # Try these:
   # - Find max element
   # - Reverse array
   # - Remove duplicates
   ```

## Week 1 Plan

### Day 1: Fundamentals
- 1.1 Time & Space Complexity
- 1.2 Memory Management

### Day 2: More Fundamentals
- 1.3 Pointers & References
- 1.4 Recursion Basics

### Day 3: Arrays & Strings
- 2.1 Arrays
- 2.2 Strings

### Day 4: Linked Lists
- 2.3 Linked Lists
- Practice: Implement linked list

### Day 5: Stack & Queue
- 3.1 Stack
- 3.3 Queue

### Day 6-7: Practice & Review
- Solve practice problems
- Review notes
- Implement structures from scratch

## Quick Commands

### In CLI
- Enter `1.1` → Learn Time Complexity
- Enter `2.1` → Learn Arrays
- Enter `progress` → See your progress
- Enter `0` → Exit

### In Ruby
```ruby
# Learn any topic
DSAVisualizer.learn(:topic_name)

# Start interactive CLI
DSAVisualizer.start_cli
```

## Tips for Success

1. **Don't skip fundamentals** - They're crucial!
2. **Code along** - Implement structures yourself
3. **Take notes** - Write down key points
4. **Practice daily** - Consistency beats intensity
5. **Review regularly** - Revisit topics weekly

## Common Topics

```ruby
# Fundamentals
:complexity_basics, :memory_basics, :pointers_basics, :recursion_basics

# Data Structures
:array, :linked_list, :stack, :queue, :hash_table, :binary_tree

# Algorithms
:bubble_sort, :merge_sort, :quick_sort
:linear_search, :binary_search
:bfs, :dfs, :dijkstra
```

## Need Help?

- Read `README.md` for full documentation
- Check `USAGE.md` for detailed usage guide
- Review topic notes and key points
- Practice the provided problems

## Next Steps

After completing Week 1:
1. Move to Hashing (Section 4)
2. Learn Trees (Section 5)
3. Study Sorting & Searching (Sections 8-9)
4. Tackle Graphs (Section 7)
5. Master Advanced Topics (Sections 10-12)

---

**Start now! Your DSA journey begins with a single topic! 🚀**

```bash
ruby -Ilib bin/dsa_visualizer
# Enter: 1.1
```
