require 'test/unit'

class TestSymbolMappings < Test::Unit::TestCase

  def test_upcase
    assert_equal(:'ＡＢＣⅠⅡⅢⅣⅤ', :'ａｂｃⅰⅱⅲⅳⅴ'.upcase)
  end

  def test_downcase
    assert_equal(:'ａｂｃⅰⅱⅲⅳⅴ', :'ＡＢＣⅠⅡⅢⅣⅤ'.downcase)
  end

  def test_swapcase
    assert_equal(:'ＡｂＣⅠⅱⅢⅳⅤ', :'ａＢｃⅰⅡⅲⅣⅴ'.swapcase)
  end

  def test_capitalize
    assert_equal(:'Ｈｅｌｌｏ', :'ｈＥＬｌｏ'.capitalize)
  end

end

