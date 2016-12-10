require 'test/unit'
require 'active_support'
require 'active_support/array_inquirer'

class TestArrayInquirer < Test::Unit::TestCase

  def test_inquiry
    inquirer = ActiveSupport::ArrayInquirer.new(%i(hoge fuga))

    # xxxxx? に対してnewの引数の配列にキーが含まれていれば真
    assert(inquirer.hoge?)
    assert(inquirer.fuga?)
    # そうでなければ偽を返す
    assert_false(inquirer.hogefuga?)
  end

  def test_any
    inquirer = ActiveSupport::ArrayInquirer.new(%i(apple orange))

    # any?で引数に渡したキーのうち1つ以上が含まれていれば真
    assert(inquirer.any?(:apple, :banana))
    assert(inquirer.any?(:orange, :banana))
    # そうでなければ偽を返す
    assert_false(inquirer.any?(:banana, :melon))
  end

end