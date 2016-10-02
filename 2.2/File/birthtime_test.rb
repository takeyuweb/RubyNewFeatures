require 'test/unit'

class TestFileBirthtime < Test::Unit::TestCase

  def test_birthtime
    assert_instance_of(Time, File.birthtime(__FILE__))
  end

  def test_instance_birthtime
    file = File.open(__FILE__)
    assert_instance_of(Time, file.birthtime)
  end

  def test_stat_birthtime
    stat = File.stat(__FILE__)
    assert_instance_of(Time, stat.birthtime)
  end

end