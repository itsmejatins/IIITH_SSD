USE company;



SELECT essn AS "Manager ssn", COUNT(*) AS "Number of projects"
FROM works_on
WHERE Essn = (SELECT mgr_ssn
FROM PROJECT JOIN DEPARTMENT
ON PROJECT.Dnum = DEPARTMENT.Dnumber
WHERE Pname = "ProductY")
GROUP BY essn;