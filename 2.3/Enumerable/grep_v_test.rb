require 'test/unit'
require 'pp'

class TestGrepv < Test::Unit::TestCase
  def test_grep
    array = [1, 2, 3, 4, 5]
    assert_equal([2, 3, 4], array.grep(2..4))
  end

  def test_grep_v
    array = [1, 2, 3, 4, 5]
    assert_equal([1, 5], array.grep_v(2..4))
  end

  def test_grep_with_block
    array = [1, 2, 3, 4, 5]
    assert_equal([4, 6, 8], array.grep(2..4){ |x| x * 2 })
  end

  def test_grep_v_with_block
    array = [1, 2, 3, 4, 5]
    assert_equal([2, 10], array.grep_v(2..4){ |x| x * 2 })
  end

  def test_range_grep
    range = 1..5
    assert_equal([2, 3, 4], range.grep(2..4))
  end

  def test_range_grep_v
    range = 1..5
    assert_equal([1, 5], range.grep_v(2..4))
  end
end
