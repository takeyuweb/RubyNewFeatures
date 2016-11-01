require 'test/unit'
require 'active_support/core_ext/date_time'

class TestDateTimeUtc < Test::Unit::TestCase

  def test_utc
    datetime = DateTime.civil(2016, 11, 1, 9, 0, 0, '+0900')
    assert_equal(Time.utc(2016, 11, 1, 0, 0, 0), datetime.utc)
  end

end