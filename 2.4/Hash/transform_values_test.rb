require 'test/unit'

class TestHashTransformValues < Test::Unit::TestCase

  def test_transform_values
    hash = {a: 1, b: 2, c: 3}
    transformed = hash.transform_values { |v| v ** 2 }
    assert_equal({a: 1, b: 4, c: 9}, transformed)

    hash = {a: '1', b: '2', c: '3'}
    transformed = hash.transform_values { |v| v.to_i }
    assert_equal({a: 1, b: 2, c: 3}, transformed)
  end

  def test_transform_values!
    hash = {a: 1, b: 2, c: 3}
    hash.transform_values! { |v| v ** 2 }
    assert_equal({a: 1, b: 4, c: 9}, hash)

    hash = {a: '1', b: '2', c: '3'}
    hash.transform_values! { |v| v.to_i }
    assert_equal({a: 1, b: 2, c: 3}, hash)
  end

end
