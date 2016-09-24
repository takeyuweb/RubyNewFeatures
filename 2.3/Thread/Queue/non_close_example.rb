q = Thread::Queue.new

THREAD_NUM = 5

threads = []
THREAD_NUM.times do
  t = Thread.new do
    Thread.pass
    loop do
      unless q.empty?
        message = q.pop
        if message.nil?
          break # (2) popした値が nil なら終了とする
        else
          print message
        end
      end
      sleep 1
    end
  end
  threads << t
end

3.times do |i|
  q.push("[#{i}]")
  sleep 1
end
THREAD_NUM.times { q.push(nil) } # (1) closeを使わずにキューの終了を伝える

threads.each(&:join)

puts 'Finished'
