require 'test/unit'
require 'active_support/core_ext'

class TestTimeOnWeekend < Test::Unit::TestCase

  def test_on_weekend?
    assert(DateTime.civil(2016, 11, 13).on_weekend?) # Sunday
    assert_false(DateTime.civil(2016, 11, 14).on_weekend?) # Monday
    assert_false(DateTime.civil(2016, 11, 15).on_weekend?) # Tuesday
    assert_false(DateTime.civil(2016, 11, 16).on_weekend?) # Wednesday
    assert_false(DateTime.civil(2016, 11, 17).on_weekend?) # Thursday
    assert_false(DateTime.civil(2016, 11, 18).on_weekend?) # Friday
    assert(DateTime.civil(2016, 11, 19).on_weekend?) # Saturday
  end

end