require 'test/unit'

class TestFloatNext < Test::Unit::TestCase

  def test_next_float
    float = 0.0
    assert(float.next_float > float)
  end

  def test_division
    # 仮数部のビット数が多い方が指数部に使えるビット数が減るので精度が低くなり
    # Float#next_float での増分が大きくなる
    float_a = 100000000.0
    float_b = 1000000000.0
    next_float_a = float_a.next_float # 100000000.00000001
    next_float_b = float_b.next_float # 1000000000.0000001
    step_a = next_float_a - float_a
    step_b = next_float_b - float_b

    assert(step_a < step_b)
  end

end