require 'test/unit'

class TestBsearch < Test::Unit::TestCase
  def test_array_bsearch
    array = [1, 2, 4, 8, 16, 32, 64, 128]
    assert_equal(64, array.bsearch{|x| x > 50})
  end

  def test_range_bsearch
    range = 0 .. 128
    assert_equal(51, range.bsearch{|x| x > 50})
  end
end
