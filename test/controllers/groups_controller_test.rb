require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @fixture_group = groups(:one)
    @group = @user.groups.create!(
      from_time: @fixture_group.from_time,
      name: @fixture_group.name,
      to_time: @fixture_group.to_time
    )
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
      group: { from_time: groups(:two).from_time, name: groups(:one).name }
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
