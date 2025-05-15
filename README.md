# 🏥 Medical Data History — SQL Analysis Project

## 📘 Project Overview
This project analyzes a healthcare database using SQL to extract meaningful insights from interconnected datasets — including patient records, doctor information, and hospital admissions.

It simulates 35 real-world data tasks such as identifying trends, updating records, handling NULLs, calculating BMI, and evaluating patient distributions across provinces and diagnoses. This project showcases the ability to work with structured data for practical decision-making in a healthcare context.

---

## 💡 Key Insights & Examples
- Patients diagnosed with Dementia and treated by specific doctors
- Provincial distribution of patients and height/weight metrics
- Most common allergies and their frequency
- Birth trends by year and city-level patient clustering
- Patient weight groups and obesity classification (using BMI)

---

## 🛠 SQL Concepts Demonstrated
- `JOIN` operations across `patients`, `admissions`, `doctors`, and `province_names`
- `CASE` statements and conditional logic
- Data cleaning using `UPDATE` and `IS NULL`
- Grouping and aggregation (`GROUP BY`, `HAVING`, `COUNT`, `SUM`)
- String operations (`CONCAT`, `LOWER`, `UPPER`)
- Date filtering and formatting (`YEAR()`, `DAY()`)

---

## 🧱 Database Structure (Expected Tables)
To run the SQL queries, ensure the following tables exist with appropriate fields:
- `patients(patient_id, first_name, last_name, birth_date, gender, weight, height, allergies, contact_number, city, province_id)`
- `admissions(admission_id, patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)`
- `doctors(doctor_id, first_name, last_name)`
- `province_names(province_id, province_name)`

> Note: This is a mock project and the dataset is simulated for educational purposes.

---

## 🚧 Challenges Addressed
- Replacing missing allergy values with `"NKA"`
- Handling joins with mismatched foreign keys
- Categorizing patients by weight and calculating BMI
- Finding values that occur only once (e.g., unique first names)
- Generating temporary passwords using custom string logic

---

## 📂 Files in This Repository
- `MedicalDataHistory.sql` — All 35 queries used in the analysis
- `MEDICAL DATA HISTORY ppt.pptx` — Slide deck summarizing the project

---

## ✅ How to Use
1. Import the database tables into your SQL environment (MySQL or compatible).
2. Run queries from `MedicalDataHistory.sql` one by one or as needed.
3. Use the PPT to present findings or include screenshots in documentation.

---

## 📈 Author Note
This project was created as part of a portfolio to demonstrate SQL data analysis skills in a real-world domain. It is especially useful for roles in healthcare analytics, business intelligence, and data engineering.

---

