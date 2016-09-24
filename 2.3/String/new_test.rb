# coding: ascii-8bit
require 'test/unit'

class TestStringNewWithEncoding < Test::Unit::TestCase
  def test_new_with_encoding
    str = String.new('Ruby', encoding:  Encoding::WINDOWS_31J)
    assert_equal(Encoding::WINDOWS_31J, str.encoding)
  end

  def test_new_with_valid_encoding
    # Shift_JIS の "あ"
    str = String.new("\x82\xa0", encoding:  Encoding::Shift_JIS)
    assert_equal(Encoding::Shift_JIS, str.encoding)
    assert(str.valid_encoding?)
  end

  def test_new_with_invalid_encoding
    # Shift_JIS の "あ"
    str = String.new("\x82\xa0", encoding:  Encoding::UTF_8)
    assert_equal(Encoding::UTF_8, str.encoding)
    assert_false(str.valid_encoding?)
  end

  def test_new_without_encoding
    str = String.new('Ruby')
    assert_equal(Encoding::ASCII_8BIT, str.encoding)
  end
end
