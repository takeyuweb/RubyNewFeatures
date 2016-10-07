require 'test/unit'

class TestMultipleAssignment < Test::Unit::TestCase

  def test_multiple_assignment
    # Ruby 2.4.0以前でも実行可能
    array = [1, 2, 3]
    a, b, c = array
    assert_equal(1, a)
    assert_equal(2, b)
    assert_equal(3, c)
  end

  def test_multiple_assignment_conditional_match
    # Ruby 2.4.0以前では文法エラー
    array = [1, 2, 3]
    if (a, b, c = array)
      assert_equal(1, a)
      assert_equal(2, b)
      assert_equal(3, c)
    else
      raise
    end
  end

  def test_multiple_assignment_conditional_positive
    arg = true
    # 配列でなくても真
    if (a, b, c = arg)
      assert_true(a)
      assert_nil(b)
      assert_nil(c)
    else
      raise
    end
  end

  def test_multiple_assignment_conditional_false
    arg = false
    # 配列でなく false or nil が渡されたときは偽
    if (a, b, c = arg)
      raise
    else
      assert_false(a)
      assert_nil(b)
      assert_nil(c)
    end
  end

  def test_multiple_assignment_conditional_nil
    arg = nil
    # 配列でなく false or nil が渡されたときは偽
    if (a, b, c = arg)
      raise
    else
      assert_nil(a)
      assert_nil(b)
      assert_nil(c)
    end
  end


  def test_multiple_assignment_conditional_array
    array = [false, false, false]
    # a, b, cの値が false でも array なので真として扱う
    if (a, b, c = array)
      assert_false(a)
      assert_false(b)
      assert_false(c)
    else
      raise
    end
  end


end
