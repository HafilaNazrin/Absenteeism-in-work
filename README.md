# Let us Create a Report of Absenteeism with SQL
## First, What is SQL?
SQL can be used to store, access and extract massive amounts of data to carry out the whole Data Science process more smoothly.
SQL which stands for Structured Query Language is a querying language aimed to manage Relational Databases.
Let us create a report using the Query language in accordance with the Client Requirements.

![HR](https://github.com/user-attachments/assets/edc8e5b7-6151-40c2-b327-b9bd9f53d304)

## Objective
The client wanted to know about the following which are,
1. Provide Healthy individuals and low absenteeism for our ‘Healthy Bank Program’ — Total Budget $ 1,000 USD
2. Calculate a Wage Increase or Annual Compensation for non-smokers — Insurance budget $ 983,221

## Creating Database
### Data Source
To get the Source data: Dataset

### To Create Database
Using SQL Query we created a database for the source and imported the CSV files. After analysing the dataset of two files consisting of Absenteeism_at_work and Reasons we are going to join the dataset with the help of SQl.

Select *
From Absenteeism As A
Left join compensation As B
 On A.ID=B.ID
Left join Reasons As C
 On A.Reason_for_absence=C.Number;

### To Find the Healthiest Employee
The Healthiest Employee is calculated in respect to their BMI,

Select *
From Absenteeism 
Where Social_drinker=0 and Social_smoker=0
and Body_mass_index < 25 and
Absenteeism_time_in_hours<(Select AVG(Absenteeism_time_in_hours) from Absenteeism);

### To Find Non-Smokers

Select COUNT(Id) as 'No_of_non-smokers'
From Absenteeism
Where Social_smoker=0;

### To calculate a wage increase for non-smokers for an insurance budget of $9,83,221
First, we are going to calculate the Total Working Hours Per Year,
Total Working Hours Per Year
8 (Hrs\day) * 5 (Days\week) * 52 (weeks\year) = 2080 Hrs

### Then, we are going to calculate the Total No. of hours healthy employees Worked
Total No.of Hrs Healthy employee Worked
686(No.of Healthy employee) * 2080(Total Working Hours Per Year)= 14,26,880

### To calculate the Increase wage per hour
Increase wage per hour
(Insurance budget/Total No.of Hrs Healthy employee Worked)
(9,83,221 / 14,26,880) = $0.68

### Increase of Wages for Non-smoker employees per year
Increase of Wages for Non-smoker employees per year
2080(Total Working Hours Per Year) * $0.68(Increase wage per hour) = $1,414.4

## To optimize the data
We are going to change the season column from numerical to Categorical data by using a query as Season Name and to change the BMI column from numerical to Categorical data by using a query as BMI_Category,

CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
  WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
  WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
  WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
  ELSE 'Unknown' End As 'Season Name'

CASE WHEN Body_mass_index < 18.5 THEN 'UnderWeight'
  WHEN Body_mass_index between 18.5 and 25 THEN 'Normal'
  WHEN Body_mass_index between 25 and 30 THEN 'OverWeight'
  WHEN Body_mass_index > 30 THEN 'Obese'
  ELSE 'Unknown' End As 'BMI_Category'

Now, the Final Data is Developed and only Needed data is selected such as,

Select A.ID,C.Reason,
Month_of_absence,
Body_mass_index,
Season Name,
BMI_Category,
Day_of_the_week,
Transportation_expense,
Education,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
From Absenteeism As A
Left join compensation As B
 On A.ID=B.ID
Left join Reasons As C
 On A.Reason_for_absence=C.Number;

## Conclusion
The increase in wage per hour for Healthy employees is calculated as a result of $0.68
The increase in Wages for Non-smoker employees per year is calculated as a result of $1,414.4

Thanks for reading, see my profile for more Data Analysis projects!
