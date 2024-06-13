/*
Create a SQL query that generates a report for HR that includes:

    The employee's name (at least first and last).
    The employee's position in the company.
    The employee's email address.
    How many vacation hours the employee has accrued.
    Only employees who have accrued more than a certain number of hours.
        HR may like to change this threshold in the future.
    Human-readable titles and column headers that reflect the chosen threshold.

They would like to begin by contacting employees who have accrued 40 or more hours of vacation. Create an initial report for this threshold.

Save a copy of this report so it can be opened in Excel.
*/

SELECT prs.firstname AS "First Name"
  , prs.lastname AS "Last Name"
  , emp.jobtitle AS "Job Title"
  , em.emailaddress AS "Email Address"
  , emp.vacationhours AS "Fourty Plus Vocation Hours"
FROM humanresources.employee AS emp
  JOIN person.person AS prs
  USING(businessentityid)
  JOIN person.emailaddress AS em
  USING(businessentityid)
WHERE emp.vacationhours >= 40
;