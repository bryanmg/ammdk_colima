class LearningResource < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  validates :name, presence: true

  has_many :student_learning_resources, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
