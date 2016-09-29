require 'test/unit'

class TestEnumerableMax < Test::Unit::TestCase
  def test_max_without_number
    array = [
        1,
        3,
        5,
        7,
        7,
        4
    ]
    assert_equal(7, array.max)
  end

  def test_max_with_number
    array = [
        1,
        3,
        5,
        7,
        5,
        4
    ]
    # max(n) で 大きい方からn個取り出せるようになりました。
    assert_equal([7, 5, 5], array.max(3))
  end

  def test_max_block_without_number
    array = [
        1,
        3,
        5,
        -7,
        5,
        4
    ]
    # 2つの値を受け取って比較に使う
    # 今回は絶対値で比較
    assert_equal(-7, array.max { |a, b| a.abs <=> b.abs })
  end

  def test_max_block_with_number
    array = [
        1,
        3,
        5,
        -7,
        5,
        4
    ]
    # 2つの値を受け取って比較に使う
    # 今回は絶対値で比較
    # max(n) { ... } で 大きい方からn個取り出せる
    assert_equal([-7, 5, 5], array.max(3) { |a, b| a.abs <=> b.abs })
  end
end
