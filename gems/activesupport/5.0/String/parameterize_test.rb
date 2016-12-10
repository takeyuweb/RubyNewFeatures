require 'test/unit'
require 'active_support'
require 'active_support/core_ext/string'

class TestStringParameterize < Test::Unit::TestCase

  def test_parameterize_without_options
    # default
    assert_equal('hoge-fuga-hogefuga', 'Hoge Fuga/HogeFuga'.parameterize)
    # 引数で区切りを_に指定
    assert_equal('hoge_fuga_hogefuga', 'Hoge Fuga/HogeFuga'.parameterize('_'))
  end

  def test_parameterize_with_options
    # :separator オプションで区切りを-から_に変更
    assert_equal('hoge_fuga_hogefuga', 'Hoge Fuga/HogeFuga'.parameterize(separator: '_'))
    # :preserve_case オプションで大文字小文字を保持
    assert_equal('Hoge-Fuga-HogeFuga', 'Hoge Fuga/HogeFuga'.parameterize(preserve_case: true))
    # 組み合わせ
    assert_equal('Hoge_Fuga_HogeFuga', 'Hoge Fuga/HogeFuga'.parameterize(separator: '_', preserve_case: true))
  end

end