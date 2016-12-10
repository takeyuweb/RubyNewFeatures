require 'test/unit'
require 'active_support/notifications'
require 'pp'

class TestExceptionObject < Test::Unit::TestCase

  def test_notification
    @event = nil
    # カスタムイベント test_notification.myapp を購読
    ActiveSupport::Notifications.subscribe('test_notification.myapp') do |*args|
      @event = ActiveSupport::Notifications::Event.new(*args)
    end

    # カスタムイベント test_notification.myapp を発火すると
    do_instrument('test_notification.myapp') do
      # まずこのブロックが実行され
      # その後、購読があればそちらのブロックが実行される
      # do something
    end

    # p @event
    # #<ActiveSupport::Notifications::Event:0x007fffc5e37d40
    # @children=[],
    #     @duration=nil,
    #     @end=2016-11-12 10:54:47 +0900,
    #     @name="hoge",
    #     @payload={:hello=>"world"},
    #     @time=2016-11-12 10:54:47 +0900,
    #     @transaction_id="8d33d78c1c40391f1181">
    assert_equal({hello: 'world'}, @event.payload)
  end

  def test_exception_object
    @event = nil
    error_class = Class.new(StandardError)

    # カスタムイベント test_exception_object.myapp を購読
    ActiveSupport::Notifications.subscribe('test_exception_object.myapp') do |*args|
      # test_notification.myapp 内でエラーが発生した場合、
      # payload[:exception_object] にエラーオブジェクトが入るようになった
      event = ActiveSupport::Notifications::Event.new(*args)
      assert_instance_of(error_class, event.payload[:exception_object])
      @event = event
    end

    # カスタムイベント test_exception_object.myapp を発火
    # イベント内でエラーを発生
    begin
      do_instrument('test_exception_object.myapp') { fail error_class }
    rescue => e
      #
    end

    assert_not_nil(@event)
  end

  private def do_instrument(name, &block)
    ActiveSupport::Notifications.instrument(name, hello: 'world', &block)
  end

end