# frozen_string_literal: true
require 'test/unit'

class TestStringFreeze < Test::Unit::TestCase
  def test_string_with_frozen_string_literal
    str = 'hoge'
    assert(str.frozen?)
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