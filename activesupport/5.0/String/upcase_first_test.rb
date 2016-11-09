require 'test/unit'
require 'active_support/core_ext/string'

class TestStringUpcaseFirst < Test::Unit::TestCase

  def test_upcase_first
    assert_equal('What a Lovely Day', 'what a Lovely Day'.upcase_first)
  end

  if RUBY_VERSION >= '2.4.0'

    def test_upcase_first_ascii
      assert_equal('Ｗｈａｔ　ａ　Ｌｏｖｅｌｙ　Ｄａｙ', 'ｗｈａｔ　ａ　Ｌｏｖｅｌｙ　Ｄａｙ'.upcase_first)
    end

  else

    def test_upcase_first_non_ascii
      assert_not_equal('Ｗｈａｔ　ａ　Ｌｏｖｅｌｙ　Ｄａｙ', 'ｗｈａｔ　ａ　Ｌｏｖｅｌｙ　Ｄａｙ'.upcase_first)
    end

  end

end