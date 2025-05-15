-- 1) Show first name,last name and gender of patients who's gender is 'M'
SELECT first_name,last_name,gender
FROM patients
WHERE gender='M';

-- 2) Show first name and last name of patients who does not have allergies.
SELECT first_name,last_name
FROM patients
WHERE allergies IS NULL;

-- 3) Show first name of patients that start with the letter 'C'
SELECT first_name 
FROM patients
WHERE first_name LIKE 'C%';

-- 4) Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
SELECT first_name,last_name 
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- 5) Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

-- 6) Show first name and last name concatenated into one column to show their full name.
SELECT CONCAT(first_name,' ',last_name)
AS full_name
FROM patients;

-- 7) Show first name, last name, and the full province name of each patient.
SELECT p.first_name, p.last_name, pr.province_name
FROM patients p
JOIN province_names pr ON p.province_id = pr.province_id;

-- 8) Show how many patients have a birth_date with 2010 as the birth year.
SELECT COUNT(*) AS patient_count
FROM patients
WHERE YEAR(birth_date) = 2010;

-- 9) Show the first_name, last_name, and height of the patient with the greatest height.
SELECT first_name,last_name,height
FROM patients
ORDER BY height DESC
limit 1;

-- 10) Show all columns for patients who have one of the following patient_ids: 1, 45, 534, 879, 1000
SELECT * FROM patients
WHERE patient_id IN(1,45,534,879,1000);

-- 11) Show the total number of admissions
SELECT COUNT(*) as total_admissions
FROM admissions;

-- 12) Show all the columns from admissions where the patient was admitted and discharged on the same day.
SELECT * FROM admissions
WHERE admission_date=discharge_date;

-- 13) Show the total number of admissions for patient_id 579
SELECT COUNT(*) AS admissions_count
FROM admissions
WHERE patient_id = 579;

-- 14)  Based on the cities that our patients live in, show unique cities that are in province_id 'NS'
SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';

-- 15) Find the first_name, last_name and birth date of patients who have height more than 160 and weight more than 70
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;

-- 16) Show unique birth years from patients and order them by ascending.
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- 17) Show unique first names from the patients table which only occurs once in the list.
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

-- 18)  Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's%' AND first_name LIKE '%s'
  AND LENGTH(first_name) >= 6;
  
  -- 19) Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'.
SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

-- 20) Display every patient's first_name. Order the list by the length of each name and then alphabetically.
SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name;

-- 21) Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
SELECT 
  COUNT(CASE WHEN gender = 'M' THEN 1 END) AS male_count,
  COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_count
FROM patients;

-- 22) Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

-- 23) Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;

-- 24) Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor".
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;

-- 25) Show all allergies ordered by popularity. Remove NULL values from query.
SELECT allergies, COUNT(*) AS count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY count DESC;

-- 26) Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date
FROM patients
WHERE YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;

-- 27) Display each patient's full name in a single column. Last name in UPPER case, first name in lower case. Format: SMITH,john. Order by first_name descending.
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM patients
ORDER BY first_name DESC;

-- 28) Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT province_id, SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- 29) Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE last_name = 'Maroni';

-- 31) Show all of the days of the month (1–31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
SELECT DAY(admission_date) AS day_of_month, COUNT(*) AS admission_count
FROM admissions
GROUP BY DAY(admission_date)
ORDER BY admission_count DESC;

-- 32) Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group descending.e.g. if they weigh 100 to 109, they are placed in the 100 weight group, 110–119 = 110 weight group, etc.
SELECT FLOOR(weight / 10) * 10 AS weight_group, COUNT(*) AS patient_count
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- 33) 
SELECT 
  patient_id,
  weight,
  height,
  CASE 
    WHEN (weight / POWER(height / 100, 2)) >= 30 THEN 1 
    ELSE 0 
  END AS isObese
FROM patients;

-- 34)
SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';

-- 35) 
SELECT 
  patient_id,
  LOWER(last_name) AS last_name,
  YEAR(birth_date) AS birth_year,
  RIGHT(contact_number, 4) AS last4_digits,
  CONCAT(LOWER(last_name), YEAR(birth_date), RIGHT(contact_number, 4)) AS temp_password
FROM patients;
























