require 'logger'

log_path = File.join(File.dirname(__FILE__), 'sample.log')
# shift_period_suffix のデフォルトは '%Y%m%d'
logger = Logger.new(log_path, 'daily', shift_period_suffix: '%Y-%m-%d')
