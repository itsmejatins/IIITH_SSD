USE company;
WITH Eligible_Managers AS(

SELECT mgr_ssn
FROM DEPARTMENT JOIN DEPENDENT
ON DEPARTMENT.mgr_ssn = DEPENDENT.essn
WHERE SEX = 'F'
GROUP BY mgr_ssn
HAVING COUNT(*) > 1
),

Department_List AS (

SELECT DEPARTMENT.Dnumber AS Dnum
FROM Eligible_Managers JOIN DEPARTMENT
ON Eligible_Managers.mgr_ssn = DEPARTMENT.mgr_ssn),

location_count as(

SELECT DEPT_LOCATIONS.Dnumber AS "dept_num", COUNT(*) AS "number_locations"
FROM Department_List JOIN DEPT_LOCATIONS
ON Department_List.Dnum = DEPT_LOCATIONS.Dnumber
GROUP BY DEPT_LOCATIONS.Dnumber)


SELECT dept_num AS "Dept. Id", DEPARTMENT.DName AS "Dept. Name", number_locations AS "Number of locations"
FROM LOCATION_COUNT JOIN DEPARTMENT
ON LOCATION_COUNT.dept_num = DEPARTMENT.Dnumber;