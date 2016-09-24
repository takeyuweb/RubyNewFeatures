q = Thread::Queue.new

THREAD_NUM = 5

threads = []
THREAD_NUM.times do
  t = Thread.new do
    Thread.pass
    loop do
      break if q.closed?
      unless q.empty?
        print q.pop
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
q.close    # これだけで済みます！

threads.each(&:join)

puts 'Finished'
