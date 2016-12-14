require_relative './test_helper'

class TestAccessedFields < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :users do |t|
          t.string :name
        end

        create_table :comments do |t|
          t.references :user, foreign_key: {name: 'fk_user_comment'}
        end
      end
    end
    @migration.migrate(:up)

    user_class = Class.new(ActiveRecord::Base) do
      self.table_name = :users
      has_many :comments
    end
    Object.const_set :User, user_class

    %w(Taro Hanako Yuichi Mika).each { |name| User.create!(name: name) }
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
  end

  def test_accessed_fields
    user = User.first
    assert_equal([], user.accessed_fields)
    user.name
    assert_equal(%w(name), user.accessed_fields)
  end

end
