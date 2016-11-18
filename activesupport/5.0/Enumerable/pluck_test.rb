require 'test/unit'
require 'active_support'
require 'active_support/core_ext/enumerable'

class TestEnumerablePluck < Test::Unit::TestCase

  def test_pluck
    # Enumerable#pluck
    assert_equal(
        %w(Apple Orange Banana),
        [
            {name: 'Apple'},
            {name: 'Orange'},
            {name: 'Banana'}
        ].pluck(:name))
  end

end