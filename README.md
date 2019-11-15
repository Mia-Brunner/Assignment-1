# Assessment 2: Plan and Implement a Terminal Application
___________
# My Health App

## Statement of purpose and scope

The purpose of this terminal app is to allow users to gain valuable information about their health and tips for maintaining their health goals such as losing, gaining or maintaining their weight. 

This health application will:
- Provide users with their Body Mass Index based on user input of their height and weight. 
  The user will be allocated within the ranges of underweight, normal weight, overweight or obese. 
- Calculate their daily estimated energy requirement (Kcals/day) for the selected user preference of gaining, losing or maintaining weight.
- Provide recommended macronutrient intakes (protein, fats, carbohydrates) based on their daily estimated energy requirements. 

This app is developed as a reference for those who want to gain a deeper understanding of their health status and provide simple dietary advice for users who wish to improve on their health goals in regards to weight. This app also provides an estimated reference for users who wish to plan their meals specific to each macronutrient in order for them to achieve their goals such as bulking, cutting or maintaining their current weight. 

Users will be able to check their Body Mass Index to see if they are within healthy weight ranges. Furthermore, the user will be asked what their goal is in terms of their weight (to gain, lose or maintain weight). 

Once an answer has been determined, the user will be provided with a daily estimated energy requirement (Kcals/day) specific to their physical activity level, height, weight and gender. 

To break this down further, The user will also be provided with a basic guideline of how many grams of each macronutrient (protein, fats and carbohydrates) they should be consuming. This allows users to gain insight when planning meals in the future. 

Due to the age restrictions of the formula used for Basal Metabolic Rate and Body Mass index Levels, only adults over the age of 18 can use this health app. 

It is also recommended that individuals who are weight training be advised that inaccuracies can occur with their Body Mass Index levels due to the misconception of heavier muscle mass being extra unwanted weight leading to resulting outputs being overweight or obese. 

## Features
#### BMI Calculator
The BMI calculator allows users to gain insight of their Body Mass Index (BMI) based on inputs of height in cms and weight in kgs. 

Once the desired inputs have been acquired, the BMI will be calculated based of a simple maths formula created in the early nineteenth century. 

The formula is as follows: BMI = kg/m^2

In order to recreate this formula using kilograms and centimetres (which are the inputs acquired), an adapted formula will be used as a slight variation of the one seen above. 

The formula that will be used within the class BMI is: 

`body_mass_index = (weight_in_kg.to_f / height_in_cm.to_f / height_in_cm.to_f) * 10000`

This will serve as a main component within the method used to calculate BMI. 

`If` statements will be used to generate the ranges required to assess the users levels. The ranges for the BMI scale that will be used can be seen in the BMI Calculator Flowchart below. 

!!!WRITE ABOUT ERROR HANDLING 
- if the users weight is under 25kg or over 300kg 
- if the users height is under 70cms or over 300cms 

#### Estimated energy requirement calculator

Calculating the estimated energy requirement of the user requires multiple steps. 

Firstly, the users Basal Metabolic Rate (BMR) will be calculated which requires the user inputs of gender, height, weight and age. 

The BMR can then be calculated using a specific formula also known as the Harris-Benedict equation. The design of this formula seperates males and females into 2 different groups. 

The formula that will be used within the class EER to calculate BMR for males and females respectively is:

`BMR_for_males = 66.74 + (weight_in_kgs * 13.75) + (height_in_cms * 5.003) - (age * 6.755)`

`BMR_for_females = 655.1 + (9.563 * weight_in_kg) + (1.85 × height_in_cm) − (4.676 × age)`

In order to attain the estimated energy requirement, a persons BMR will need to be multiplied by their physical activity level (PAL). As seen in the flowchart below for Physical Activity Level, the Harris-Benedict formula can be used to translate each response into numerical form that can then be used in our calculations.

Once the EER is calculated, the user input of weight goal in terms of gaining, maintaining or losing weight is identified. For each weight goal the addition or subraction of 500Kcals/day will be used based user input.

The formulas that will be used to calculate a persons estimated energy requirement (EER) for their weight goals are as follows:

`EER_lose_weight = BMR_for_males or BMR_for_females * PAL - 500`

`EER_maintain weight = BMR_for_males or BMR_for_females * PAL`

`EER_gain_weight = BMR_for_males or BMR_for_females * PAL + 500`

#### Macronutrient calculator





## Flowchart 

![BMI_calc](Documents/BMI_Calc_Flowchart.png)

![BMR_Calc_Flowchart](Documents/BMR_Calc_Flowchart.png)

![PAL_Calc](Documents/PAL_Calc_Flowchart.png)

![EER_Chart](Documents/EER_Chart_Flowchart.png)

![Macro_Chart_Flowchart](Documents/Macro_Chart_Flowchart.png)




## Development Plan 

![Trello_Start](Documents/Trello_day_1.png)

![Trello_day1](Documents/Trello_day_1.2.png)

### Feature 1 - BMI Calculator
#### Tasks:
- 