require 'test/unit'
require 'active_support'
require 'active_support/core_ext/date_time'

class TestTimePreservesTimezone < Test::Unit::TestCase

  def setup
    ENV['TZ'] = 'Asia/Tokyo' # +09:00
  end

  def test_default
    assert_false(ActiveSupport.to_time_preserves_timezone)
  end

  def test_false
    ActiveSupport.to_time_preserves_timezone = false

    # デフォルト=false のとき
    # DateTime#to_time はタイムゾーンを引き継がない
    datetime = DateTime.civil(2016, 11, 5, 9, 0, 0, '-10:00') # Pacific/Honolulu
    assert_equal('-10:00', datetime.zone)
    assert_equal(9 * 3600, datetime.to_time.utc_offset)
  end

  def test_true
    ActiveSupport.to_time_preserves_timezone = true

    # true のとき
    # DateTime#to_time はタイムゾーンを引き継ぐ
    datetime = DateTime.civil(2016, 11, 5, 9, 0, 0, '-10:00') # Pacific/Honolulu
    assert_equal('-10:00', datetime.zone)
    assert_equal(-10 * 3600, datetime.to_time.utc_offset)
  end

end
