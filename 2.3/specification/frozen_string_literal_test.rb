# frozen_string_literal: true
require 'test/unit'

class TestFrozonStringLiteral < Test::Unit::TestCase
  def test_frozen_string_literal
    assert('Hello, Ruby 2.3 World!!'.frozen?)
  end

  def test_raise_error
    assert_raise(RuntimeError) { 'abcdefg'.upcase! }
  end
end
