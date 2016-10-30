require 'test/unit'
require 'optionparser'

class TestOptionParserInfo < Test::Unit::TestCase

  def test_into
    argv = %w(
      --host=localhost
      --port=3000
    )

    opt = OptionParser.new
    opt.on('--host=HOST')
    opt.on('--port=PORT')

    config = Hash.new
    opt.parse(argv, into: config) # into: のハッシュに結果を入れる

    assert_equal({host: 'localhost', port: '3000'}, config)
  end

end
