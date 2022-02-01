class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { teacher: "teacher", student: "student" }, scopes: false, default: "student"
  enum :belt, BELTS, scopes: false, default: nil
  validates :email, :name, :birth_date, presence: true

  has_many :groups, dependent: :destroy
  has_many :group_members, through: :groups, dependent: :destroy

  has_one :student_information
  has_many :learning_resources, dependent: :destroy
end
