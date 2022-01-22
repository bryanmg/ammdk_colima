class Group < ApplicationRecord
  validates :from_time, :to_time, presence: true
end
