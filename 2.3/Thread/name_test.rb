require 'test/unit'

class TestThreadName < Test::Unit::TestCase
  def test_name
    threads = []
    3.times do |i|
      t = Thread.new { sleep(1) }
      t.name = "t#{i}"
      threads << t
    end

    assert_equal(%w(t0 t1 t2), threads.collect(&:name))
    threads.each(&:join)
  end

  def test_name_inspect
    t = Thread.new { sleep(1) }
    t.name = 'my_thread'
    # "#<Thread:0x00000001b37be8@my_thread@C:/Users/uzuki/IdeaProjects/Ruby23_NewFeatures/Thread/name_test.rb:17 run>"
    # みたいになる
    assert_match('my_thread', t.inspect)
  end
end