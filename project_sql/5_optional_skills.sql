/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
--WHERE  
 --   demand_count > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
    
LIMIT 25;

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Here's a breakdown of the most optimal skills for Data Analysts : 
High-Demand Programming Languages: Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
Business Intelligence and Visualization Tools: Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
Database Technologies: The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "3083",
    "avg_salary": "96435"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "2143",
    "avg_salary": "86419"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "1840",
    "avg_salary": "101512"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "1659",
    "avg_salary": "97978"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "1073",
    "avg_salary": "98708"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "1044",
    "avg_salary": "92324"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "527",
    "avg_salary": "82941"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "524",
    "avg_salary": "88316"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "500",
    "avg_salary": "93707"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "500",
    "avg_salary": "93707"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "336",
    "avg_salary": "96191"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "332",
    "avg_salary": "100964"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "319",
    "avg_salary": "105400"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "291",
    "avg_salary": "106440"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "288",
    "avg_salary": "97267"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "271",
    "avg_salary": "98020"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "260",
    "avg_salary": "103855"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "241",
    "avg_salary": "111578"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "212",
    "avg_salary": "85293"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "187",
    "avg_salary": "113002"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "185",
    "avg_salary": "93845"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "183",
    "avg_salary": "92446"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "180",
    "avg_salary": "80680"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": "174",
    "avg_salary": "89027"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "155",
    "avg_salary": "84130"
  }
]
*/