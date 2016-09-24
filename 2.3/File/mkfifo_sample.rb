File.mkfifo('mypipe')
File.open('mypipe', 'w') do |pipe|
  10.times do |i|
    pipe.write "Hello!(#{i})\n"
    sleep 1
  end
end
