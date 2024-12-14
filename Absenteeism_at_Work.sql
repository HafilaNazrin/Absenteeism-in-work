Select *
From Absenteeism As A
Left join compensation As B
	On A.ID=B.ID
Left join Reasons As C
	On A.Reason_for_absence=C.Number;

-- To Find Healthiest And Low Absenteeism Employees
Select *
From Absenteeism 
Where Social_drinker=0 and Social_smoker=0
and Body_mass_index < 25 and
Absenteeism_time_in_hours<(Select AVG(Absenteeism_time_in_hours) from Absenteeism);

-- To calculate wage increase for non-smokers for a insurance budget of $9,83,221

-- To calculate no. of non smokers
Select COUNT(Id) as 'No_of_non-smokers'
From Absenteeism
Where Social_smoker=0;

-- Total Working Hours Per Year
-- 8 (Hrs\day) * 5 (Days\week) * 52 (weeks\year) = 2080 Hrs

-- Total No.of Hrs Healthy employee Worked
-- 686(No.of Healthy employee) * 2080(Total Working Hours Per Year)= 14,26,880

-- Increase wage per hour
-- (Insurance budget/Total No.of Hrs Healthy employee Worked)
-- (9,83,221 / 14,26,880) = $0.68

-- Increase of Wage for Non-smoker employee per year
-- 2080(Total Working Hours Per Year) * $0.68(Increase wage per hour) = $1,414.4

-- To optimize the data

Select A.ID,C.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
	 WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
	 WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
	 WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
	 ELSE 'Unknown' End As 'Season Name',
CASE WHEN Body_mass_index < 18.5 THEN 'UnderWeight'
	 WHEN Body_mass_index between 18.5 and 25 THEN 'Normal'
	 WHEN Body_mass_index between 25 and 30 THEN 'OverWeight'
	 WHEN Body_mass_index > 30 THEN 'Obese'
	 ELSE 'Unknown' End As 'BMI_Category',

Day_of_the_week,
Transportation_expense,
Education,
Son,
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
