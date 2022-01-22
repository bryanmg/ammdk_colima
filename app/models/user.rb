class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { sabonim: "sabonim", student: "student" }, scopes: false, default: "student"
  enum :belt, BELTS, scopes: false, default: nil
end
