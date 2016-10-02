# coding: utf-8
require 'test/unit'

class TestUnicodeNormalize < Test::Unit::TestCase

  def test_unicode_normalize
    assert_equal(
        "\u{30AC}", # 濁点付き片仮名カ
        'ガ'.unicode_normalize(:nfc))

    assert_equal(
        "\u{30AB}\u{3099}", # 片仮名カ + COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK
        'ガ'.unicode_normalize(:nfd))
  end

  def test_unicode_normalize_compatibility_error
    sjis_string = 'ガ'.encode(Encoding::SJIS)
    assert_raise(Encoding::CompatibilityError) { sjis_string.unicode_normalize(:nfc) }
  end

  def test_unicode_normalize!
    string = 'ガ'
    string.unicode_normalize!(:nfd)
    # !付きはself自体を変更する
    assert_equal(
        "\u{30AB}\u{3099}", # 片仮名カ + COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK
        string)
  end

  def test_unicode_normalized?
    nfc_string = 'ガ'.unicode_normalize(:nfc)
    assert(nfc_string.unicode_normalized?(:nfc))
    assert_false(nfc_string.unicode_normalized?(:nfd))
  end

end