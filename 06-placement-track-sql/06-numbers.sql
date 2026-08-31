-- 48. Return each role's salary and its monthly equivalent, rounded to the nearest whole pound --
SELECT salary, ROUND(salary / 12.0) AS monthly_salary FROM roles;

-- 49. Return each role's salary rounded to the nearest thousand --
SELECT ROUND(salary, -3) AS salary FROM roles;

-- 50. Return each role's salary with a 4.5% raise applied, rounded to 2 decimal places --
SELECT ROUND(salary * 1.045, 2) AS new_salary FROM roles;

-- 51. Return each company's headcount and the headcount divided by 100, rounded *down* --
SELECT headcount, FLOOR(headcount / 100.0) AS headcount_over_100 FROM companies;

-- 52. Return each company's headcount and the headcount divided by 100, rounded *up* --
SELECT headcount, CEIL(headcount / 100.0) AS headcount_over_100 FROM companies;

-- 53. Return interview scores along with the absolute difference between each score and 75 --
SELECT score, ABS(score - 75) AS difference_75 FROM interviews;

-- 54. Return each role's salary and the remainder when divided by 1000 --
SELECT salary, salary % 1000 AS mod_1000 FROM roles;
