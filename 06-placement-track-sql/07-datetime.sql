-- 55. Return today's date, and today's date and time --
SELECT CURRENT_DATE, NOW();

-- 56. Return each application's `applied_date` along with just its year, just its month, and just its day, in separate columns --
SELECT applied_date, 
    EXTRACT(YEAR FROM applied_date) AS applied_year, 
    EXTRACT(MONTH FROM applied_date) AS applied_month, 
    EXTRACT(DAY FROM applied_date) AS applied_day
FROM applications;

-- 57. Return each role's `posted_date` and the day-of-week name --
SELECT posted_date, TO_CHAR(posted_date, 'FMDay') AS day_of_week FROM roles;

-- 58. Return each application's `applied_date` formatted as `DD/MM/YYYY` --
SELECT TO_CHAR(applied_date, 'DD/MM/YYYY') FROM applications;

-- 59. How many days did each application take to get a response? (NULL response dates should show as NULL for now) --
 SELECT response_date - applied_date AS response_days FROM applications;

-- 60. Return each role with its `closing_date` and the number of days between posting and closing --
SELECT closing_date, closing_date - posted_date AS days_open FROM roles;

-- 61. Return each company's founded date and how many full years old the company is --
SELECT founded_date, EXTRACT(YEAR FROM AGE(founded_date)) AS company_age FROM companies;

-- 62. Return all applications made in the last 60 days relative to 2026-03-31 --
SELECT * FROM applications 
WHERE '2026-03-31' - applied_date <= 60 
    AND applied_date <= '2026-03-31';

-- 63. Return each role's `posted_date` plus 14 days as `review_date` --
SELECT posted_date + 14 AS review_date FROM roles;

-- 64. Group applications by the month they were applied in, and count them. (Month + year, so January 2025 and January 2026 are separate) --
SELECT TO_CHAR(applied_date, 'FMMonth YYYY'), COUNT(*) 
FROM applications 
GROUP BY TO_CHAR(applied_date, 'FMMonth YYYY');

-- 65. Return every interview that happened in Q1 2026 --
SELECT * FROM interviews 
WHERE EXTRACT(YEAR FROM interview_date) = 2026
    AND EXTRACT(QUARTER FROM interview_date) = 1;
