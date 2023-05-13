require "test_helper"

class DebtTest < ActiveSupport::TestCase
  test "is not valid without amount and concept" do
    debt = Debt.new

    refute debt.valid?
    assert_includes debt.errors.messages[:amount], "can't be blank"
    assert_includes debt.errors.messages[:concept], "can't be blank"
  end

  test "is not valid without teacher and student" do
    debt = Debt.new

    refute debt.valid?
    assert_includes debt.errors.messages[:teacher], "must exist"
    assert_includes debt.errors.messages[:teacher], "can't be blank"
    assert_includes debt.errors.messages[:student], "must exist"
    assert_includes debt.errors.messages[:student], "can't be blank"
  end

  test "is valid with amount concept teacher and student" do
    debt = Debt.new(amount: 20, concept: "test", status: "paid", teacher: users(:one), student: users(:two))

    assert debt.valid?
    assert debt.save
  end

  test "is valid wit valid status" do
    debt = Debt.new({ amount: 10, concept: "test", teacher: users(:one), student: users(:two), status: "pending" })
    debt2 = Debt.new({ amount: 10, concept: "test", teacher: users(:one), student: users(:two), status: "paid" })

    assert debt.valid?
    assert debt2.valid?
  end

  test "is not valid without valid status" do
    assert_raises(ArgumentError) do
      Debt.new({ amount: 10, concept: "test", teacher: users(:one), student: users(:two), status: "test" })
    end
  end
end
