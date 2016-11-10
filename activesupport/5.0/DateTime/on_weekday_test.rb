require 'test/unit'
require 'active_support/core_ext/time'

class TestDateTimeOnWeekday < Test::Unit::TestCase

  def test_on_weekday
    assert_false(DateTime.civil(2016, 11, 13).on_weekday?) # Sunday
    assert(DateTime.civil(2016, 11, 14).on_weekday?) # Monday
    assert(DateTime.civil(2016, 11, 15).on_weekday?) # Tuesday
    assert(DateTime.civil(2016, 11, 16).on_weekday?) # Wednesday
    assert(DateTime.civil(2016, 11, 17).on_weekday?) # Thursday
    assert(DateTime.civil(2016, 11, 18).on_weekday?) # Friday
    assert_false(DateTime.civil(2016, 11, 19).on_weekday?) # Sunday
  end

end