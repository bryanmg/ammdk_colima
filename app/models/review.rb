class Review < ApplicationRecord
  belongs_to :learning_resource, optional: true
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :review, :teacher, :student, presence: true
end
