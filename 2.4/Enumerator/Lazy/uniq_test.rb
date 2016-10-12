require 'test/unit'

class TestUniq < Test::Unit::TestCase

  def test_uniq
    range = (1..Float::INFINITY).lazy # 1, 2, 3, ...無限大 の遅延リスト Enumerator::Lazy
    lazy = range.uniq { |x| x ** 2 % 10 }

    # Enumerator::Lazy#uniq は Enumerator::Lazy を返す（まだ評価されない）
    assert_instance_of(Enumerator::Lazy, lazy)

    # lazy.first(n)
    # x ** 2 % 10 の結果がユニークになるxをn個になるまで繰り返す
    #
    # 1: 1**2 % 10 = 1
    # 2: 4
    # 3: 9
    # 4: 6
    # 5: 5
    # 6: 6
    # 7: 9
    # 8: 4
    # 9: 1
    # 10: 0
    # 11: 1
    # 12: 4
    # 13: 9
    # ...以下繰り返し
    assert_equal([1, 2, 3, 4, 5, 10], lazy.first(6))
  end

end
