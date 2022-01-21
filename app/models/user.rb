class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belts = {
    kup_10: "10° Kup", kup_9: "9° Kup", kup_8: "8° Kup", kup_7: "7° Kup", kup_6: "6° Kup", kup_5: "5° Kup",
    kup_4: "4° Kup", kup_3: "3° Kup", kup_2: "2° Kup", kup_1: "1° Kup", kup_y: "1° Kup Yebidan",
    dan_1: "1° Dan", dan_2: "2° Dan", dan_3: "3° Dan", dan_4: "4° Dan", dan_5: "5° Dan", dan_5: "5° Dan",
    dan_7: "7° Dan", dan_8: "8° Dan", dan_9: "9° Dan"
  }
  
  enum :role, {teacher: "teacher", student: "student"}, scopes: false, default: "student"
  enum :belt, belts, scopes: false, default: nil

  validates :email, :name, :birth_date, presence: true
end
