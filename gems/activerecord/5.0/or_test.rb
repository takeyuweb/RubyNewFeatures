require_relative './test_helper'

class TestOrNode < Test::Unit::TestCase

  setup do
    @migration = Class.new(ActiveRecord::Migration[5.0]) do
      def change
        create_table :users do |t|
          t.string :name
          t.integer :age
          t.integer :sex
        end
      end
    end
    @migration.migrate(:up)

    user_class = Class.new(ActiveRecord::Base) do
      self.table_name = :users
      enum sex: %i(male female)
    end
    Object.const_set :User, user_class
  end

  teardown do
    @migration.migrate(:down)
    Object.send(:remove_const, :User)
  end

  def test_or
    [
        {
            name: 'Taro',
            age: 30,
            sex: 'male'
        },
        {
            name: 'Hanako',
            age: 32,
            sex: 'female'
        },
        {
            name: 'Yuichi',
            age: 32,
            sex: 'male'
        },
        {
            name: 'Mika',
            age: 38,
            sex: 'female'
        },
    ].each { |data| User.create!(data) }

    users = User.male.or(User.where('age > 35'))
    puts users.to_sql
=begin
SELECT "users".* FROM "users"
WHERE ("users"."sex" = 0 OR (age > 35))
=end

    assert_equal(
        Set.new(%w(Taro Yuichi Mika)),
        Set.new(users.pluck(:name)))
  end


  def test_or_group
    [
        {
            name: 'Taro',
            age: 30,
            sex: 'male'
        },
        {
            name: 'Hanako',
            age: 32,
            sex: 'female'
        },
        {
            name: 'Yuichi',
            age: 32,
            sex: 'male'
        },
        {
            name: 'Mika',
            age: 38,
            sex: 'female'
        },
    ].each { |data| User.create!(data) }

    male_over30 = User.male.where!('age > ?', 30)
    female_over35 = User.female.where!('age > ?', 35)

    users = male_over30.or(female_over35)
    puts users.to_sql
=begin
SELECT "users".*
FROM "users"
WHERE (
  "users"."sex" = 0 AND (age > 30) OR "users"."sex" = 1 AND (age > 35))
=end
    assert_equal(
        Set.new(['Yuichi', 'Mika']),
        Set.new(users.pluck(:name)))
  end

end





