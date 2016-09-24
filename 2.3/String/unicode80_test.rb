require 'test/unit'

class TestUnicode < Test::Unit::TestCase
  def test_unicode80_property
    /\p{Ahom}/ # Ruby 2.2以下では構文エラー SyntaxError になり実行自体できない
  end
end
