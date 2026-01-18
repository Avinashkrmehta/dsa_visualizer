module DSAVisualizer
  class NotesManager
    def self.print_notes(title, notes)
      puts "\n📝 IMPORTANT NOTES - #{title}".colorize(:yellow).bold
      puts "═" * 80
      notes.each_with_index do |note, idx|
        puts "#{idx + 1}. #{note}"
      end
      puts "═" * 80
    end

    def self.print_key_points(points)
      puts "\n🎯 KEY POINTS TO REMEMBER".colorize(:green).bold
      puts "─" * 80
      points.each do |point|
        puts "  ✓ #{point}".colorize(:green)
      end
      puts "─" * 80
    end

    def self.print_time_complexity(operations)
      puts "\n⏱️  TIME COMPLEXITY SUMMARY".colorize(:cyan).bold
      puts "─" * 80
      operations.each do |op, complexity|
        puts "  #{op.ljust(30)} → #{complexity}".colorize(:light_blue)
      end
      puts "─" * 80
    end

    def self.print_space_complexity(complexity, explanation)
      puts "\n💾 SPACE COMPLEXITY".colorize(:magenta).bold
      puts "─" * 80
      puts "  #{complexity}"
      puts "  #{explanation}"
      puts "─" * 80
    end

    def self.print_when_to_use(use_cases)
      puts "\n✅ WHEN TO USE".colorize(:green).bold
      puts "─" * 80
      use_cases.each do |use_case|
        puts "  ✓ #{use_case}".colorize(:green)
      end
      puts "─" * 80
    end

    def self.print_when_not_to_use(avoid_cases)
      puts "\n❌ WHEN NOT TO USE".colorize(:red).bold
      puts "─" * 80
      avoid_cases.each do |avoid_case|
        puts "  ✗ #{avoid_case}".colorize(:red)
      end
      puts "─" * 80
    end

    def self.print_real_world_examples(examples)
      puts "\n🌍 REAL-WORLD APPLICATIONS".colorize(:yellow).bold
      puts "─" * 80
      examples.each_with_index do |example, idx|
        puts "  #{idx + 1}. #{example[:title]}".colorize(:yellow)
        puts "     #{example[:description]}"
      end
      puts "─" * 80
    end

    def self.print_common_mistakes(mistakes)
      puts "\n⚠️  COMMON MISTAKES TO AVOID".colorize(:red).bold
      puts "─" * 80
      mistakes.each do |mistake|
        puts "  ⚠  #{mistake}".colorize(:light_red)
      end
      puts "─" * 80
    end

    def self.print_practice_problems(problems)
      puts "\n💪 PRACTICE PROBLEMS".colorize(:cyan).bold
      puts "─" * 80
      problems.each_with_index do |problem, idx|
        puts "  #{idx + 1}. #{problem[:title]} [#{problem[:difficulty]}]".colorize(:cyan)
        puts "     #{problem[:description]}"
      end
      puts "─" * 80
    end
  end
end
