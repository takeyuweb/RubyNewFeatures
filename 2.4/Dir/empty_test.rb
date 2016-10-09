require 'test/unit'

class TestEmpty < Test::Unit::TestCase

  def test_not_empty
    assert_false(Dir.empty?(File.dirname(__FILE__)))
  end

  def test_empty
    Dir.mkdir('empty')
    assert(Dir.empty?('empty'))
  ensure
    Dir.rmdir('empty')
  end

end
