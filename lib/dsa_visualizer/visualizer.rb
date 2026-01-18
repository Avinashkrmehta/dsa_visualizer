module DSAVisualizer
  class Visualizer
    def self.print_header(title)
      puts "\n" + "=" * 80
      puts title.center(80).colorize(:cyan).bold
      puts "=" * 80 + "\n"
    end

    def self.print_section(title)
      puts "\n#{title}".colorize(:yellow).bold
      puts "-" * 60
    end

    def self.print_step(step_num, description)
      puts "\n[Step #{step_num}] ".colorize(:green) + description
    end

    def self.print_memory(label, data)
      puts "\n#{label}:".colorize(:magenta)
      puts "  Memory Address: #{data.object_id}".colorize(:light_black)
      puts "  Value: #{data.inspect}"
    end

    def self.print_comparison(ruby_code, cpp_code, explanation)
      puts "\n┌─ Ruby Implementation ".ljust(79, "─") + "┐"
      ruby_code.each_line { |line| puts "│ #{line.chomp}".ljust(79) + "│" }
      puts "└".ljust(79, "─") + "┘"
      
      puts "\n┌─ C++ Implementation ".ljust(79, "─") + "┐"
      cpp_code.each_line { |line| puts "│ #{line.chomp}".ljust(79) + "│" }
      puts "└".ljust(79, "─") + "┘"
      
      puts "\n💡 Core Difference:".colorize(:light_blue)
      puts "   #{explanation}"
    end

    def self.visualize_array(arr, highlight_index = nil)
      print "\n["
      arr.each_with_index do |val, idx|
        if idx == highlight_index
          print " #{val} ".colorize(:background => :green)
        else
          print " #{val} "
        end
        print "|" unless idx == arr.length - 1
      end
      puts "]"
    end

    def self.visualize_memory_layout(structure_name, elements)
      puts "\n📦 Memory Layout (#{structure_name}):".colorize(:cyan)
      elements.each_with_index do |elem, idx|
        addr = elem.object_id
        puts "  [#{idx}] Address: 0x#{addr.to_s(16)} → Value: #{elem}"
      end
    end
  end
end
