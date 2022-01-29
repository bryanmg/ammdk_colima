class Group < ApplicationRecord
  belongs_to :user
  store :days_of_the_week, accessors: [:sunday?, :monday?, :tuesday?, :wednesday?, :thursday?, :friday?, :saturday?]

  validates :from_time, :to_time, presence: true
end
