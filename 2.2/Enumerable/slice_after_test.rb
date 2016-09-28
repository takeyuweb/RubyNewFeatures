require 'test/unit'
require 'prime'

class TestEnumerableSliceAfter < Test::Unit::TestCase

  def test_slice_after
    # 素数区切りのチャンクを返すEnumerator
    chunks = (1 .. 20).slice_after { |i| Prime.prime?(i) }
    assert_instance_of(Enumerator, chunks)
    assert_equal(
        [
            [1, 2],
            [3],
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
    chunks = (1 .. 5).slice_after do |i|
      count = count.succ
      Prime.prime?(i)
    end
    assert_equal([1, 2], chunks.first)
    assert_equal(2, count)
  end


end