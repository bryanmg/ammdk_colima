require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in users(:one) # require devise auth
    @group = @user.groups.create(
      from_time: groups(:one).from_time,
      name: groups(:one).name,
      to_time: groups(:one).to_time,
      days_of_the_week: { monday?: true }
    )
  end

  test "should get index" do
    get teacher_groups_url(@user)

    assert_response :redirect
  end

  test "should get new" do
    get new_teacher_group_url(@user)

    assert_response :success
  end

  test "should create group" do
    assert_difference("Group.count") do
      params = {
        group: {
          from_time: @group.from_time, name: @group.name, to_time: @group.to_time
        }
      }
      post teacher_groups_url(@user), params: params
    end

    assert_redirected_to teacher_url(@user)
  end

  test "should show group" do
    get teacher_groups_url(@user, @group)

    assert_response :redirect
  end

  test "should get edit" do
    get edit_teacher_group_url(@user, @group)

    assert_response :success
  end

  test "should update group" do
    params = {
      group: { from_time: groups(:two).from_time, name: groups(:one).name }
    }
    patch teacher_group_url(@user, @group), params: params

    assert_redirected_to teacher_groups_url(@user, @group)
  end

  test "should destroy group" do
    assert_difference("Group.count", -1) do
      delete teacher_group_path(@user, @group)
    end

    assert_redirected_to teacher_url(@user)
  end
end
