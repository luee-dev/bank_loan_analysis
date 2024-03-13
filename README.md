# Bank Loan Analysis
### Table of Content
- [Bank Loan Analysis](#bank-loan-analysis)
    - [Table of Content](#table-of-content)
  - [Project Overview](#project-overview)
  - [Data Source](#data-source)
  - [Tools](#tools)
  - [Data Preparation](#data-preparation)
  - [Exploratory Data Analysis](#exploratory-data-analysis)
  - [Data Analysis](#data-analysis)
  - [Results/Findings](#resultsfindings)
  - [References](#references)

## Project Overview
In this data analysis project, we  are tasked with analyzing a bank loan application to gain insight into the bank's lending activities. Hence we need to create a comprehensive Bank Loan Report. This report aims to provide insights into key loan-related metrics and their changes over time. The report will help us make data-driven decisions, track our loan portfolio's health, and identify trends that can inform our lending strategies.


## Data Source
Bank Loan Data: The primary dataset used for this analysis is the “financial_loan.csv” file containing detailed information about loan applicaticants and their details paratining the loan application such as interest rate, purpose of the loan, loan status, term, economic activity... etc.

## Tools
Data Analysis - SQL Server Management Studio
Data visualization - Excel

## Data Preparation
In the initial data preparation phase, we performed the following tasks:
 - Data loading and inspection inside SQL Server Management Studio.

## Exploratory Data Analysis
EDA involved exploring the sales data to answer key questions, such as:
 - What are the the keep performance indicators
 - What is the main duration term of the loans
 - What is the main purpose of taking a loan?
 - What is the trend of loan application over a year?
 - What are the good and bad loans?


## Data Analysis
Some of the code feature I worked with:

``sql:
SELECT ROUND(AVG(int_rate) * 100, 2) AS AVG_Interest_Rate FROM bank_loan_data
``

``sql:
SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) as Good_Loan_Percentage
FROM bank_loan_data
``

``sql:
SELECT
	loan_status,
	COUNT(id) AS Toatal_Loan_Count,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount,
	ROUND(AVG(int_rate * 100), 2) AS Interest_Rate,
	ROUND(AVG(dti * 100), 2) AS DTI
FROM bank_loan_data
GROUP BY loan_status
``
  
## Results/Findings
The analysis results are summarized as follows:
 - The key performance indicators are:
   - Total Loan Applications of 38.6K
   - Total Funded Amount of $54.0M
   - Total Amount recieved(payment back for the loan taken) of $58.7M
   - Average Interest-Rate of 12.36%
   - Average Debt-to-Income Ratio(DTI) of 13.67%
 - 36 months was the highest duration term of the loan with 73% of all loans.
 - The average interest rate and DTI have been steadily increasing since January 2019. However, there has been an increase 
 - Credit car was the main purpose of people taking loans with 18.2K and renewable energy the lowest with 0.1K
 - California was the state that had the highest number and of loan applicatioin with 6.9K applicants
 - Loan applications montly trend increased throught the year making the month of december have the highest number of loan applications.
 - Good loans are of two categories current and fully paid making up 86% of the total issued loans while bad loan included the charged off category which was 13% of the total loans issued
  
## References
 - SQL for businesses by werty.
 - Stack Overflow
