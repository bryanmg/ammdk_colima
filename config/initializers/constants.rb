BELTS = {
  # Kups belts
  kup10: 0, kup9: 1, kup8: 2, kup7: 3, kup6: 4, kup5: 5,
  kup4: 6, kup3: 7, kup2: 7, kup1: 9, kupy: 10,
  # Dans belts
  dan1: 11, dan2: 12, dan3: 13, dan4: 14, dan5: 15,
  dan6: 16, dan7: 17, dan8: 18, dan9: 19
}.freeze

BELTS_TEXT = {
  # Kups belts
  kup10: "10° Kup", kup9: "9° Kup", kup8: "8° Kup", kup7: "7° Kup", kup6: "6° Kup", kup5: "5° Kup",
  kup4: "4° Kup", kup3: "3° Kup", kup2: "2° Kup", kup1: "1° Kup", kupy: "1° Kup Yebydan",
  # Dans belts
  dan1: "1° Dan", dan2: "2° Dan", dan3: "3° Dan", dan4: "4° Dan", dan5: "5° Dan",
  dan6: "6° Dan", dan7: "7° Dan", dan8: "8° Dan", dan9: "9° Dan"
}.freeze

PER_PAGE = 4

DEBTS_STATUS = { pending: "pending", paid: "paid" }.freeze

module ExceptionsConstants
  OVERFLOW_PAYMENT_EXCEPTION = 'Payment is bigger that debt'.freeze
end
