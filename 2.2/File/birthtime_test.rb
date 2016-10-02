require 'test/unit'

class TestFileBirthtime < Test::Unit::TestCase

  def test_birthtime
    assert_instance_of(Time, File.birthtime(__FILE__))
    p File.birthtime(__FILE__)
  end

end