require_relative './test_helper'

class TestSuppress < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :comments do |t|
          t.text :message
          t.timestamp
        end

        create_table :notifications do |t|
          t.timestamp
        end
      end
    end
    @migration.migrate(:up)

    notification_class = Class.new(ActiveRecord::Base) do
      self.table_name = :notifications
    end
    Object.const_set :Notification, notification_class

    comment_class = Class.new(ActiveRecord::Base) do
      self.table_name = :comments
      attr_reader :ran_callbacks
      def initialize(*args)
        super
        @ran_callbacks = []
      end
      before_validation -> { @ran_callbacks << :before_validation }
      after_validation -> { @ran_callbacks << :after_validation }
      before_save -> { @ran_callbacks << :before_save }
      after_save -> { @ran_callbacks << :after_save }
      after_save -> { Notification.create! }
    end
    Object.const_set :Comment, comment_class
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :Comment)
    Object.send(:remove_const, :Notification)
  end

  def test_without_suppress
    comment = Comment.create!(message: 'comment')
    assert_equal(1, Comment.count)
    assert_equal(1, Notification.count)
    assert_equal(
        %i(before_validation after_validation before_save after_save),
        comment.ran_callbacks)
  end

  def test_with_comment_suppress
    comment = Comment.suppress { Comment.create!(message: 'comment') }
    assert_equal(0, Comment.count)
    assert_equal(0, Notification.count)
    assert_empty(comment.ran_callbacks)
  end

  def test_with_notification_suppress
    comment = Notification.suppress { Comment.create!(message: 'comment') }
    assert_equal(1, Comment.count)
    assert_equal(0, Notification.count)
    assert_equal(
        %i(before_validation after_validation before_save after_save),
        comment.ran_callbacks)
  end

end
