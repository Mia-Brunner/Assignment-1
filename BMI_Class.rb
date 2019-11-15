class BMI

  def initialize(weight_in_kg, height_in_cm)
    @weight_in_kg = weight_in_kg
    @height_in_cm = height_in_cm
  end

  def calculate_bmi(weight_in_kg, height_in_cm)
  body_mass_index = (weight_in_kg.to_f / height_in_cm.to_f / height_in_cm.to_f)*10000
    puts "Your BMI is #{body_mass_index.to_f.round(2)}"
    if body_mass_index < 10
      puts "Data input error. Please input accurate data"
    elsif body_mass_index >= 10 && body_mass_index < 18.5
      puts "This classifies you as underweight" 
    elsif body_mass_index >= 18.5 && body_mass_index < 25.0
      puts "This classifies you as being in the normal weight range"
    elsif body_mass_index >= 25.0 && body_mass_index < 30.0 
      puts "This classifies you as overweight"
    elsif body_mass_index >= 30.0 && body_mass_index < 60.0 
      puts "This classifies you as obese"
    else body_mass_index >= 60.0
      puts "Data input error. Please input accurate data"
    end
  end

end 



#test: with if statements, prints fail or pass