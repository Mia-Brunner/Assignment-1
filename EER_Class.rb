class EER

  def initialize(weight_in_kg, height_in_cm,age,exercise)
    @weight_in_kg = weight_in_kg
    @height_in_cm = height_in_cm
    @age = age
    @exercise = exercise 
  end

  # Daily estimated energy requirement for men 
  def bmr_pal_m(weight_in_kg, height_in_cm, age, exercise)
    bmr_men_weight = weight_in_kg.to_f * 13.75
    bmr_men_height = height_in_cm.to_f * 5.003
    bmr_men_age = age.to_f * 6.755 
    basal_metabolic_rate_men = 66.47 + bmr_men_weight + bmr_men_height - bmr_men_age 
    estimated_energy_requirement = basal_metabolic_rate_men.to_i * exercise
    estimated_energy_requirement.to_i
  end 

  # Daily estimated energy requirement for women
  def bmr_pal_f(weight_in_kg, height_in_cm, age, exercise)
    bmr_women_weight = weight_in_kg.to_f * 9.563 
    bmr_women_height = height_in_cm.to_f * 1.85
    bmr_women_age = age.to_f * 4.676
    basal_metabolic_rate_women = 655.1 + bmr_women_weight + bmr_women_height - bmr_women_age 
    estimated_energy_requirement = basal_metabolic_rate_women.to_i * exercise
    estimated_energy_requirement.to_i
  end 
end 