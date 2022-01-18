class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belts = {
    kup10: "10° Kup", kup9: "9° Kup", kup8: "8° Kup", kup7: "7° Kup", kup6: "6° Kup", kup5: "5° Kup",
    kup4: "4° Kup", kup3: "3° Kup", kup2: "2° Kup", kup1: "1° Kup", kup_y: "1° Kup Yebidan",
    dan1: "1° Dan", dan2: "2° Dan", dan3: "3° Dan", dan4: "4° Dan", dan5: "5° Dan", dan6: "6° Dan",
    dan7: "7° Dan", dan8: "8° Dan", dan9: "9° Dan"
  }

  enum :role, { sabonim: "sabonim", student: "student" }, scopes: false, default: "student"
  enum :belt, belts, scopes: false, default: nil
end
