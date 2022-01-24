class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { teacher: "teacher", student: "student" }, scopes: false, default: "student"
  enum :belt, BELTS, scopes: false, default: nil

  has_many :groups, dependent: :destroy

  validates :email, :name, :birth_date, presence: true
end
