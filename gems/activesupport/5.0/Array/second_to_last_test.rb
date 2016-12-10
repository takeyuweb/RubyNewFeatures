require 'test/unit'
require 'active_support/core_ext/array'

class TestArraySecondToLast < Test::Unit::TestCase

  def test_second_to_last
    assert_equal(:Fri, %i(Sun Mon Tue Wed Thu Fri Sat).second_to_last)
  end

  def test_third_to_last
    assert_equal(:Thu, %i(Sun Mon Tue Wed Thu Fri Sat).third_to_last)
  end

end
