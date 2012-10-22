#!/usr/bin/env ruby

require 'test/unit'
require 'stress_reporter'
require 'stress_reporter/checker'

class CheckerTest < Test::Unit::TestCase

  def test_average
    # All'inizio e' 0.0
    assert_equal 0.0, StressReporter::Checker.load_average
    StressReporter::Checker.go?
    # Poi presumibilmente no
    assert StressReporter::Checker.load_average > 0.0
  end

end
