require "test_helper"
require "faker"

class UserTest < ActiveSupport::TestCase
  def resource
    User.new({
               email: Faker::Internet.unique.email,
               password: "123456",
               name: Faker::Name.name,
               birth_date: Faker::Date.birthday(min_age: 8, max_age: 15)
             })
  end
  test "is not valid without name" do
    user = User.new
    refute user.valid?
    assert_includes user.errors.messages[:name], "can't be blank"
  end

  test "is not valid without birth date" do
    user = User.new
    refute user.valid?
    assert_includes user.errors.messages[:birth_date], "can't be blank"
  end

  test "is not valid without email" do
    user = User.new
    refute user.valid?
    assert_includes user.errors.messages[:email], "can't be blank"
  end

  test "is not valid without password" do
    user = User.new
    refute user.valid?
    assert_includes user.errors.messages[:password], "can't be blank"
  end

  test "must be valid student with email password name and birth date" do
    assert resource.valid?
  end

  test "default type must be student" do
    assert resource.student?
  end
end
