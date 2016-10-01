require 'test/unit'

class TestFloatPrev < Test::Unit::TestCase

  def test_prev_float
    float = 0.0
    assert(float.prev_float < float)
  end

  def test_division
    # 仮数部のビット数が多い方が指数部に使えるビット数が減るので精度が低くなり
    # Float#prev_float での差分が大きくなる
    float_a = 100000000.0
    float_b = 1000000000.0
    prev_float_a = float_a.prev_float # 100000000.00000001
    prev_float_b = float_b.prev_float # 1000000000.0000001
    step_a = float_a - prev_float_a
    step_b = float_b - prev_float_b

    assert(step_a < step_b)
  end

  def test_infinity
    assert_equal(nil, Float::INFINITY.prev_float.infinite?)
    assert_equal(-1, (-Float::INFINITY).prev_float.infinite?)
  end

  def test_nan
    assert(Float::NAN.prev_float.nan?)
  end

end