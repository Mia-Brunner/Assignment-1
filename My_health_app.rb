# Required Gems:
require 'tty-prompt'
require 'TTY-font'
require 'pastel'
require 'tty-spinner'

# Required files
require_relative 'BMI_Class'
require_relative 'EER_Class'

# storing data to be placed into a new file 
output_data = []

# Gem Spinner 
spinner = TTY::Spinner.new("[:spinner] Thinking ...", format: :dots_2)
spinner.auto_spin # Automatic animation with default interval
sleep(3) # Perform task
spinner.stop('Done!') # Stop animation

# Using Gem - tty-prompt to create a menu selection for gender options
prompt = TTY::Prompt.new
gender = prompt.select('What is your gender?') do |menu|
  menu.choice name: 'Male',  value: 'Male'
  menu.choice name: 'Female', value: 'Female'
end
output_data << "Gender: " + gender

# User input (weight, height, age)
pastel = Pastel.new
puts pastel.blue('What is your weight in ', pastel.bold.underline('Kilograms'), '? eg:60')
weight_in_kg = gets.chomp
output_data << "Weight: #{weight_in_kg}kg"
puts pastel.magenta('What is your height in ', pastel.bold.underline('Centimeters'), '? eg:160')
height_in_cm = gets.chomp
output_data << "Height: #{height_in_cm}cm"
puts pastel.yellow("What is your age in ", pastel.bold.underline('years'),'?')
age = gets.chomp.to_i
if age <18 
  puts "You are not old enough to use this health app! Please come back in a couple of years"
  return
else age >18
  puts "\n"
end 
output_data << "Age: #{age}"

# Body Mass Index Calculation method is called and output is produced based on user input
bmi = BMI.new(weight_in_kg, height_in_cm)
bmi_display = bmi.calculate_bmi(weight_in_kg,height_in_cm)
puts "#{bmi_display}"
output_data << bmi_display
###BMI NOT being grabbed into output data

# Using Gem - tty-prompt to create a menu selection to continue or leave
continue = prompt.select('Would you like to continue to see how many calories your body needs to consume every day?') do |menu|
  menu.choice name: 'Yes',  value: 'Yes'
  menu.choice name: 'No', value: 'No'
end 

# If statement identifying options when choosing to continue or leave 
if continue == 'Yes'
  # Basic guideline of the constituents of each Physical Activity Level for User awareness 
  puts "Physcial activity Level Guideline:\n"
  puts "Sedentary:\nLittle or no exercise"
  puts "Light:\nLight exercise/sports 1-3 days/week"
  puts "Moderate:\nModerate exercise/sports 3-5 days/week"
  puts "Active:\nHard exercise/sports 6-7 days a week"
  puts "Super:\nVery hard exercise/sports & physical job or 2x training\n\n"

  # Using Gem - tty-prompt to create a menu selection to identify users Physical Activity Level 
  activity_type = prompt.select('What is your physical activity level?') do |menu|
  menu.choice name: 'Sedentary',  value: 'Sedentary'
  menu.choice name: 'Light', value: 'Light'
  menu.choice name: 'Moderate',  value: 'Moderate'
  menu.choice name: 'Active', value: 'Active'
  menu.choice name: 'Super', value: 'Super'
  end

  # Allocating Physical Activity level to a value 
  if activity_type == 'Sedentary'
    exercise = 1.2
  elsif activity_type == 'Light'
    exercise = 1.375
  elsif activity_type == 'Moderate'
    exercise = 1.55
  elsif activity_type == 'Active' 
    exercise = 1.725
  elsif activity_Type == 'Super'
    exercise = 1.9
  else puts "not working"
  end

  # Output: estimates male calorie intake per day
  if gender == "Male"
    eer = EER.new(weight_in_kg, height_in_cm, age, exercise)
    eer_male = eer.bmr_pal_m(weight_in_kg, height_in_cm, age, exercise)
    puts "Your estimated energy requirement is #{eer_male.to_i} Kcal/day"
    puts"\n"
    
  # Output: estimates female calorie intake per day 
  elsif gender == 'Female'
    eer = EER.new(weight_in_kg, height_in_cm, age, exercise)
    eer_female = eer.bmr_pal_f(weight_in_kg, height_in_cm, age, exercise)
    puts "Your estimated energy requirement is #{eer_female.to_i} Kcal/day"
    puts "\n"
  end
  
elsif continue == "No"
  puts "Thank you, come again"
  return 
end 

