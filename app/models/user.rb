class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { teacher: "teacher", student: "student" }, scopes: false, default: "student"
  enum :belt, BELTS, scopes: false, default: nil
  validates :email, :name, :birth_date, presence: true

  has_one :student_information, dependent: :destroy
  has_one :group_member, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :group_members, through: :groups, dependent: :destroy
  has_many :learning_resources, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :student_learning_resources, dependent: :destroy
  has_many :reviewed, class_name: "Review", foreign_key: "teacher_id", dependent: :destroy
  has_many :reviews, class_name: "Review", foreign_key: "student_id", dependent: :destroy
  has_many :my_debts, class_name: "Debt", foreign_key: "teacher_id", dependent: :destroy
  has_many :debts, class_name: "Debt", foreign_key: "student_id", dependent: :destroy

  accepts_nested_attributes_for :attendances, :group_member, :student_information
end
