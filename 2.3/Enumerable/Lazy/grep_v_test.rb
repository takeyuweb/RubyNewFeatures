require 'test/unit'

class TestLazyGrepv < Test::Unit::TestCase
  def test_grep_v
    range = (1..Float::INFINITY).lazy # 1～無限大の遅延リスト Enumerator::Lazy
    new_range = range.grep_v(2..4) # 2..4の間の値を含まない遅延リスト

    # 遅延リストの先頭から5つめまでを取り出してみる
    assert_equal([1,5,6,7,8], new_range.first(5))
  end
end
