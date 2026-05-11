-- Show all projects that are over budget
SELECT Project_ID, Project_Name, Total_Budget, Cost_Actual, Cost_Variance,Over_Budget_Flag
FROM Projects
WHERE Over_Budget_Flag = 'Yes';

-- Get total budget vs actual cost
SELECT
   SUM(Total_Budget) AS Total_Budget,
   SUM(Cost_Actual) AS Total_Actual
FROM Projects;

-- Count projects by status
SELECT Status, COUNT(*) AS Total_Projects
FROM Projects
GROUP BY Status;

-- Find top 5 highest cost overrun projects
SELECT Project_ID, Project_Name, Cost_Variance
FROM Projects
ORDER BY Cost_Variance DESC
LIMIT 5;

-- Region-wise total outstanding amount
SELECT Region, SUM(Outstanding) AS Total_Outstanding
FROM Projects
GROUP BY Region
ORDER BY Total_Outstanding DESC;

-- Contractor-wise average project cost
SELECT Contractor, Round(AVG(Cost_Actual),2) AS Avg_Cost
FROM Projects
GROUP BY Contractor;

-- Projects where no payment received
SELECT Project_ID, Project_Name, Invoice_Amt, Payment_Recvd
FROM Projects
WHERE Payment_Recvd = 0;

-- Find projects with payment efficiency < 80%
SELECT 
Project_ID,
Project_Name,
ROUND((Payment_Recvd / Invoice_Amt) * 100, 2) AS Payment_Percentage
FROM Projects
WHERE (Payment_Recvd / Invoice_Amt) < 0.8;

-- Calculate project duration (in days)
SELECT
Project_ID,
Project_Name,
DATEDIFF(End_Date, Start_Date) AS Project_Duration
FROM Projects;

-- Find delayed projects with high outstanding (> 10 lakh)
SELECT Project_ID, Project_Name, Outstanding
FROM Projects
WHERE Status = 'Delayed'
AND Outstanding > 1000000;

-- Contractor performance (Over budget count)
SELECT
Contractor,
COUNT(*) AS Total_Projects,
SUM(CASE WHEN Over_Budget_Flag = 'Yes' THEN 1 ELSE 0 END) AS OverBudget_Count
FROM Projects
GROUP BY Contractor;

-- Profitability (Savings vs Loss)
SELECT
SUM(CASE WHEN Cost_Variance > 0 THEN Cost_Variance ELSE 0 END) AS Total_Loss,
SUM(CASE WHEN Cost_Variance < 0 THEN Cost_Variance ELSE 0 END) AS Total_Savings
FROM Projects;

-- Region with highest average delay risk
SELECT
Region,
COUNT(*) AS Total,
SUM(CASE WHEN Status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Projects
FROM Projects
GROUP BY Region
ORDER BY Delayed_Projects DESC;

-- Cash Flow Risk Projects
-- (High outstanding + ongoing/delayed)
SELECT Project_ID, Project_Name, Outstanding, Status
FROM Projects
WHERE Outstanding > 1000000
AND Status IN ('Ongoing', 'Delayed');

-- Top contractors by total project value
SELECT
Contractor,
SUM(Total_Budget) AS Total_Project_Value
FROM Projects
GROUP BY Contractor
ORDER BY Total_Project_Value DESC;

-- Rank projects within each region by cost
SELECT
Project_ID,Project_Name,
Region,Cost_Actual,
RANK() OVER (PARTITION BY Region ORDER BY Cost_Actual DESC) AS Rank_In_Region
FROM Projects;