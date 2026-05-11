# Cost-Financial-Analysis-Python-Sql-Power-BI-
Analyzing cost and financial performance, I delivered an end-to-end analytics project to uncover risks and improve project outcomes. Using Python, SQL, and Power BI, I transformed raw, inconsistent data into meaningful insights, enabling better financial control, improved cash flow tracking, and proactive decision-making across multiple projects.

35 projects. 17 over budget. ₹41M is still outstanding.
What’s really going wrong in project financial management?

I recently worked on an end-to-end data analytics project to uncover financial risks and performance gaps across multiple projects using Python, SQL, and Power BI.

🔧 What I Did
✔️ Cleaned and transformed raw data using Python (Pandas) - Handled missing values, Standardized column, Datetime format, Fixed inconsistent values
✔️ Created key metrics like Cost Variance, Outstanding Amount, and Over Budget Flag
✔️ Used SQL to extract business-critical insights
✔️ Built an interactive Power BI dashboard for decision-making

📊 Key Insights
🚨 17 out of 35 projects are over budget → Cost control issues
💰 High outstanding payments (₹41M) impacting cash flow
⏱️ Several delayed projects with high outstanding = financial risk
🌍 Certain regions contributing more to cost overruns

💻 SQL in Action
-- Find delayed projects with high outstanding (> 10 lakh)


SELECT Project_ID, Project_Name, Outstanding
FROM Projects
WHERE Status = 'Delayed'
AND Outstanding > 1000000;

-- Top 5 highest cost overrun projects

SELECT Project_Name, Cost_Variance
FROM Contracts
ORDER BY Cost_Variance DESC
LIMIT 5;

-- Projects with low payment efficiency (<80%)
SELECT Project_Name,
      (Payment_Recvd / Invoice_Amt) * 100 AS Payment_Percentage
FROM Contracts
WHERE (Payment_Recvd / Invoice_Amt) < 0.8;


📊 Dashboard Highlights
KPI Cards: Budget, Actual Cost, Outstanding, Over Budget Projects
Budget vs Actual Cost comparison
Region-wise Outstanding & Payments
Delayed projects with high financial risk
Interactive filters for deeper analysis

🚀 Outcome
This project turns raw data into a decision-making tool that helps:
Improve cost control
Track cash flow effectively
Identify high-risk projects early

