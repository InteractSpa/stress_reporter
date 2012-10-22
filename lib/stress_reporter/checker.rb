class StressReporter::Checker

  # This limit is going to be passed in as a command line arg
  # Defaults to 1.0
  LIMIT = ARGV.empty? ? 1 : ARGV[0].to_f
  @@load_avarage = 0

  def self.go?
    @@load_avarage = Sys::CPU.load_avg[1]
    @@load_avarage > LIMIT
  end

  def self.load_avarage
    @@load_avarage
  end

end

