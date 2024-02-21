-- use data_new

-- 1 Show all columns and rows 
SELECT * FROM salaries

-- 2 Show only the EmployeeName and JobTile columns (filter colum)
select EmployeeName,JobTitle from salaries

-- 3 Show the number of employees in the table 
select count(*) from salaries

-- 4 Show the unique job titles in the table 
select distinct JobTitle from salaries;

-- 4 Show number of unique jobtitles
select count(distinct JobTitle) from salaries;

-- 5 Show the job title and overtime pay for all employees with 
-- overtime pay greate than 50000 (filter rows)
select JobTitle, OvertimePay from salaries
where OvertimePay > 50000;

-- 6 Show the avarage base pay for all employees 
select AVG(BasePay) from salaries;

-- we can use Alias to give/change name for particular column
select AVG(BasePay) as "Avg BasePay" from salaries;

-- 7 Show the top ten highest pay employees 
select EmployeeName, TotalPay from salaries
order by TotalPay desc
limit 10;

-- 8 Show the avarage of BasePay, OverTimePay, and OtherPay for each employee
select EmployeeName, (BasePay+ OvertimePay+ OtherPay)/3 AS avg_of_bp_op from salaries; 

-- 9 Show all employees who have the word "Manager" in their Job Title 
select EmployeeName, JobTitle from salaries
where JobTitle LIKE '%Manager%';

-- 10 Show all employees with the JobTitle not equal to manager/ we can also use <> operator
select EmployeeName, JobTitle from salaries
where JobTitle !='Manager'

-- 11 Show all emmployess with the Totalpay between 50,000 and 75,000
select * from salaries 
where TotalPay>= 50000 and TotalPay<= 75000;
-- you can also use between operator which is used to calculate range 
select * from salaries 
where TotalPay between 50000 and 75000; 

-- 12 Show all employees with the basepay less that 50.000 
-- or a totalpay greater that 100.000
select * from salaries 
where BasePay < 50000 or TotalPay > 100000;

-- 13 Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
select * from salaries 
where TotalPayBenefits between 125000 and  150000
and JobTitle LIKE '%Director%';

-- 14	Show all employees ordered by their total pay benefits in descending order.
select * from salaries 
order by TotalPayBenefits desc;

-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order
select JobTitle, AVG(BasePay) AS "avgbasepay" from salaries 
group by JobTitle
having AVG(BasePay) >=100000
order by avgbasepay desc;

-- 16	Delete the column.
select * from salaries; 
alter table salaries 
drop column Notes;
select * from salaries;

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
update salaries 
set BasePay = BasePay * 1.1
where JobTitle LIKE '%Manager%'
select * from salaries;

-- 18	Delete all employees who have no OvertimePay.always be careful make sure you back up data
select count(*) from salaries
where OvertimePay =0;
delete from salaries
where OvertimePay =0;
select count(*) from salaries
where OvertimePay =0;