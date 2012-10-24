module StressReporter
  module Actions
    # Actions to report on passenger usage.
    # Current requests, urls, pids
    # TODO: We should not assume that xm_last_url_for_{pid} are in /tmp
    # TODO: Spawning passenger-status is slow
    class Free

      # Report returns a string array
      def self.report
        `free`.map(&:chomp)
      end
    end
  end
end