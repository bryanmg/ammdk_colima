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
    debt = Debt.new(amount: 20, concept: "test", teacher: users(:one), student: users(:two))

    assert debt.valid?
    assert debt.save
  end
end