# Using Gem - tty-prompt to create a menu selection to continue or leave
goal = prompt.select('Now that we know how many calories you need to consume every day, please choose a goal:') do |menu|
  menu.choice name: 'I want to gain weight', value: 'gain'
  menu.choice name: 'I want to lose weight', value: 'lose'
  menu.choice name: 'I want to maintain my current weight', value: 'maintain'
end 

# Identifying macronutrients to be consumed based of daily energy requirements, weight goals and gender
if goal == "gain" && gender == "Male"
  eer_male_gain = eer_male + 500
  macros_male_gain = "#{(eer_male_gain * 0.30 / 4).to_i} grams of protein \n#{(eer_male_gain * 0.35 / 9).to_i} grams of fats \n#{(eer_male_gain * 0.35 / 4).to_i} grams of carbohydrates"
  puts "In order to gain weight you should consume #{eer_male_gain.to_i} Kcals per day."
  puts "From each macronutrient it is suggested that you consume: \n#{macros_male_gain}"
  output_data << "In order to gain weight you should consume #{eer_male_gain.to_i} Kcals per day. \nFrom each macronutrient it is suggested that you consume: \n#{macros_male_gain}"

  elsif goal == "lose" && gender == "Male"
    eer_male_lose = eer_male - 500
    macros_male_lose = "#{(eer_male_lose * 0.30 / 4).to_i} grams of protein \n#{(eer_male_lose * 0.35 / 9).to_i} grams of fats \n#{(eer_male_lose * 0.35 / 4).to_i} grams of carbohydrates"
    puts "In order to lose weight you should consume #{eer_male_lose.to_i} Kcals per day."
    puts "From each macronutrient it is suggested that you consume:\n#{macros_male_lose}"
    output_data << "In order to lose weight you should consume #{eer_male_lose.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_male_lose}"
  
  elsif goal == "maintain" && gender == "Male"
    macros_male_maintain = "#{(eer_male * 0.30 / 4).to_i} grams of protein \n#{(eer_male * 0.35 / 9).to_i} grams of fats\n#{(eer_male * 0.35 / 4).to_i} grams of carbohydrates"
    puts "To maintain your weight you can continue to consume #{eer_male.to_i} Kcals per day."
    puts "From each macronutrient it is suggested that you consume:\n#{macros_male_maintain}"
    output_data << "To maintain your weight you can continue to consume #{eer_male.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_male_maintain}"
  
  elsif goal == "gain" && gender == "Female"
    eer_female_gain = eer_female + 500
    macros_female_gain = "#{(eer_female_gain * 0.30 / 4).to_i} grams of protein\n#{(eer_female_gain * 0.35 / 9).to_i} grams of fats\n#{(eer_female_gain * 0.35 / 4).to_i} grams of carbohydrates"
    puts "In order to gain weight you should consume #{eer_female_gain.to_i} Kcals per day."
    puts "From each macronutrient it is suggested that you consume:\n#{macros_female_gain}"
    output_data << "In order to gain weight you should consume #{eer_female_gain.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_gain}"

  elsif goal == "lose" && gender == "Female"
    eer_female_lose = eer_female - 500
    macros_female_lose = "#{(eer_female_lose * 0.30 / 4).to_i} grams of protein\n#{(eer_female_lose * 0.35 / 9).to_i} grams of fats\n#{(eer_female_lose * 0.35 / 4).to_i} grams of carbohydrates"
    puts "In order to lose weight you should consume #{eer_female_lose.to_i} Kcals per day."
    puts "From each macronutrient it is suggested that you consume:\n#{macros_female_lose}"
    output_data << "In order to lose weight you should consume #{eer_female_lose.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_lose}"

  elsif goal == "maintain" && gender == "Female"
    macros_female_maintain = "#{(eer_female * 0.30 / 4).to_i} grams of protein\n#{(eer_female * 0.35 / 9).to_i} grams of fats\n#{(eer_female * 0.35 / 4).to_i} grams of carbohydrates"
    puts "To maintain your weight you can continue to consume #{eer_female.to_i} Kcals per day."
    puts "From each macronutrient it is suggested that you consume:\n#{macros_female_maintain}"
    output_data << "To maintain your weight you can continue to consume #{eer_female.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_maintain}"
end 


# Error Handling 
def save_output (file_name, output)
  begin
  File.write(file_name,output.join("\n"))
  rescue StandardError => exception
    puts "failed to save output #{exception}"
  end
end 

save_output("data.txt", output_data)

