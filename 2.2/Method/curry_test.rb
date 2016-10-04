require 'test/unit'

class TestMethodCurry < Test::Unit::TestCase

  def test_curry
    # メソッドmulをカリー化したProcを返す
    curried_mul = self.method(:mul).curry
    assert_instance_of(Proc, curried_mul)
  end

  def test_partial_application
    curried_mul = self.method(:mul).curry

    # カリー化したProcを実行する際に引数が足りないと部分適用したカリー化Procを返す
    to_double = curried_mul.call(2)
    assert_instance_of(Proc, to_double)
  end

  def test_currying
    curried_mul = self.method(:mul).curry
    to_double = curried_mul.call(2)

    # カリー化Procに十分な数の引数を渡すと実行結果を返す
    # ここでは Array#map の引数としてカリー化Procを渡すことで各要素に対して実行し結果をまとめる
    array = [1, 2, 3, 4, 5]
    assert_equal(
        [2, 4, 6, 8, 10],
        array.map(&to_double)
    )
  end

  private def mul(a, b)
    a * b
  end

end