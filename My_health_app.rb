# Required Gems:
require 'tty-prompt'

# Required files
require_relative 'BMI_Class'
require_relative 'EER_Class'

# Using Gem - tty-prompt to create a menu selection for gender options
prompt = TTY::Prompt.new 
gender = prompt.select('What is your gender?') do |menu|
  menu.choice name: 'Male',  value: 'Male'
  menu.choice name: 'Female', value: 'Female'
end

# User input (weight, height, age)
puts "What is your weight in kgs? eg: 60"
weight_in_kg = gets.chomp
puts "What is your height in cm? eg: 160"
height_in_cm = gets.chomp
puts "What is your age?"
age = gets.chomp.to_i
if age <18 
  puts "You are not old enough to use this health app! Please come back in a couple of years"
  return
else age >18
  puts "\n"
end 

# Body Mass Index Calculation method is called and output is produced based on user input
bmi = BMI.new(weight_in_kg, height_in_cm)
puts "#{bmi.calculate_bmi(weight_in_kg,height_in_cm)}\n"

# Using Gem - tty-prompt to create a menu selection to continue or leave
prompt = TTY::Prompt.new 
continue = prompt.select('Would you like to continue to see how many calories your body needs to consume everyday?') do |menu|
  menu.choice name: 'Yes',  value: 'Yes'
  menu.choice name: 'No', value: 'No'
end 