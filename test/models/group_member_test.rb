require "test_helper"

class GroupMemberTest < ActiveSupport::TestCase
  test "is not valid without user" do
    group_user = GroupMember.new

    refute group_user.valid?
    assert_includes group_user.errors.messages[:user], "must exist"
  end

  test "is not valid without group" do
    group_user = GroupMember.new

    refute group_user.valid?
    assert_includes group_user.errors.messages[:group], "must exist"
  end

  test "is valid with group and user" do
    group_user = GroupMember.new(user_id: users(:one).id, group_id: groups(:one).id)

    assert group_user.valid?
  end
end
