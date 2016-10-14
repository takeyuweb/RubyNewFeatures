require 'test/unit'

class TestFloatCeil < Test::Unit::TestCase

  def test_ceil
    assert_equal(4, Math::PI.ceil)
    assert_equal(3.2, Math::PI.ceil(1))
    assert_equal(3.15, Math::PI.ceil(2))
    assert_equal(3.142, Math::PI.ceil(3))
  end

  def test_floor
    assert_equal(3, Math::PI.floor)
    assert_equal(3.1, Math::PI.floor(1))
    assert_equal(3.14, Math::PI.floor(2))
    assert_equal(3.141, Math::PI.floor(3))
  end

end
