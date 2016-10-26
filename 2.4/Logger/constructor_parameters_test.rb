require 'test/unit'
require 'logger'

class TestLoggerConstructorParameters < Test::Unit::TestCase
  FORMATTER = Proc.new { |severity, datetime, progname, message| "#{datetime}: #{message}\n" }

  def test_parameters
    logger_without_params = Logger.new($stdout)
    logger_without_params.level = :debug
    logger_without_params.progname = 'myapp'
    logger_without_params.datetime_format = '%Y-%m-%d %H:%M:%S'
    logger_without_params.formatter = FORMATTER

    logger_with_params = Logger.new(
        $stdout,
        level: :debug,
        progname: 'myapp',
        datetime_format: '%Y-%m-%d %H:%M:%S',
        formatter: FORMATTER)

    assert_equal(logger_without_params.level, logger_with_params.level)
    assert_equal(logger_without_params.progname, logger_with_params.progname)
    assert_equal(logger_without_params.datetime_format, logger_with_params.datetime_format)
    assert_equal(logger_without_params.formatter, logger_with_params.formatter)
  end

end