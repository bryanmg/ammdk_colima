class Group < ApplicationRecord
  belongs_to :user

  validates :from_time, :to_time, presence: true
end
