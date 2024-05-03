/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to the last analysis.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings. 
- Why? Retrives thge top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


/* ^ 
This above SQL code retrieves the top 5 most in-demand skills for remote Data Analyst positions.
It counts the occurrence of each skill mentioned in job postings for remote Data Analyst roles,
groups them by skill, and orders them based on the count of job postings mentioning each skill.
Finally, it limits the output to the top 5 skills with the highest demand count.
*/