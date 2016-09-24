buffer_size = 1

r, w = IO.pipe
$stdin = r
begin
  p ARGF.read_nonblock(buffer_size)
rescue IO::EAGAINWaitReadable
  # Resource temporarily unavailable - read would block (IO::EAGAINWaitReadable)
end

p ARGF.read_nonblock(buffer_size, exception: false) # => :wait_readable
