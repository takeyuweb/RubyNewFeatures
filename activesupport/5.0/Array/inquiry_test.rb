require 'test/unit'
require 'active_support/core_ext/array'

class TestArrayInquiry < Test::Unit::TestCase

  def test_array_inquiry
    inquirer = %i(hoge fuga).inquiry
    assert_instance_of(ActiveSupport::ArrayInquirer, inquirer)
  end

  def test_inquiry
    inquirer = %i(hoge fuga).inquiry
    assert(inquirer.hoge?)
    assert(inquirer.fuga?)
    assert_false(inquirer.hogefuga?)
  end

end
