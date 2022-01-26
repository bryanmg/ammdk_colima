require "test_helper"

class UserTest < ActiveSupport::TestCase
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
    user = User.new({
                      email: "test_user@gmail.com",
                      password: "123456",
                      name: "User test",
                      belt: :dan2,
                      birth_date: "12/12/1996"
                    })

    assert user.valid?
  end

  test "default type must be student" do
    user = User.new({
                      email: "test_user@gmail.com",
                      password: "123456",
                      name: "User test",
                      belt: :dan2,
                      birth_date: "12/12/1996"
                    })

    assert user.student?
  end
end
