module StressReporter
  module Actions
    # Actions to report on passenger usage.
    # Current requests, urls, pids
    # TODO: We should not assume that xm_last_url_for_{pid} are in /tmp
    # TODO: Spawning passenger-status is slow
    class Xmanager

      CMD = "passenger-status"
      PID_REGEX = /PID:\s*(\d+)/

      # Report returns a string array
      def self.report
        out = []
        Xmanager.current_requests.each_pair do |pid, url|
          out << "PID:\t#{ pid }\tREQUEST:\t#{ url }"
        end
        out
      end

      private

      # Returns array of pids of current passenger processes
      def self.pids
        pids = []
        p = `#{ CMD }`
        p.scan(PID_REGEX).flatten
      end

      # Returns hash { pid => url }
      def self.current_requests
        requests = {}
        pids.each do |pid|
          requests[pid] = File.read("/tmp/xm_last_url_for_#{ pid }").chomp
        end
        requests
      end

    end
  end
end
