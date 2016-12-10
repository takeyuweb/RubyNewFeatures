require 'test/unit'
require 'active_support/core_ext/date_time'

class TestDateTimeSubsec < Test::Unit::TestCase

  def test_subsec
    # Time#subsec と同じように 時刻を表す分数を返す
    date_time = DateTime.now
    # p date_time.subsec => (4554219/5000000)
    assert_instance_of(Rational, date_time.subsec)
    assert_equal(date_time.to_f, date_time.to_i + date_time.subsec)
  end

  def test_sec_fraction
    # 標準の DateTime#sec_fraction と同じ
    date_time = DateTime.now
    assert_equal(date_time.sec_fraction, date_time.subsec)
  end

end
