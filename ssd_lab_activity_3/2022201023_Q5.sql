USE company;

WITH Dept_count AS(

SELECT Dnumber
FROM DEPT_LOCATIONS
GROUP BY Dnumber
HAVING COUNT(*) > 1),

Manager_Ids AS(
SELECT mgr_ssn, Dept_count.Dnumber
FROM Dept_count JOIN DEPARTMENT
ON Dept_count.Dnumber = DEPARTMENT.Dnumber
)

SELECT mgr_ssn AS "Manager ssn", Dnumber AS "Dept. Id", COUNT(*) AS "Number of Dependents"
FROM Manager_Ids JOIN DEPENDENT
ON Manager_Ids.mgr_ssn = DEPENDENT.essn
GROUP BY essn, Dnumber;