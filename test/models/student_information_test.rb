require "test_helper"

class StudentInformationTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "is not valid without ocupation" do
    student_info = StudentInformation.new

    refute student_info.valid?
    assert_includes student_info.errors.messages[:ocupation], "can't be blank"
  end

  test "is not valid without civil_status" do
    student_info = StudentInformation.new

    refute student_info.valid?
    assert_includes student_info.errors.messages[:civil_status], "can't be blank"
  end

  test "is not valid without cellphone" do
    student_info = StudentInformation.new

    refute student_info.valid?
    assert_includes student_info.errors.messages[:cellphone], "can't be blank"
  end

  test "is not valid without health_insurance" do
    student_info = StudentInformation.new

    refute student_info.valid?
    assert_includes student_info.errors.messages[:health_insurance], "can't be blank"
  end

  test "is not valid without user_id" do
    student_info = StudentInformation.new

    refute student_info.valid?
    assert_includes student_info.errors.messages[:user], "must exist"
  end

  test "is valid with ocupation civil_status cellphone health_insurance and user_id" do
    student_info = StudentInformation.new(
      user: users(:two),
      ocupation: "Work",
      civil_status: "Single",
      cellphone: "3121234567",
      health_insurance: "1234567890"
    )

    assert student_info.valid?
  end
end
