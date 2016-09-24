require 'test/unit'

class TestPositiveNegative < Test::Unit::TestCase
  def test_positive
    assert(1.positive?)
    assert_false(-1.positive?)
    assert(0.1.positive?)
    assert_false(-0.1.positive?)
  end

  def test_negative
    assert_false(1.negative?)
    assert(-1.negative?)
    assert_false(0.1.negative?)
    assert(-0.1.negative?)
  end

  def test_zero
    assert_false(0.positive?)
    assert_false(0.negative?)
  end
end