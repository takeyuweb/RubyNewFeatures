require 'test/unit'

class TestHashComparison < Test::Unit::TestCase
  def test_greater
    a = { hoge: 'Hoge', fuga: 'Fuga', hogefuga: 'HogeFuga' }
    b = { hoge: 'Hoge', fuga: 'Fuga', hogefuga: 'HogeFuga' }
    c = { hoge: 'Hoge', fuga: 'Fuga' }

    assert(a >= b)
    assert_false(a > b)
    assert(a > c)

    assert(b >= a)
    assert_false(b > a)
    assert_false(b > a)
  end

  def test_lesser
    a = { hoge: 'Hoge', fuga: 'Fuga', hogefuga: 'HogeFuga' }
    b = { hoge: 'Hoge', fuga: 'Fuga', hogefuga: 'HogeFuga' }
    c = { hoge: 'Hoge', fuga: 'Fuga' }

    assert(a <= b)
    assert_false(a < b)
    assert_false(a < c)

    assert(b <= a)
    assert_false(b < a)
    assert(c < a)
  end
end