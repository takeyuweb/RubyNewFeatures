require 'test/unit'
require 'active_support/duration'
require 'active_support/core_ext/time'
require 'active_support/core_ext/integer'

class TestDurationIso8601 < Test::Unit::TestCase

  def test_parse
    # https://en.wikipedia.org/wiki/ISO_8601#Durations
    duration = ActiveSupport::Duration.parse('P3Y6M4DT12H30M5S')
    assert_equal(Time.utc(2016, 11, 1) + duration,
                 Time.utc(2020, 5, 5, 12, 30, 5))
  end

  def test_iso8061
    assert_equal('P4Y3DT1H',
                 (4.years + 3.days + 1.hours).iso8601)
  end

end