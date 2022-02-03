class LearningResource < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  validates :name, presence: true

  has_many :students_learning_resources, dependent: :destroy
end
