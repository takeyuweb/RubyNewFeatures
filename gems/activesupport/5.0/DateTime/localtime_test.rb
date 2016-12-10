require 'test/unit'
require 'active_support/core_ext/date_time'

class TestDateTimeLocaltime < Test::Unit::TestCase

  def test_localtime
    datetime = DateTime.civil(2016, 11, 1, 9, 0, 0)
    # タイムゾーンを地方時に設定した Time オブジェクトを得られます。
    assert_instance_of(Time, datetime.localtime('+09:00'))
    assert_equal(9 * 60 * 60, datetime.localtime.utc_offset)
  end

  def test_alias
    datetime = DateTime.civil(2016, 11, 1, 9, 0, 0)
    assert_equal(datetime.localtime('+09:00'), datetime.getlocal('+09:00'))
  end

end