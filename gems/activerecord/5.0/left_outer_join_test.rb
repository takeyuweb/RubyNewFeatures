require_relative './test_helper'

class TestLeftOuterJoin < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :users do |t|
          t.string :name
        end

        create_table :comments do |t|
          t.references :user
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

    {
        'Taro' => 0,
        'Hanako' => 1,
        'Yuichi' => 2,
        'Mika' => 0
    }.each do |name, comments_count|
      user = User.create!(name: name)
      comments_count.times { user.comments.create! }
    end
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
    Object.send(:remove_const, :Comment)
  end

  def test_left_outer_join
    # OUTER JOIN を用いてまだコメントを書いてないユーザーを取り出す
    users = User.left_outer_joins(:comments).where(comments: {id: nil})
    puts users.to_sql
=begin
SELECT "users".*
FROM "users" LEFT OUTER JOIN "comments" ON "comments"."user_id" = "users"."id"
WHERE "comments"."id" IS NULL
=end
    assert_equal(
        Set.new(%w(Taro Mika)),
        Set.new(users.pluck(:name))
    )
  end

end
