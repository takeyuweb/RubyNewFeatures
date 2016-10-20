require 'test/unit'

class TestMatchDataValuesAt < Test::Unit::TestCase

  def test_values_at_without_name
    # Ruby 2.3まではこの形式のみ
    assert_equal(
        %w(2016 10 19),
        matched.values_at(1, 2, 3)
    )
  end

  def test_values_at_with_name
    assert_equal(
        %w(2016 10 19),
        matched.values_at(:year, :month, :day)
    )
  end

  private def matched
    '20161019'.match(/(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})/)
  end

end
