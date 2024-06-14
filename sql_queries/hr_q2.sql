/*
Output is total number of employees over 40 hours of vacation time. 
*/

SELECT COUNT(emp.vacationhours) AS "Number of employees over 40 Hours"
FROM humanresources.employee AS emp
WHERE emp.vacationhours >= 40;