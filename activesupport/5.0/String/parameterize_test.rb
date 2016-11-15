require 'test/unit'
require 'active_support/core_ext/string'

class TestStringParameterize < Test::Unit::TestCase

  def test_parameterize_opitions
    # default
    assert_equal('yuichi-takeuchi', 'Yuichi Takeuchi'.parameterize)
    # :separator オプションで区切りを-から_に変更
    assert_equal('yuichi_takeuchi', 'Yuichi Takeuchi'.parameterize(separator: '_'))
    # :preserve_case オプションで大文字小文字を保持
    assert_equal('Yuichi-Takeuchi', 'Yuichi Takeuchi'.parameterize(preserve_case: true))
    # 組み合わせ
    assert_equal('Yuichi_Takeuchi', 'Yuichi Takeuchi'.parameterize(separator: '_', preserve_case: true))
  end

end