# Azioni da intraprendere per reportare su xmanager
class StressReporter::Actions::Xmanager

  CMD = "passenger-status"
  PID_REGEX = /PID: ([0-9]{1,})/

  def self.pids
    pids = []
    p = IO.popen(CMD)
    while !p.eof?
      line = p.readpartial(1024)
      m = line.scan PID_REGEX
      pids = m.flatten
    end
    pids
  end

  def self.current_requests
    requests = {}
    pids.each do |pid|
      if File.exist?("/tmp/xm_last_url_for_#{pid}")
        p = IO.popen("cat /tmp/xm_last_url_for_#{pid}")
        while !p.eof?
          requests[pid] = p.readpartial(1024)
      	end
      end
    end
    requests
  end

  # Report torna un array di stringhe
  def self.report
    out = []
    Xmanager.current_requests.each_pair do |pid, url|
      out << "PID:\t#{pid}\tREQUEST:\t#{url}"
    end
    out
  end

end
