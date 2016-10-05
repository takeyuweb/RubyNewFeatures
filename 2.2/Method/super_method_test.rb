require 'test/unit'

class TestSuperMethod < Test::Unit::TestCase

  def test_super_method
    klass = Class.new do
      def hoge
        'super'
      end
    end

    sub_klass = Class.new(klass) do
      def hoge
        'sub'
      end
    end

    hoge = sub_klass.new.method(:hoge)
    assert_equal('sub', hoge.call)
    assert_equal('super', hoge.super_method.call)
  end

end
