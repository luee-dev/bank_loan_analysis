-- confirming if the data connected successfully
SELECT * FROM bank_loan_data

-- Answering the problems stated
-- 1. Total loan application
SELECT count(id) AS Total_Loan_Applications FROM bank_loan_data

-- MTD Loan applicatoins
SELECT COUNT(id) AS MTD_Total_Loan_Appliecatons FROM bank_loan_data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Loan applications
SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- Total Funded Amount
SELECT sum(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 12 

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 11 

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data

-- MTD Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 12

-- PMTD Total Amount Received
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 11

-- Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 2) AS AVG_Interest_Rate FROM bank_loan_data

-- MTD Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_AVG_Interest_Rate FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 12

-- PMTD Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 2) AS PMTD_AVG_Interest_Rate FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 11

-- Average DTI
SELECT ROUND(AVG(dti) * 100, 2) AS AVG_DTI FROM bank_loan_data

-- MTD Average Interest Rate
SELECT ROUND(AVG(dti) * 100, 2) AS MTD_AVG_DTI FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 12

-- PMTD Average Interest Rate
SELECT ROUND(AVG(dti) * 100, 2) AS PMTD_AVG_DTI FROM bank_loan_data
WHERE YEAR(issue_date) = 2021 AND MONTH(issue_date) = 11

-- Good Loan Count
SELECT loan_status AS Good_Loans, COUNT(*) AS count FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
GROUP BY loan_status

-- Good Loan Count
SELECT loan_status AS Good_Loans, COUNT(*) AS count FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
GROUP BY loan_status

-- Good Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) as Good_Loan_Percentage
FROM bank_loan_data

-- Number of Good Loans Applications
SELECT COUNT(id) as Number_of_Good_Loan_Applictions FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loans Funded Amounts
SELECT SUM(loan_amount) as Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loans Amounts Recieved
SELECT SUM(total_payment) as Good_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Count
SELECT loan_status AS Good_Loans, COUNT(*) AS count FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
GROUP BY loan_status

-- Bad Loan Count
SELECT loan_status AS Bad_Loans, COUNT(id) AS count FROM bank_loan_data
WHERE loan_status = 'Charged Off'
GROUP BY loan_status

-- Bad Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)
	/
	COUNT(id) as Bad_Loan_Percentage
FROM bank_loan_data

-- Number of Bad Loans Applications
SELECT COUNT(id) as Number_of_Bad_Loan_Applictions FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loans Funded Amounts
SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loans Amounts Recieved
SELECT SUM(total_payment) as Bad_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Loan status information
SELECT
	loan_status,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount,
	ROUND(AVG(int_rate * 100), 2) AS Interest_Rate,
	ROUND(AVG(dti * 100), 2) AS DTI
FROM bank_loan_data
GROUP BY loan_status

-- MTD Loan Status information
SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Recieved,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status