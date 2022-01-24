require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @group = groups(:one)
  end

  test "should get index" do
    get user_groups_url(user_id: @user.id)

    assert_response :success
  end

  test "should get new" do
    get new_user_group_url(user_id: @user.id)

    assert_response :success
  end

  test "should create group" do
    assert_difference("Group.count") do
      params = {
        user_id: @user.id,
        group: { from_time: @group.from_time, name: @group.name, to_time: @group.to_time }
      }
      post user_groups_url(params)
    end

    assert_redirected_to user_groups_url(user_id: @user.id, id: Group.last.id)
  end

  test "should show group" do
    get user_groups_url(user_id: @user.id, id: @group.id)

    assert_response :success
  end

  test "should get edit" do
    get edit_user_group_url(user_id: @user.id, id: @group.id)

    assert_response :success
  end

  test "should update group" do
    params = {
      user_id: @user.id,
      id: @group.id,
      group: { from_time: @group.from_time, name: @group.name, to_time: @group.to_time }
    }
    patch user_group_url(params)

    assert_redirected_to user_groups_url(user_id: @user.id, id: @group.id)
  end

  test "should destroy group" do
    assert_difference("Group.count", -1) do
      delete user_group_url(user_id: @user.id, id: @group.id)
    end

    assert_redirected_to user_groups_url(user_id: @user.id)
  end
end
