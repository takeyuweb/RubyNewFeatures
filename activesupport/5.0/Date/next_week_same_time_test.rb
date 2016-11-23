require 'test/unit'
require 'active_support'
require 'active_support/core_ext'

class TestNextWeekSameTime < Test::Unit::TestCase

  def test_next_week_option
    # 2016/11/25は金曜日
    date = Date.new(2016, 11, 25)

    # Date#next_week は翌週頭（月曜日）を返す
    assert_equal(
        Date.new(2016, 11, 28),
        date.next_week)

    # :same_time オプションはDateTieやTimeとのducktypingのため
    assert_equal(
        Date.new(2016, 11, 28),
        date.next_week(same_time: true))
  end

end