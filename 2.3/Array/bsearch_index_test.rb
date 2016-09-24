require 'test/unit'

class TestBsearchIndex < Test::Unit::TestCase
  def test_array_bsearch_index
    array = [1, 2, 4, 8, 16, 32, 64, 128]
    assert_equal(6, array.bsearch_index{|x| x > 50})
  end
end
