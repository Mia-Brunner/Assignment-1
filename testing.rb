# Required files
require_relative 'BMI_Class'
require_relative 'EER_Class'

#Testing BMI
def test_BMI_calculator
  bmi = BMI.new(60,175) 
  expected_result = 19.59
  actual_result = bmi 
  if expected_result = actual_result
    puts "PASS"
  else 
    puts "Fail"
  end 
end 

test_BMI_calculator

#Testing estimated energy requirement for female 
def test_EER_calculator
  eer = EER.new(60,175,25,1.2) 
  expected_result = 1723
  actual_result = eer
  if expected_result = actual_result
    puts "PASS"
  else 
    puts "Fail"
  end 
end 

test_EER_calculator