class Group < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :delete_all

  validates :from_time, :to_time, presence: true
end
