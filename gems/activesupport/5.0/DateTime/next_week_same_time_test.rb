require 'test/unit'
require 'active_support'
# require 'active_support/core_ext/time' だとDateTime#acts_like?(:time) => falseになって挙動が変わるっぽい
require 'active_support/core_ext'

class TestNextWeekSameTime < Test::Unit::TestCase

  def test_next_week_option
    # 2016/11/25は金曜日
    datetime = DateTime.new(2016, 11, 25, 0, 1, 2)

    # DateTime#next_week は翌週頭（月曜日）を返す
    # デフォルトでは日時は0時0分0秒
    assert_equal(
        DateTime.new(2016, 11, 28, 0, 0, 0),
        datetime.next_week)

    # :same_time オプションを指定すると時刻を維持する
    assert_equal(
        DateTime.new(2016, 11, 28, 0, 1, 2),
        datetime.next_week(same_time: true))
  end

end