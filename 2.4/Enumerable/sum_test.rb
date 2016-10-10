require 'test/unit'

class TestSum < Test::Unit::TestCase

  def test_sum
    hash = { a: 1, b: 2, c: 3, d: 1 }
    # sumに渡したブロックの戻り値を合計する
    assert_equal(7, hash.sum {|k, v| v })
  end

end
