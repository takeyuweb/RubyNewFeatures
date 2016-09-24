# ruby ARGF/read_nonblock.rb ARGF/test.txt
# "A"
# "B"
# "C"
# "D"
# "E"
# "F"
# "G"
# " "
# "H"
# "I"
# "J"
# "K"
# "L"
# "M"
# "N"
# " "
# "O"
# "P"
# "Q"
# "R"
# "S"
# "T"
# "U"
# " "
# "V"
# "Q"
# "X"
# "Y"
# "Z"
#
# Windows (ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32])では例外発生
# Bad file descriptor @ rb_io_set_nonblock - ARGF\test.txt (Errno::EBADF) from ARGF/read_nonblock.rb:13:in `<main>'

buffer_size = 10
while buffer = ARGF.read_nonblock(buffer_size, exception: false)
  p buffer
end
