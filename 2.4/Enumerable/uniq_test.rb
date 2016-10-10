require 'test/unit'

class TestUniq < Test::Unit::TestCase

  def test_uniq
    hash = { a: 1, b: 2, c: 3, d: 1 }
    # uniqに渡したブロックの戻り値を重複の条件に使う
    assert_equal([[:a, 1], [:b, 2], [:c, 3]], hash.uniq {|k, v| v })
  end

end
