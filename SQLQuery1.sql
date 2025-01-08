SELECT * 
FROM dbo.ai_job_market_insights

SELECT count(Job_Title)
FROM ai_job_market_insights

SELECT AVG(Salary_USD)
FROM ai_job_market_insights

SELECT CAST(SUM(CASE WHEN Remote_Friendly = 1 THEN 1 ELSE 0 END) as float)*100/COUNT(*)
FROM ai_job_market_insights

SELECT TOP 5 location, count(location) as location_count
FROM ai_job_market_insights where Remote_Friendly = 1
GROUP BY location
order by location_count desc

SELECT TOP 5 Industry, ROUND(AVG(Salary_USD),2) 
FROM ai_job_market_insights
GROUP BY Industry
ORDER  BY AVG(SALARY_USD) DESC

SELECT TOP 5 Job_Title,AVG(Salary_USD) 
FROM ai_job_market_insights
GROUP BY Job_Title
ORDER BY AVG(Salary_USD) desc

SELECT Automation_Risk,
COUNT(*)*100/ (SELECT COUNT(*) FROM ai_job_market_insights)
FROM ai_job_market_insights
GROUP BY  Automation_Risk

SELECT AI_Adoption_Level,
COUNT(*)*100 / (SELECT COUNT(*) FROM ai_job_market_insights)
FROM ai_job_market_insights
GROUP BY  AI_Adoption_Level

SELECT Industry,
ROUND(CAST(SUM(CASE WHEN AI_Adoption_Level='High' AND Automation_Risk = 'High' THEN 1 ELSE 0 END) AS float)*100/
COUNT(*),1) as percentage_of_high_ai_adoption
from dbo.ai_job_market_insights
GROUP BY Industry
ORDER BY percentage_of_high_ai_adoption desc

SELECT Industry, COUNT(Industry) as total_jobs
FROM dbo.ai_job_market_insights where Job_Growth_Projection= 'Growth'
GROUP by Industry 
ORDER BY total_jobs desc






/*ssss Industry: Entertainment, technology, retail, finance etc
company size: small, medium, large 
location: dubai, singapore, berlin etc
AI_Adoption_level: Low: medium, high 
Automation risk: High, medium, low
Required Skills: python, UI/UX design, sales, cybersecurity etc
Salary in usd
Remote friendly: yes or no
Job Growth Protection: growth, decline, stable 


with these columns and values what would be the best findings to visualize and present in front of the audience in which they will intreseted as well//
---------







