require 'test/unit'
require 'pp'

class TestHashToProc < Test::Unit::TestCase
  def test_to_proc
    hash = {
        apple: 'りんご',
        orange: 'みかん',
        banana: 'バナナ'
    }
    assert_instance_of(Proc, hash.to_proc)
  end

  def test_call
    hash = {
        apple: 'りんご',
        orange: 'みかん',
        banana: 'バナナ'
    }
    assert_equal('りんご', hash.to_proc.call(:apple))
  end

  def test_block
    hash = {
        hoge: 'Hoge',
        fuga: 'Fuga',
    }
    klass = Class.new
    klass.class_eval do
      def hoge(&block)
        yield(:hoge)
      end
    end
    assert_equal('Hoge', klass.new.hoge(&hash))
  end

  def test_ampersand
    # to_procを持ったことで&hash
    hash = {
        apple: 'りんご',
        orange: 'みかん',
        banana: 'バナナ'
    }
    assert_equal(%w(りんご みかん), %i(apple orange).map(&hash))
  end
end
