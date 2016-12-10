require 'test/unit'
require 'active_support/core_ext/time'

class TestTimeDaysInYear < Test::Unit::TestCase

  def test_days_in_year
    # その年の日数を返す
    # 引数が無いときは今年
    # Time.days_in_year => 365 or 366
    assert_equal(366, Time.days_in_year(2016))
    assert_equal(365, Time.days_in_year(2017))
    assert_equal(365, Time.days_in_year(2018))
    assert_equal(365, Time.days_in_year(2019))
    assert_equal(366, Time.days_in_year(2020))
  end

end