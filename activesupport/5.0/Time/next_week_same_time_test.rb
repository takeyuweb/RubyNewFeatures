require 'test/unit'
require 'active_support'
require 'active_support/core_ext'

class TestNextWeekSameTime < Test::Unit::TestCase

  def test_next_week_option
    # 2016/11/25は金曜日
    t = Time.mktime(2016, 11, 25, 0, 1, 2)

    # Time#next_week は翌週頭（月曜日）を返す
    # デフォルトでは日時は0時0分0秒
    assert_equal(
        Time.mktime(2016, 11, 28, 0, 0, 0),
        t.next_week)

    # :same_time オプションを指定すると時刻を維持する
    assert_equal(
        Time.mktime(2016, 11, 28, 0, 1, 2),
        t.next_week(same_time: true))

    # 曜日を指定することもできる
    assert_equal(
        Time.mktime(2016, 12, 1, 0, 1, 2),
        t.next_week(:thursday, same_time: true))
  end

end