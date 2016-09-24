require 'test/unit'

class LonelyOperatorTest < Test::Unit::TestCase
  def test_exist
    assert_equal('Hello, Ruby 2.3!!'.match(/(Ruby)/).captures, %w(Ruby))
  end

  def test_nil_receiver
    assert_raise(NoMethodError) { 'Hello, Ruby 2.3!!'.match(/(Perl)/).captures }
  end

  def test_lonely
    # レシーバがnilでないときは.と同じように働き
    assert_equal('Hello, Ruby 2.3!!'.match(/(Ruby)/)&.captures, %w(Ruby))
    # レシーバがnilのときはnilを返す
    assert_nil('Hello, Ruby 2.3!!'.match(/(Perl)/)&.captures)
  end

  def test_missing
    # 存在しないメソッドのときnilを返すわけではない
    assert_raise(NoMethodError) { 'Hello, Ruby 2.3!!'.hoge }
  end

  def test_argument_evaluation
    # レシーバがnilのとき引数は評価されない
    str = 'abcdef'
    nil&.hoge(str.upcase!) # str.upcase!は実行されない
    assert_equal(str, 'abcdef')
  end

  def test_assignment
    instance = nil
    assert_nil(instance&.hoge = 'fuga')
  end
end
