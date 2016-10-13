require 'test/unit'
require 'fileutils'

class TestFileEmpty < Test::Unit::TestCase

  def test_empty
    FileUtils.touch('empty.dat')
    assert(File.empty?('empty.dat'))
  ensure
    FileUtils.remove('empty.dat')
  end

  def test_not_empty
    File.open('notempty.dat', 'w') { |f| f.puts 'OK' }
    assert_false(File.empty?('notempty.dat'))
  ensure
    FileUtils.remove('notempty.dat')
  end

end
