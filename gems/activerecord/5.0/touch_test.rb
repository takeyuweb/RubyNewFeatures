require_relative './test_helper'

class TestTouch < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :users do |t|
          t.datetime :registered_at
          t.timestamps
        end
      end
    end
    @migration.migrate(:up)

    user_class = Class.new(ActiveRecord::Base) do
      self.table_name = :users
    end
    Object.const_set :User, user_class

    User.create!
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
  end

  def test_touch_without_time
    user = User.first
    updated_at_before_tourh = user.updated_at
    sleep 1
    now = Time.now
    user.touch
    assert_not_equal(updated_at_before_tourh, user.updated_at)
    assert_not_equal(now, user.registered_at)
    assert_equal(now.to_i, user.updated_at.to_i)
  end

  def test_touch_with_time
    user = User.first
    t = Time.mktime(2016, 12, 16, 10, 0, 0)
    user.touch(time: t)
    assert_not_equal(t, user.registered_at)
    assert_equal(t, user.updated_at)
  end

  def test_touch_field_with_time
    user = User.first
    t = Time.mktime(2016, 12, 16, 10, 0, 0)
    user.touch(:registered_at, time: t)
    assert_equal(t, user.registered_at)
    assert_equal(t, user.updated_at)
  end


end
