require 'test/unit'

class TestRegexpMatchQuestion < Test::Unit::TestCase

  def test_match_question
    str = 'ABCDEFG'
    assert_true(/CDE/.match?(str))
  end

  def test_doesnt_save_backref
    str = 'ABCDEFG'
    str =~ /(AB)C/ # ここで後方参照をセット
    assert_equal('AB', Regexp.last_match(1))

    /CDE/.match?(str) # Regexp#match? は後方参照を書き換えない
    assert_equal('AB', Regexp.last_match(1))

    /CDE/.match(str) # Regexp#match は後方参照を書き換える
    assert_not_equal('AB', Regexp.last_match(1))
  end

end
