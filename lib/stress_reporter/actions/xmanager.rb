module StressReporter
  # Classes under this namespace define specific things to do
  # to include in reporting. They have to respond to #report with
  # a string array.
  module Actions
    # Reports on passenger usage by calling passenger-status
    # (pid and current request)
    #
    # TODO: We should not assume that xm_last_url_for_{pid} are in /tmp
    #
    # TODO: Spawning passenger-status is slow, probably we should include
    # the passenger gem and use its methods.
    class Xmanager

      CMD = "passenger-status"
      PID_REGEX = /PID:\s*(\d+)/

      # Report lines
      # @return [Array<String>]
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
        p = `#{ CMD }`
        p.scan(PID_REGEX).flatten
      end

      # Returns hash { pid => url }
      def self.current_requests
        requests = {}
        pids.each do |pid|
          requests[pid] = File.read("/tmp/xm_last_url_for_#{ pid }").chomp rescue "Not xmanager or fresh process"
        end
        requests
      end
    end
  end
end
