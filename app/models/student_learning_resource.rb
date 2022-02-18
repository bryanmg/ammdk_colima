class StudentLearningResource < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "user_id"
  belongs_to :learning_resource
  validates :student, uniqueness: { scope: :learning_resource }
end
