# Contributing to DSA Visualizer

Thank you for your interest in contributing! This guide will help you get started.

## How to Contribute

### 1. Report Bugs

Found a bug? Please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Ruby version and OS
- Error messages (if any)

### 2. Suggest Features

Have an idea? Open an issue with:
- Feature description
- Use case / motivation
- Proposed implementation (optional)

### 3. Improve Documentation

- Fix typos
- Clarify explanations
- Add examples
- Improve README/USAGE guides

### 4. Add New Topics

Want to add a new DSA topic? Great!

#### Structure for New Topic

```ruby
module DSAVisualizer
  module DataStructures  # or Algorithms, Fundamentals
    class YourTopic
      def self.learn
        Visualizer.print_header("TOPIC NAME - Description")
        
        # 1. Introduction
        puts "\n📖 WHAT IS THIS?".colorize(:cyan).bold
        puts "Explanation..."
        
        # 2. Code Comparison
        Visualizer.print_section("1. Implementation")
        
        ruby_code = <<~RUBY
          # Ruby implementation
        RUBY
        
        cpp_code = <<~CPP
          // C++ implementation
        CPP
        
        Visualizer.print_comparison(ruby_code, cpp_code, "Explanation")
        
        # 3. Visual Representation
        Visualizer.print_section("2. Visualization")
        # Add ASCII art, diagrams
        
        # 4. Complexity Analysis
        NotesManager.print_time_complexity({
          "Operation" => "O(n)",
          "Another" => "O(1)"
        })
        
        # 5. Notes
        notes = [
          "Important point 1",
          "Important point 2"
        ]
        NotesManager.print_notes("Topic Name", notes)
        
        # 6. Key Points
        key_points = [
          "Key takeaway 1",
          "Key takeaway 2"
        ]
        NotesManager.print_key_points(key_points)
        
        # 7. When to Use
        use_cases = [
          "Use case 1",
          "Use case 2"
        ]
        NotesManager.print_when_to_use(use_cases)
        
        # 8. Common Mistakes
        mistakes = [
          "Mistake 1",
          "Mistake 2"
        ]
        NotesManager.print_common_mistakes(mistakes)
        
        # 9. Practice Problems
        problems = [
          { title: "Problem 1", difficulty: "Easy", description: "..." },
          { title: "Problem 2", difficulty: "Medium", description: "..." }
        ]
        NotesManager.print_practice_problems(problems)
      end
    end
  end
end
```

#### Steps to Add Topic

1. Create file in appropriate directory:
   - `lib/dsa_visualizer/fundamentals/` for fundamentals
   - `lib/dsa_visualizer/data_structures/` for data structures
   - `lib/dsa_visualizer/algorithms/` for algorithms

2. Add require statement in `lib/dsa_visualizer.rb`

3. Add topic to `TOPIC_MAP` in `lib/dsa_visualizer.rb`

4. Add topic to CLI curriculum in `lib/dsa_visualizer/cli.rb`

5. Test your implementation

6. Update documentation

### 5. Improve Existing Topics

- Add more examples
- Improve explanations
- Add visualizations
- Fix errors
- Add practice problems

## Development Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/dsa_visualizer.git
cd dsa_visualizer

# Install dependencies
bundle install

# Run tests (when available)
bundle exec rspec

# Test your changes
ruby -Ilib bin/dsa_visualizer
```

## Code Style

- Use 2 spaces for indentation
- Follow Ruby style guide
- Add comments for complex logic
- Use descriptive variable names
- Keep methods focused and small

## Commit Messages

Use clear, descriptive commit messages:

```
Add heap data structure implementation

- Implement min heap and max heap
- Add heapify operations
- Include Ruby vs C++ comparison
- Add practice problems
```

## Pull Request Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### PR Checklist

- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings
- [ ] Tests added (if applicable)
- [ ] All tests pass
- [ ] Tested manually

## Areas Needing Help

### High Priority
- [ ] Complete all tree implementations (AVL, Red-Black, B-Tree)
- [ ] Complete all graph algorithms (Dijkstra, Bellman-Ford, Floyd-Warshall)
- [ ] Complete all sorting algorithms
- [ ] Add dynamic programming examples
- [ ] Add more practice problems

### Medium Priority
- [ ] Add quiz mode
- [ ] Improve visualizations
- [ ] Add more real-world examples
- [ ] Performance optimizations
- [ ] Better error handling

### Low Priority
- [ ] Export to PDF
- [ ] Web interface
- [ ] Video tutorials
- [ ] Community examples
- [ ] Internationalization

## Questions?

- Open an issue for questions
- Check existing issues first
- Be respectful and constructive

## Code of Conduct

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Help others learn

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in documentation

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing! Together we can help developers master DSA! 🚀**
