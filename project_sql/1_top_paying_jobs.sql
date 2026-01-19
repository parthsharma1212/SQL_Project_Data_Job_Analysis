/*
Question : Wht are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on the job postings with specified salaries (remove nulls).
- Why? Highlights the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT 
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'India' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Here's the breakdown of the top data analyst jobs in India:
Wide Salary Range: Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
Diverse Employers: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "job_location": "India",
    "salary_year_avg": "104550.0",
    "company_name": "Clarivate"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "job_location": "India",
    "salary_year_avg": "93600.0",
    "company_name": "Loop Health"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "89118.0",
    "company_name": "Clarivate"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "job_location": "India",
    "salary_year_avg": "79200.0",
    "company_name": "Miratech"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "job_location": "India",
    "salary_year_avg": "79200.0",
    "company_name": "AlphaSense"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "job_location": "India",
    "salary_year_avg": "75067.5",
    "company_name": "Cargill"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "job_location": "India",
    "salary_year_avg": "71600.0",
    "company_name": "Bristol Myers Squibb"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "job_location": "India",
    "salary_year_avg": "64800.0",
    "company_name": "Merck Group"
  }
]
*/