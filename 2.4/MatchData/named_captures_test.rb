require 'test/unit'

class TestMatchDataNamedCaptures < Test::Unit::TestCase

  def test_captures
    assert_equal(
        %w(2016 10 19),
        '20161019'.match(/(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})/).captures
    )
  end

  def test_named_captures
    assert_equal(
        {'year' => '2016', 'month' => '10', 'day' => '19'},
        '20161019'.match(/(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})/).named_captures
    )
  end

  def test_named_captures_same_name
    # 同じ名前でマッチしたものを複数あるときは最後の値になる
    assert_equal(
        {'v' => 'B'},
        'ABC'.match(/(?<v>A)(?<v>B)/).named_captures
    )
  end

end
