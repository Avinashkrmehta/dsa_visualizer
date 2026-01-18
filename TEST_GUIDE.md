# Testing Guide - DSA Visualizer

## Quick Test

### 1. Test Gem Loading

```bash
ruby -Ilib -r dsa_visualizer -e "puts 'Gem loaded successfully!'"
```

Expected output: `Gem loaded successfully!`

### 2. Test a Single Topic

```bash
ruby -Ilib -r dsa_visualizer -e "DSAVisualizer.learn(:complexity_basics)"
```

Expected: Full complexity analysis tutorial with Ruby vs C++ comparisons

### 3. Test Interactive CLI

```bash
ruby -Ilib bin/dsa_visualizer
```

Expected: Interactive menu with 12 sections

## Test Each Component

### Test Fundamentals

```ruby
require_relative 'lib/dsa_visualizer'

# Test each fundamental topic
DSAVisualizer.learn(:complexity_basics)
DSAVisualizer.learn(:memory_basics)
DSAVisualizer.learn(:pointers_basics)
DSAVisualizer.learn(:recursion_basics)
```

### Test Data Structures

```ruby
require_relative 'lib/dsa_visualizer'

# Test implemented data structures
DSAVisualizer.learn(:array)
DSAVisualizer.learn(:linked_list)
DSAVisualizer.learn(:stack)
DSAVisualizer.learn(:queue)
DSAVisualizer.learn(:hash_table)
DSAVisualizer.learn(:binary_tree)
```

### Test Algorithms

```ruby
require_relative 'lib/dsa_visualizer'

# Test implemented algorithms
DSAVisualizer.learn(:bubble_sort)
DSAVisualizer.learn(:binary_search)
```

### Test CLI Navigation

1. Start CLI: `ruby -Ilib bin/dsa_visualizer`
2. Enter `1.1` - Should show Time Complexity
3. Enter `2.1` - Should show Arrays
4. Enter `progress` - Should show progress tracker
5. Enter `0` - Should exit

## Test Examples

### Test Example Scripts

```bash
# Test fundamentals learning
ruby -Ilib examples/learn_fundamentals.rb

# Test language comparison
ruby -Ilib examples/compare_languages.rb

# Test custom learning path
ruby -Ilib examples/custom_learning_path.rb

# Test original demo
ruby -Ilib examples/demo.rb
```

## Expected Behavior

### Successful Topic Load
- Header with topic name
- Introduction section
- Ruby code example
- C++ code example
- Comparison explanation
- Visual representations
- Complexity analysis
- Notes and key points
- Practice problems

### CLI Navigation
- Clear menu display
- Topic selection works
- Progress tracking saves
- Exit works cleanly

### Color Output
- Headers in cyan
- Sections in yellow
- Key points in green
- Warnings in red
- Code in default color

## Common Issues

### Issue: Colors not showing
**Solution**: Install colorize gem
```bash
gem install colorize
```

### Issue: CLI not starting
**Solution**: Check you're in correct directory
```bash
cd path/to/dsa_visualizer
ruby -Ilib bin/dsa_visualizer
```

### Issue: Topic not found
**Solution**: Check topic key exists in TOPIC_MAP
```ruby
puts DSAVisualizer::TOPIC_MAP.keys
```

### Issue: Progress not saving
**Solution**: Check home directory permissions
```bash
ls -la ~/.dsa_visualizer_progress
```

## Manual Testing Checklist

- [ ] Gem loads without errors
- [ ] All fundamental topics work
- [ ] All data structure topics work
- [ ] All algorithm topics work
- [ ] CLI starts and displays menu
- [ ] Topic selection works (e.g., "2.1")
- [ ] Progress tracking works
- [ ] Colors display correctly
- [ ] Ruby code examples show
- [ ] C++ code examples show
- [ ] Comparisons are clear
- [ ] Notes display properly
- [ ] Key points display properly
- [ ] Practice problems show
- [ ] Examples run without errors

## Automated Testing (Future)

```ruby
# spec/dsa_visualizer_spec.rb
require 'spec_helper'

RSpec.describe DSAVisualizer do
  it "loads successfully" do
    expect(DSAVisualizer).to be_a(Module)
  end
  
  it "has TOPIC_MAP" do
    expect(DSAVisualizer::TOPIC_MAP).to be_a(Hash)
  end
  
  it "can learn a topic" do
    expect { DSAVisualizer.learn(:array) }.not_to raise_error
  end
end
```

## Performance Testing

Test with large inputs:

```ruby
# Test array with large size
arr = Array.new(10000) { rand(1000) }
# Visualize operations
```

## Integration Testing

Test full learning path:

```ruby
# Complete fundamentals
[:complexity_basics, :memory_basics, :pointers_basics, :recursion_basics].each do |topic|
  DSAVisualizer.learn(topic)
end

# Verify progress saved
# Check ~/.dsa_visualizer_progress
```

## Reporting Issues

When reporting issues, include:
1. Ruby version: `ruby -v`
2. Gem version: Check `lib/dsa_visualizer/version.rb`
3. Operating system
4. Error message (full stack trace)
5. Steps to reproduce

## Success Criteria

✅ All topics load without errors
✅ CLI navigation works smoothly
✅ Progress tracking persists
✅ Colors display correctly
✅ Examples run successfully
✅ Documentation is clear
✅ No memory leaks
✅ Performance is acceptable

---

**Happy Testing! Report any issues you find! 🐛**
