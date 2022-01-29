class Group < ApplicationRecord
  belongs_to :user
  store :days_of_the_week, accessors: [:sunday?, :monday?, :tuesday?, :wednesday?, :thursday?, :friday?, :saturday?]

  validates :from_time, :to_time, presence: true

  has_many :group_members, dependent: :destroy, class_name: "GroupMember"
  has_many :members, through: :group_members, class_name: "User"
end
