require 'test/unit'

class TestChunkWhile < Test::Unit::TestCase
  def test_chunk_while
    # 前後で10以上の変化が現れたところで区切る
    array = [7, 14, 1, 12, 16, 14, 13, 6, 2, 7, 12, 15, 2, 11, 18, 18, 16, 6, 13, 16]
    assert_equal(
        [
            [7, 14],
            [1],
            [12, 16, 14, 13, 6, 2, 7, 12, 15],
            [2, 11, 18, 18, 16],
            [6, 13, 16]
        ],
        array.chunk_while { |a, b| (a - b).abs < 10 }.to_a)
  end
end