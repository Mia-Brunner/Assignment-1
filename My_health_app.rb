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

# Command line argument 
font = TTY::Font.new(:doom)
pastel = Pastel.new
greeting = "Welcome"
output = []

ARGV.each do |arg|
case arg
  when "--hello"
  greeting = "Hello"
  when "--welcome"
  greeting = "Welcome"
  else
  output << arg
  end
end

output.each do |value|
  puts pastel.magenta(font.write("#{greeting}    #{value}"))
end

# Fixes gets with argv
def gets
  STDIN.gets
end

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

# User input (weight, height, age and stored into an array)
# used gem - Pastel 
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
  puts "Inaccurate data input"
  return
else age >18
  puts "\n"
end 
output_data << "Age: #{age}"

# Body Mass Index Calculation
bmi = BMI.new(weight_in_kg, height_in_cm)
body_mass_index = bmi.calculate_bmi(weight_in_kg,height_in_cm)
puts pastel.blue("Your BMI is ", pastel.bold.underline("#{body_mass_index.to_f.round(2)}"))
output_data << "Your BMI is #{body_mass_index.round(2)}"

if body_mass_index < 10
  result = "Data input error. Please input accurate data."
elsif body_mass_index >= 10 && body_mass_index < 18.5
  result = "This classifies you as underweight." 
elsif body_mass_index >= 18.5 && body_mass_index < 25.0
  result = "This classifies you as being in the normal weight range."
elsif body_mass_index >= 25.0 && body_mass_index < 30.0 
  result = "This classifies you as overweight."
elsif body_mass_index >= 30.0 && body_mass_index < 60.0 
  result = "This classifies you as obese."
else body_mass_index >= 60.0
  result = "Data input error. Please input accurate data."
end
puts pastel.blue("#{result}\n")
output_data << result

# Using Gem - tty-prompt to create a menu selection to continue or leave
continue = prompt.select('Would you like to continue to see how many calories your body needs to consume every day?') do |menu|
  menu.choice name: 'Yes',  value: 'Yes'
  menu.choice name: 'No', value: 'No'
end 

# If statement identifying options when choosing to continue or leave 
if continue == 'Yes'
  # Basic guideline of the constituents of each Physical Activity Level for User awareness 
  puts pastel.decorate("\nPhyscial activity Level Guideline:", :green, :underline, :bold)
  puts pastel.decorate("Sedentary = Little or no exercise", :green)
  puts pastel.decorate("Light = Light exercise/sports 1-3 days/week", :green)
  puts pastel.decorate("Moderate = Moderate exercise/sports 3-5 days/week", :green)
  puts pastel.decorate("Active = Hard exercise/sports 6-7 days a week", :green) 
  puts pastel.decorate("Super = Very hard exercise/sports & physical job or 2x training", :green)
  puts "\n\n"

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
    puts pastel.magenta("\nYour Estimated Energy Requirement is ", pastel.bold.underline("#{eer_male.to_i} Kcal/day\n"))

  # Output: estimates female calorie intake per day 
  elsif gender == 'Female'
    eer = EER.new(weight_in_kg, height_in_cm, age, exercise)
    eer_female = eer.bmr_pal_f(weight_in_kg, height_in_cm, age, exercise)
    puts pastel.magenta("\nYour Estimated Energy Requirement is ", pastel.bold.underline("#{eer_female.to_i} Kcal/day\n"))
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

# Identifying macronutrients to be consumed based of daily energy requirements, weight goals and gender and adding it into an array
if goal == "gain" && gender == "Male"
  eer_male_gain = eer_male + 500
  macros_male_gain = "#{(eer_male_gain * 0.30 / 4).to_i} grams of protein \n#{(eer_male_gain * 0.35 / 9).to_i} grams of fats \n#{(eer_male_gain * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nIn order to gain weight you should consume ", pastel.bold.underline("#{eer_male_gain.to_i} Kcals/day.\n"))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_male_gain}"))
  output_data << "In order to gain weight you should consume #{eer_male_gain.to_i} Kcals per day. \nFrom each macronutrient it is suggested that you consume: \n#{macros_male_gain}"

elsif goal == "lose" && gender == "Male"
  eer_male_lose = eer_male - 500
  macros_male_lose = "#{(eer_male_lose * 0.30 / 4).to_i} grams of protein \n#{(eer_male_lose * 0.35 / 9).to_i} grams of fats \n#{(eer_male_lose * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nIn order to lose weight you should consume ", pastel.bold.underline("#{eer_male_lose.to_i} Kcals/day."))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_male_lose}"))
  output_data << "In order to lose weight you should consume #{eer_male_lose.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_male_lose}"

elsif goal == "maintain" && gender == "Male"
  macros_male_maintain = "#{(eer_male * 0.30 / 4).to_i} grams of protein \n#{(eer_male * 0.35 / 9).to_i} grams of fats\n#{(eer_male * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nTo maintain your weight you can continue to consume ", pastel.bold.underline("#{eer_male.to_i} Kcals per day."))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_male_maintain}"))
  output_data << "To maintain your weight you can continue to consume #{eer_male.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_male_maintain}"

elsif goal == "gain" && gender == "Female"
  eer_female_gain = eer_female + 500
  macros_female_gain = "#{(eer_female_gain * 0.30 / 4).to_i} grams of protein\n#{(eer_female_gain * 0.35 / 9).to_i} grams of fats\n#{(eer_female_gain * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nIn order to gain weight you should consume ",pastel.bold.underline("#{eer_female_gain.to_i} Kcals per day."))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_female_gain}"))
  output_data << "In order to gain weight you should consume #{eer_female_gain.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_gain}"

elsif goal == "lose" && gender == "Female"
  eer_female_lose = eer_female - 500
  macros_female_lose = "#{(eer_female_lose * 0.30 / 4).to_i} grams of protein\n#{(eer_female_lose * 0.35 / 9).to_i} grams of fats\n#{(eer_female_lose * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nIn order to lose weight you should consume ",pastel.bold.underline("#{eer_female_lose.to_i} Kcals per day."))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_female_lose}"))
  output_data << "In order to lose weight you should consume #{eer_female_lose.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_lose}"

elsif goal == "maintain" && gender == "Female"
  macros_female_maintain = "#{(eer_female * 0.30 / 4).to_i} grams of protein\n#{(eer_female * 0.35 / 9).to_i} grams of fats\n#{(eer_female * 0.35 / 4).to_i} grams of carbohydrates"
  puts pastel.blue("\nTo maintain your weight you can continue to consume ", pastel.bold.underline("#{eer_female.to_i} Kcals per day."))
  puts pastel.blue("\nFrom each macronutrient it is suggested that you consume:\n", pastel.bold("#{macros_female_maintain}"))
  output_data << "To maintain your weight you can continue to consume #{eer_female.to_i} Kcals per day.\nFrom each macronutrient it is suggested that you consume:\n#{macros_female_maintain}"
end 

puts pastel.yellow("\n\nYou have completed all the questions.\n")
puts pastel.yellow(font.write("Thank     you!"))

# Error Handling 
def save_output (file_name, output)
  begin
  File.write(file_name,output.join("\n"))
  rescue StandardError => exception
    puts "failed to save output #{exception}"
  end
end 
save_output("data.txt", output_data)

