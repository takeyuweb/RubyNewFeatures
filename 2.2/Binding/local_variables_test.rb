require 'test/unit'

class TestBindingLocalVariables < Test::Unit::TestCase
  def test_local_variables
    hoge = 'HOGE'
    closure = Proc.new do
      fuga = 'FUGA'
      binding.local_variables
    end
    assert_empty(closure.call - %i(hoge fuga closure))
  end
end