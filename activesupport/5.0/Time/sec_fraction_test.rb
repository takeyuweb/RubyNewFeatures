require 'test/unit'
require 'active_support/core_ext/time'

class TestTimeSecFraction < Test::Unit::TestCase

  # 秒を分数で得る
  def test_sec_fraction
    time = Time.new(2016, 11, 4, 0, 0, 0.5)
    assert_instance_of(Rational, time.sec_fraction)
    assert_equal(Rational(1, 2), time.sec_fraction)
  end

  def test_subsec
    time = Time.now
    # 標準の Time#subsec と同じ
    assert_equal(time.subsec, time.sec_fraction)
  end

end