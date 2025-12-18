

SELECT  * from Bank_loan_data
  


 -- Total Loan Applications
SELECT count(id) AS Total_loan_application from Bank_loan_data

-- MTD Loan Applications

 select count(id) as MTD_Total_loan_application  from Bank_loan_data
 where MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

 --PMTD Loan Applications
SELECT COUNT(id) AS PMTD_Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11

--MTD Total Funded Amount
 select  sum(loan_amount) as MTD_Total_Funded_Amount from Bank_loan_data
 where MONTH (issue_date) = 12 AND YEAR(issue_date) =2021

 --PMTD Total Funded Amount
 select  sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_loan_data
 where MONTH (issue_date) = 11 AND YEAR(issue_date) =2021

 --MTD Total Amount Received
 select sum(total_payment) as MTD_Total_amount_recieved from Bank_loan_data
 where MONTH(issue_date) = 12 AND  YEAR(issue_date) = 2021
 
 --PMTD Total Amount Received
  select sum(total_payment) as PMTD_Total_amount_recieved from Bank_loan_data
 where MONTH(issue_date) = 11 AND  YEAR(issue_date) = 2021 

 --Average Interest Rate
 select round(AVG(INT_RATE),4) * 100 AS avg_interest_rate  from Bank_loan_data

 --MTD Average Interest
  select round(AVG(INT_RATE),4) * 100 AS MTD_avg_interest_rate  from Bank_loan_data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
 
 --PMTD Average Interest
   select round(AVG(INT_RATE),4) * 100 AS PMTD_avg_interest_rate  from Bank_loan_data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


--AVG DTI
select ROUND(AVG(dti),4) * 100 as Avg_DTI FROM Bank_loan_data

--MTD Avg DTI
select ROUND(AVG(dti),4) * 100 as MTD_Avg_DTI FROM Bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

--PMTD Avg DTI
select ROUND(AVG(dti),4) * 100 as PMTD_Avg_DTI FROM Bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 



SELECT loan_status FROM Bank_loan_data


----------------------------------------------------------GOOD LOAN ISSUED-------------------------------------------------------------------------------------------------------------------------------------------------------

--Good loan percentage

SELECT 
    (COUNT ( CASE WHEN  loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
    /
    COUNT(id) AS Good_loan_percentage
    FROM Bank_loan_data

---Good loan applications

SELECT COUNT(id) FROM Bank_loan_data
    WHERE loan_status = 'Fully Paid' OR  loan_status = 'Current'
 
 --Good loan funded amount

 SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM Bank_loan_data
    WHERE loan_status = 'Fully Paid' OR  loan_status = 'Current'
 
 --Good Loan Amount Received

 SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--------------------------------------------------------------BAD LOAN ISSUED--------------------------------------------------------------


--Bad Loan Percentage


SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

--Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

---Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Amount Received

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'


-----LOAN STATUS----

	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

   SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

----------------------------------------------------------------------BANK LOAN REPORT---------------------------------------------------------------
------MONTH------

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



-----------------------------STATE

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

---------------------------TERM


SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term


-------EMPLOYEE LENGTH


SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


-----PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose


----HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership



