require "test_helper"

class StudentLearningResourceTest < ActiveSupport::TestCase
  test "is not valid without from student" do
    assignation = StudentLearningResource.new

    refute assignation.valid?
    assert_includes assignation.errors.messages[:user], "must exist"
  end

  test "is not valid without to learning resource" do
    assignation = StudentLearningResource.new

    refute assignation.valid?
    assert_includes assignation.errors.messages[:learning_resource], "must exist"
  end

  test "is valid with user and learning resource" do
    assignation = StudentLearningResource.new(user: users(:two), learning_resource: learning_resources(:one))

    assert assignation.valid?
    assert assignation.save
  end
end
