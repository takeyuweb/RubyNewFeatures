require 'test/unit'
require 'active_support'
require 'active_support/core_ext/enumerable'

class TestEnumerableWithout < Test::Unit::TestCase

  def test_array_without
    assert_equal(
        %i(apple banana),
        %i(apple orange banana).without(:orange, :melon))
  end

  def test_hash_without
    assert_equal(
        {apple: 1, banana: 3},
        {apple: 1, orange: 2, banana: 3}.without(:orange, :melon)
    )
  end

end