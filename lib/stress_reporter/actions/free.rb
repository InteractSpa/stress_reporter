module StressReporter
  module Actions
    # Returns output of free command
    #
    # TODO: Should read /proc directly
    class Free

      # Report returns a string array
      def self.report
        `free`.map(&:chomp)
      end
    end
  end
end
