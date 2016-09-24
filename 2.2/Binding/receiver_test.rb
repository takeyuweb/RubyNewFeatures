require 'test/unit'

class TestBindingReceiver < Test::Unit::TestCase

  def test_receiver
    klass = Class.new
    klass.class_eval do
      def self.class_binding
        binding
      end

      def instance_binding
        binding
      end
    end

    instance = klass.new

    assert_equal(klass, klass.class_binding.receiver)
    assert_equal(instance, instance.instance_binding.receiver)
  end

end