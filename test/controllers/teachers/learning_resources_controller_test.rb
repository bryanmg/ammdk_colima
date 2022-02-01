require "test_helper"

class Teachers::LearningResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teachers_learning_resource = teachers_learning_resources(:one)
  end

  test "should get index" do
    get teachers_learning_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_teachers_learning_resource_url
    assert_response :success
  end

  test "should create teachers_learning_resource" do
    assert_difference("Teachers::LearningResource.count") do
      post teachers_learning_resources_url, params: { teachers_learning_resource: { belt: @teachers_learning_resource.belt, description: @teachers_learning_resource.description, name: @teachers_learning_resource.name } }
    end

    assert_redirected_to teachers_learning_resource_url(Teachers::LearningResource.last)
  end

  test "should show teachers_learning_resource" do
    get teachers_learning_resource_url(@teachers_learning_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_teachers_learning_resource_url(@teachers_learning_resource)
    assert_response :success
  end

  test "should update teachers_learning_resource" do
    patch teachers_learning_resource_url(@teachers_learning_resource), params: { teachers_learning_resource: { belt: @teachers_learning_resource.belt, description: @teachers_learning_resource.description, name: @teachers_learning_resource.name } }
    assert_redirected_to teachers_learning_resource_url(@teachers_learning_resource)
  end

  test "should destroy teachers_learning_resource" do
    assert_difference("Teachers::LearningResource.count", -1) do
      delete teachers_learning_resource_url(@teachers_learning_resource)
    end

    assert_redirected_to teachers_learning_resources_url
  end
end
