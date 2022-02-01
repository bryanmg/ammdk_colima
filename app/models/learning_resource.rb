class LearningResource < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  validates :name, presence: true
end
