require "test_helper"

module Teachers
  class LearningResourcesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      @learning_resource = learning_resources(:one)
      sign_in users(:one) # require devise auth
    end

    test "should get index" do
      get teacher_learning_resources_url(@user)

      assert_response :success
    end

    test "should get new" do
      get new_teacher_learning_resource_url(@user)

      assert_response :success
    end

    test "should create teachers_learning_resource" do
      assert_difference("LearningResource.count") do
        learning_ressource = { learning_resource: {
          belt: @learning_resource.belt,
          description: @learning_resource.description,
          name: @learning_resource.name
        } }
        post teacher_learning_resources_url(@user), params: learning_ressource
      end

      assert_redirected_to teacher_learning_resources_url(@user)
    end

    test "should show teachers_learning_resource" do
      get teacher_learning_resource_url(@user, @learning_resource)

      assert_response :success
    end

    test "should get edit" do
      get edit_teacher_learning_resource_url(@user, @learning_resource)

      assert_response :success
    end

    test "should update teachers_learning_resource" do
      @learning_resource.user_id = @user.id
      @learning_resource.save
      patch teacher_learning_resource_url(@user, @learning_resource),
            params: { learning_resource: { belt: @learning_resource.belt } }

      assert_redirected_to teacher_learning_resources_url(@user)
    end

    test "should destroy teachers_learning_resource" do
      assert_difference("LearningResource.count", -1) do
        delete teacher_learning_resource_url(@user, @learning_resource)
      end

      assert_redirected_to teacher_learning_resources_url(@user)
    end
  end
end
