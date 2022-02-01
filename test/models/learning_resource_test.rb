require "test_helper"

class LearningResourceTest < ActiveSupport::TestCase
  test "is not valid without name" do
    resource = LearningResource.new

    refute resource.valid?
    assert_includes resource.errors.messages[:name], "can't be blank"
  end

  test "is not valid without user" do
    resource = LearningResource.new

    refute resource.valid?
    assert_includes resource.errors.messages[:user], "must exist"
  end

  test "is valid with name and user" do
    resource = LearningResource.new(name: "Resource", user_id: users(:one).id)

    assert resource.valid?
  end
end
