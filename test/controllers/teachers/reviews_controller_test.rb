require "test_helper"

module Teachers
  class ReviewsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      @teachers_review = reviews(:one)
      sign_in users(:one) # require devise auth
    end

    test "should get new" do
      get new_teacher_review_url(@user)

      assert_response :success
    end

    test "should create teachers_review" do
      assert_difference("Review.count") do
        post teacher_reviews_url(@user), params: {
          review: {
            review: @teachers_review.review, student_id: users(:two).id
          }
        }
      end

      assert_redirected_to teacher_review_url(@user, Review.last)
    end

    test "should show teacher review" do
      get teacher_review_url(@user, @teachers_review)

      assert_response :success
    end

    test "should get edit" do
      get edit_teacher_review_url(@user, @teachers_review)

      assert_response :success
    end

    test "should update teachers_review" do
      patch teacher_review_url(@user, @teachers_review),
            params: { review: { review: "lorem impsum dolor si ament" } }

      assert_redirected_to teacher_review_url(@user, @teachers_review)
    end

    test "should destroy teacher review" do
      assert_difference("Review.count", -1) do
        delete teacher_review_url(@user, @teachers_review)
      end

      assert_redirected_to teacher_student_path(@user, reviews(:one).student_id)
    end
  end
end
