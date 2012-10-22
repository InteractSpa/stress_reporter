# This class has the knowledge of when to run the reporting
class StressReporter::Checker

  # This limit is going to be passed in as a command line arg
  # Defaults to 1.0
  LIMIT = ARGV.empty? ? 1 : ARGV[0].to_f

  # starts at 0.0
  @@load_average = 0.0

  # Returns true if limit exceeded. Sets @@load_average
  def self.go?
    @@load_average = Sys::CPU.load_avg[1]
    @@load_average > LIMIT
  end

  def self.load_average
    @@load_average
  end

end

