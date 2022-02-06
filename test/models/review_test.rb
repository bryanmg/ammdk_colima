require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "is not valid without review" do
    review = Review.new

    refute review.valid?
    assert_includes review.errors.messages[:review], "can't be blank"
  end

  test "is not valid without teacher" do
    review = Review.new

    refute review.valid?
    assert_includes review.errors.messages[:teacher], "can't be blank"
  end

  test "is not valid without student" do
    review = Review.new

    refute review.valid?
    assert_includes review.errors.messages[:student], "can't be blank"
  end

  test "is valid without learning resource" do
    review = Review.new(review: "lorem impsum", teacher: users(:one), student: users(:two))

    assert review.valid?
  end

  test "is valid with review teacher and student" do
    review = Review.new(review: "lorem impsum", teacher: users(:one), student: users(:two))

    assert review.valid?
    assert review.save
  end
end
