class BMI

  def initialize(weight_in_kg, height_in_cm)
    @weight_in_kg = weight_in_kg
    @height_in_cm = height_in_cm
  end

  def calculate_bmi(weight_in_kg, height_in_cm)
    body_mass_index = (weight_in_kg.to_f / height_in_cm.to_f / height_in_cm.to_f)*10000
    body_mass_index.to_f.round(2)
  end
end 