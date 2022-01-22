require "test_helper"

class GroupTest < ActiveSupport::TestCase
  test "is not valid without from time" do
    group = Group.new
    refute group.valid?
    assert_includes group.errors.messages[:from_time], "can't be blank"
  end

  test "is not valid without to time" do
    group = Group.new
    refute group.valid?
    assert_includes group.errors.messages[:to_time], "can't be blank"
  end
end
