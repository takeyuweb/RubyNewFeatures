require 'test/unit'

class TestClamp < Test::Unit::TestCase

  def test_min_max
    v = 1000
    min = 0
    max = 100

    v = [[v, min].max, max].min
    assert_equal(max, v)
  end

  def test_clamp
    assert_equal(100, 101.clamp(0, 100))
    assert_equal(100, 100.clamp(0, 100))
    assert_equal(99, 99.clamp(0, 100))

    assert_equal(1, 1.clamp(0, 100))
    assert_equal(0, 0.clamp(0, 100))
    assert_equal(0, -1.clamp(0, 100))
  end

  def test_clamp_string
    assert_equal('z', '{'.clamp('A', 'z'))
    assert_equal('z', 'z'.clamp('A', 'z'))
    assert_equal('y', 'y'.clamp('A', 'z'))

    assert_equal('B', 'B'.clamp('A', 'z'))
    assert_equal('A', 'A'.clamp('A', 'z'))
    assert_equal('A', '@'.clamp('A', 'z'))
  end

end