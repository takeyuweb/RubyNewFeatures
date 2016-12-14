require 'test/unit'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: 'ruby_new_feature',
    username: 'root'
)
