require 'test/unit'

class TestBindingLocalVariables < Test::Unit::TestCase
  def test_local_variables
    hoge = 'HOGE'
    closure = Proc.new do
      fuga = 'FUGA'
      binding
    end
    b = closure.call
    # closure内コンテキストのローカル変数を得られる
    assert_empty(b.local_variables - %i(hoge fuga closure b))
    # local_variable_get で変数の値も得られる
    assert_equal('FUGA', b.local_variable_get(:fuga))
  end
end