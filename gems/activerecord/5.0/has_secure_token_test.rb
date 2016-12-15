require_relative './test_helper'

class TestHasSecureToken < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :users do |t|
          t.string :name
          t.string :key, limit: 24, null: false, index: true, unique: true
        end
      end
    end
    @migration.migrate(:up)

    user_class = Class.new(ActiveRecord::Base) do
      self.table_name = :users
      has_secure_token :key
    end
    Object.const_set :User, user_class

    %w(Taro Hanako Yuichi Mika).each { |name| User.create!(name: name) }
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
  end

  def test_secure_token
    user = User.new
    assert_nil(user.key)
    user.save!
    assert_not_nil(user.key)
    # p user.key # => "Z91GMNbT68aggjx6sTJnPPZK"
  end

end
