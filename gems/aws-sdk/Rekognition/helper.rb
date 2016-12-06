def read_file(filename)
  File.read(File.join(File.dirname(__FILE__), '..', '..', '..', 'files', filename))
end
