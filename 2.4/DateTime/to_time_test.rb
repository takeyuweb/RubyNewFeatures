require 'test/unit'
require 'date'

class TestTimeToTime < Test::Unit::TestCase

  def setup
    ENV['TZ'] = 'Asia/Tokyo' # +09:00
  end

  def test_to_time
    datetime = DateTime.civil(2016, 11, 5, 9, 0, 0, '-10:00') # Pacific/Honolulu
    assert_equal('-10:00', datetime.zone)
    assert_equal(-10 * 3600, datetime.to_time.utc_offset)
    # assert_equal(9 * 3600, datetime.to_time.utc_offset) # Ruby 2.3以前

    p datetime.to_s
    p datetime.to_time.to_s
    # Ruby 2.4
    # "2016-11-05T09:00:00-10:00"
    # "2016-11-05 09:00:00 -1000"
    # Ruby 2.3以前
    # "2016-11-05T09:00:00-10:00"
    # "2016-11-06 04:00:00 +0900"
  end

end
