USE company;

WITH Emp_hour_table AS(

SELECT Essn, Dnum
FROM works_on JOIN PROJECT
	ON works_on.Pno = Project.Pnumber
GROUP BY  Essn, Dnum
HAVING sum(hours) < 40) , 

Lazy_departments AS(
SELECT DISTINCT Dnum from Emp_hour_table),

Lazy_dept_mangers AS(
SELECT mgr_ssn, Dname, Dnum
FROM Lazy_departments JOIN Department
ON Lazy_departments.Dnum = Department.Dnumber)


SELECT DISTINCT CONCAT(Fname, " ", Minit, " ", Lname) AS "Full name", mgr_ssn AS "ssn", Dnum as "Dept. Id", Dname AS "Dept. Name"
FROM Lazy_dept_mangers JOIN Employee
ON Lazy_dept_mangers.mgr_ssn = Employee.ssn;