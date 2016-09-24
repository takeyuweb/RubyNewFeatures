require 'test/unit'

class TestStringFreeze < Test::Unit::TestCase
  def test_string_without_frozen_string_literal
    str = 'hoge'
    assert_false(str.frozen?)
  end

  def test_modifiable_string
    str = +'hoge'
    assert_false(str.frozen?)
  end

  def test_frozen_string
    str = -'hoge'
    assert(str.frozen?)
  end
end