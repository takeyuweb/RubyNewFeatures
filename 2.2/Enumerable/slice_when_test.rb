require 'test/unit'
require 'prime'

class TestEnumerableSliceAfter < Test::Unit::TestCase

  def test_slice_when
    # 素数 - 素数以外 の境界で区切ったチャンクを返すEnumerator
    chunks = (1 .. 20).slice_when { |i,j| Prime.prime?(i) && !Prime.prime?(j) }
    assert_instance_of(Enumerator, chunks)
    assert_equal(
        [
            [1, 2, 3],
            [4, 5],
            [6, 7],
            [8, 9, 10, 11],
            [12, 13],
            [14, 15, 16, 17],
            [18, 19],
            [20]
        ],
        chunks.to_a
    )
  end

  def test_timing
    # ブロック内が評価されるのは必要なとき
    count = 0
    chunks = (1 .. 5).slice_when do |i, j|
      count = count.succ
      Prime.prime?(i) && !Prime.prime?(j)
    end
    assert_equal([1, 2, 3], chunks.first)
    assert_equal(3, count)
  end


end