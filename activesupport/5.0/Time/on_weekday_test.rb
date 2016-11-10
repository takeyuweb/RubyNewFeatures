require 'test/unit'
require 'active_support/core_ext/time'

class TestTimeOnWeekday < Test::Unit::TestCase

  def test_on_weekday
    assert_false(Time.utc(2016, 11, 13).on_weekday?) # Sunday
    assert(Time.utc(2016, 11, 14).on_weekday?) # Monday
    assert(Time.utc(2016, 11, 15).on_weekday?) # Tuesday
    assert(Time.utc(2016, 11, 16).on_weekday?) # Wednesday
    assert(Time.utc(2016, 11, 17).on_weekday?) # Thursday
    assert(Time.utc(2016, 11, 18).on_weekday?) # Friday
    assert_false(Time.utc(2016, 11, 19).on_weekday?) # Sunday
  end

end