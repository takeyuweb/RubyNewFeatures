require 'test/unit'
require 'active_support/core_ext/time'

class TestTimePrevDay < Test::Unit::TestCase

  # Time#yesterday は以前からActiveSupportによって実装されているが、
  # Date#prev_day は標準であるが Time にはないので Time#prev_day が追加された
  def test_prev_day
    t = Time.now
    assert_equal(t.yesterday, t.prev_day)
  end

  # Time#tomorrow は以前からActiveSupportによって実装されているが、
  # Date#next_day は標準であるが Time にはないので Time#next_day が追加された
  def test_next_day
    t = Time.now
    assert_equal(t.tomorrow, t.next_day)
  end

end
