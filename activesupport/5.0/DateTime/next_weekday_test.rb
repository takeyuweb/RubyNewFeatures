require 'test/unit'
require 'active_support'
require 'active_support/core_ext'

class TestTimeNextWeekday < Test::Unit::TestCase

  def test_next_weekday
    assert_equal(DateTime.civil(2016, 11, 28), DateTime.civil(2016, 11, 25).next_weekday) # 25日は金曜日なので週明け
    assert_equal(DateTime.civil(2016, 11, 28), DateTime.civil(2016, 11, 26).next_weekday) # 26日は土曜日なので週明け
    assert_equal(DateTime.civil(2016, 11, 28), DateTime.civil(2016, 11, 27).next_weekday) # 27日は日曜日なので翌日の月曜日
    assert_equal(DateTime.civil(2016, 11, 29), DateTime.civil(2016, 11, 28).next_weekday) # 28日は月曜日なので翌日の火曜日
  end

  def test_prev_weekday
    assert_equal(DateTime.civil(2016, 11, 24), DateTime.civil(2016, 11, 25).prev_weekday) # 25日は金曜日なので前日の木曜日
    assert_equal(DateTime.civil(2016, 11, 25), DateTime.civil(2016, 11, 26).prev_weekday) # 26日は土曜日なので前日の金曜日
    assert_equal(DateTime.civil(2016, 11, 25), DateTime.civil(2016, 11, 27).prev_weekday) # 27日は日曜日なので前の金曜日
    assert_equal(DateTime.civil(2016, 11, 25), DateTime.civil(2016, 11, 28).prev_weekday) # 28日は月曜日なので先週の金曜日
  end

end