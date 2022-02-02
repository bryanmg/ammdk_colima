class Group < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :delete_all
  store :days_of_the_week, accessors: [:sunday?, :monday?, :tuesday?, :wednesday?, :thursday?, :friday?, :saturday?]

  validates :from_time, :to_time, presence: true

  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
end
