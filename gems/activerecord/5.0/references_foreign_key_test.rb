require_relative './test_helper'

class TestForeignKey < Test::Unit::TestCase

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

    comment_class = Class.new(ActiveRecord::Base) do
      self.table_name = :comments
      belongs_to :user
    end
    Object.const_set :Comment, comment_class

    %w(Taro Hanako Yuichi Mika).each { |name| User.create!(name: name) }
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
    Object.send(:remove_const, :Comment)
  end

  def test_foreign_key
    user = User.first
    assert_nothing_raised(ActiveRecord::InvalidForeignKey) { Comment.create!(user_id: user.id) }
  end

  def test_foreign_key_invalid
    assert_raise(ActiveRecord::InvalidForeignKey) { Comment.create!(user_id: -1) }
  end

end
