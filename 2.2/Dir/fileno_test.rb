require 'test/unit'

class TestDirFileno < Test::Unit::TestCase

  def test_fileno
    dir1 = Dir.new('.')
    dir2 = Dir.new('.')
    assert_nothing_raised { dir1.fileno }
    assert_not_equal(dir1.fileno, dir2.fileno)
  end

end