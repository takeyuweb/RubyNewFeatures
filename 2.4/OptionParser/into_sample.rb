require 'optionparser'

# ruby OptionParser/into_sample.rb --host=localhost --port=3000

opt = OptionParser.new
opt.on('--host=HOST')
opt.on('--port=PORT')

config = Hash.new
argv = opt.parse(ARGV, into: config)

p ARGV
p argv
p config
