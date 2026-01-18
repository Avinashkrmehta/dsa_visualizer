module DSAVisualizer
  class MemoryTracker
    attr_reader :allocations, :operations

    def initialize
      @allocations = []
      @operations = []
      @step_count = 0
    end

    def track_allocation(type, size, object)
      @allocations << {
        type: type,
        size: size,
        address: object.object_id,
        timestamp: Time.now
      }
    end

    def track_operation(operation, details)
      @step_count += 1
      @operations << {
        step: @step_count,
        operation: operation,
        details: details,
        timestamp: Time.now
      }
    end

    def print_summary
      puts "\n📊 Memory & Operations Summary:".colorize(:cyan).bold
      puts "\nAllocations: #{@allocations.size}"
      @allocations.each do |alloc|
        puts "  - #{alloc[:type]} (size: #{alloc[:size]}) at 0x#{alloc[:address].to_s(16)}"
      end

      puts "\nOperations: #{@operations.size}"
      @operations.each do |op|
        puts "  #{op[:step]}. #{op[:operation]}: #{op[:details]}"
      end
    end

    def reset
      @allocations.clear
      @operations.clear
      @step_count = 0
    end
  end
end
