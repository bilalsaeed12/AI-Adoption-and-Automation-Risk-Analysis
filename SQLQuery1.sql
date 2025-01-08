SELECT * 
FROM dbo.ai_job_market_insights

---Total Job Count
SELECT count(Job_Title)
FROM ai_job_market_insights

----Average Salary
SELECT AVG(Salary_USD)
FROM ai_job_market_insights

------Percentage of Remote Friendly Jobs
SELECT CAST(SUM(CASE WHEN Remote_Friendly = 1 THEN 1 ELSE 0 END) as float)*100/COUNT(*)
FROM ai_job_market_insights

----Top 5 Remote Friendly Locations
SELECT TOP 5 location, count(location) as location_count
FROM ai_job_market_insights where Remote_Friendly = 1
GROUP BY location
order by location_count desc

----Top 5 Highly Paid Industry 
SELECT TOP 5 Industry, ROUND(AVG(Salary_USD),2) 
FROM ai_job_market_insights
GROUP BY Industry
ORDER  BY AVG(SALARY_USD) DESC

------Top 5 Highly Paid Job Titles
SELECT TOP 5 Job_Title,AVG(Salary_USD) 
FROM ai_job_market_insights
GROUP BY Job_Title
ORDER BY AVG(Salary_USD) desc

----Job Distribution by Industry
SELECT Industry, COUNT(Industry),
CAST(COUNT(*)*100 as float)/(SELECT COUNT(*) FROM ai_job_market_insights)
FROM ai_job_market_insights
GROUP BY Industry


-----Percentage of jobs with both high ai adoption and automation risk
SELECT Industry,
ROUND(CAST(SUM(CASE WHEN AI_Adoption_Level='High' AND Automation_Risk = 'High' THEN 1 ELSE 0 END) AS float)*100/
COUNT(*),1) as percentage_of_high_ai_adoption
from dbo.ai_job_market_insights
GROUP BY Industry
ORDER BY percentage_of_high_ai_adoption desc

SELECT 
SUM(CASE WHEN Automation_Risk = 'High' AND AI_Adoption_Level = 'Medium' THEN 1 ELSE 0 END),
SUM(CASE WHEN Automation_Risk = 'High' AND AI_Adoption_Level = 'Medium' THEN 1 ELSE 0 END)*100
/(SELECT COUNT(*) FROM ai_job_market_insights)
FROM ai_job_market_insights

-----Job Growth by Industry
SELECT Industry, COUNT(Industry) as total_jobs
FROM dbo.ai_job_market_insights where Job_Growth_Projection= 'Growth'
GROUP by Industry 
ORDER BY total_jobs desc













