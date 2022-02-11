module StudentHelper
  def promote_belt(current_belt)
    new_level_key = BELTS[current_belt.to_sym] + 1
    BELTS.invert[new_level_key]
  end
end
