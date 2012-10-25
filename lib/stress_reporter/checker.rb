# This class has the knowledge of when to run the reporting.
# It may well become a strategy, or a DSL parser.
# For the time being the check is very crude, just check last  minute load
# average
class StressReporter::Checker

  # This limit can be passed in as a command line arg
  #
  # Defaults to 1.0
  LIMIT = ARGV.empty? ? 1.0 : ARGV[0].to_f

  # starts at 0.0
  @@load_average = 0.0

  # Returns true if limit exceeded. Sets @@load_average
  def self.go?
    @@load_average = Sys::CPU.load_avg[0].to_f
    @@load_average > LIMIT
  end

  # Returns last checked load average
  # @return [Float]
  def self.load_average
    @@load_average
  end

end

