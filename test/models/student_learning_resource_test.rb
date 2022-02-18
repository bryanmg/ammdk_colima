require "test_helper"

class StudentLearningResourceTest < ActiveSupport::TestCase
  test "is not valid without from student" do
    assignation = StudentLearningResource.new

    refute assignation.valid?
    assert_includes assignation.errors.messages[:student], "must exist"
  end

  test "is not valid without to learning resource" do
    assignation = StudentLearningResource.new

    refute assignation.valid?
    assert_includes assignation.errors.messages[:learning_resource], "must exist"
  end

  test "is valid with untaken student and learning resource" do
    assignation = StudentLearningResource.new(student: users(:two), learning_resource: learning_resources(:one))

    assert assignation.valid?
    assert assignation.save
  end

  test "is not valid if student and learning resource was taken" do
    assignation = StudentLearningResource.new(student: users(:one), learning_resource: learning_resources(:one))

    refute assignation.valid?
    assert_includes assignation.errors.messages[:student], "has already been taken"
  end
end
