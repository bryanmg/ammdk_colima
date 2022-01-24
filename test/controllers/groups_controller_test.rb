require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @groupsss = groups(:one)
    @user.groups.build(
      { from_time: @groupsss.from_time, name: @groupsss.name, to_time: @groupsss.to_time }
    ).save
    @group = @user.groups.last
  end

  test "should get index" do
    get user_groups_url(@user)

    assert_response :success
  end

  test "should get new" do
    get new_user_group_url(@user)

    assert_response :success
  end

  test "should create group" do
    assert_difference("Group.count") do
      params = {
        group: {
          from_time: @group.from_time, name: @group.name, to_time: @group.to_time
        }
      }
      post user_groups_url(@user), params: params
    end

    assert_redirected_to user_groups_url(@user, Group.last)
  end

  test "should show group" do
    get user_groups_url(@user, @group)

    assert_response :success
  end

  test "should get edit" do
    get edit_user_group_url(@user, @group)

    assert_response :success
  end

  test "should update group" do
    params = {
      group: { from_time: @group.from_time, name: @group.name, to_time: @group.to_time }
    }
    patch user_group_url(@user, @group), params: params

    assert_redirected_to user_groups_url(@user, @group)
  end

  test "should destroy group" do
    assert_difference("Group.count", -1) do
      delete user_group_url(@user, @group)
    end

    assert_redirected_to user_groups_url(@user)
  end
end
