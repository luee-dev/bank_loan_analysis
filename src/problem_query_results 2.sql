SELECT * FROM bank_loan_data

-- Monthly Trends by Issue Date
SELECT
	MONTH(issue_date) as Month_No,
	DATENAME(MONTH, issue_date) as Month_Name,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

-- Regional Analysis by State
SELECT
	address_state,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

-- Loan Term Analysis
SELECT
	term,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term

-- Employee Length Analysis 
SELECT
	emp_length,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-- Loan Purpose Breakdown 
SELECT
	purpose,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

-- Home Ownership 
SELECT
	home_ownership,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC