# require gems
# require modules

puts "#####################################################"
puts "#######  WELCOME TO MIAS BRUNNERS SICKETH BMI #######"
puts "#####################################################"



def calculate_bmi(weight, height)
  weight = 0
  height = 0
 
  body_mass_index = weight.to_f / (height.to_f * height.to_f)
  puts "Your BMI is #{body_mass_index.to_i}"
  # puts (type(body_mass_index))

  if body_mass_index < 18.5
      puts "underweight" 
  elsif body_mass_index >= 18.5 && body_mass_index < 25.0
      puts "normal"
  elsif body_mass_index >= 25.0 && body_mass_index < 30.0 
      puts "overweight"
  else 
      puts "obese"
  end
end

# def get_user_data
  puts "What is your name?"
  name = gets.chomp
  puts "Welcome #{name}"

  puts "What is your height?"
  height = gets.chomp.to_f

  puts "What is your weight?"
  weight = gets.chomp.to_f

  puts "What is your gender?"
  gender = gets.chomp.to_f

  puts "Confirm these details are correct?"
  puts "Name: #{name}"
  puts "Height: #{height}cm"
  puts "Weight: #{weight}kg"
  puts "Gender: #{gender}"
# end 

# get_user_data()


def calc(weight, height)
  puts "Are these details correct? (Y/N)"
data_confirmation = gets.chomp.downcase

if data_confirmation == 'y'
  puts "YEH SICKK"
  calculate_bmi(weight, height)
elsif data_confirmation == 'n'
  # get_user_data()
  # puts "Are these details correct? (Y/N)"
elsif data_confirmation != 'y' || data_confirmation != 'n'
  puts "please select y / n"
  data_confirmation = gets.chomp.downcase
  if data_confirmation == 'y'
    
  elsif data_confirmation == 'n'
    get_user_data()
  else 
    puts "start again"
    exit
  end
end
end

calc(weight, height)

#  logic



