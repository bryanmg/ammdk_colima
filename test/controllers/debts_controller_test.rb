require "test_helper"

class DebtsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in users(:one) # require devise auth
  end

  test "should get index" do
    get teacher_debts_url(@user)

    assert_response :success
  end

  test "should get new" do
    get new_teacher_debt_url(@user)

    assert_response :success
  end

  test "should get show" do
    get teacher_debts_url(@user)

    assert_response :success
  end

  test "should create debt" do
    student = users(:two)
    assert_difference("Debt.count") do
      post teacher_debts_url(@user), params: { debt: { amount: 300.0, concept: "test", teacher_id: @user.id, student_id: student.id } }
    end

    assert_redirected_to teacher_debts_url(@user)
  end

  test "should get edit" do
    debt = debts(:one)
    get edit_teacher_debt_url(@user, debt)

    assert_response :success
  end

  test "should update debt" do
    debt = debts(:one)
    params = { debt: { amount: 300.0 } }
    patch teacher_debt_url(@user, debt), params: params

    assert_redirected_to teacher_debts_url(@user)
  end

  test "should destroy debt" do
    debt = debts(:one)
    assert_difference("Debt.count", -1) do
      delete teacher_debt_url(@user, debt)
    end

    assert_redirected_to teacher_debts_url(@user)
  end
end
