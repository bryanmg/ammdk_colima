class StudentLearningResource < ApplicationRecord
  belongs_to :user
  belongs_to :learning_resource
  validates :user, uniqueness: { scope: :learning_resource }
end
