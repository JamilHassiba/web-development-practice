-- 16. Return every column from roles --
SELECT * FROM roles;

-- 17. Return student first name, last name, and university only --
SELECT first_name, last_name, university FROM students;

-- 18. Return each role's title and salary, with the salary column aliased as annual_salary_gbp --
SELECT title, salary AS annual_salary_gbp FROM roles;

-- 19. Return a list of distinct universities in the students table --
SELECT DISTINCT university FROM students;

-- 20. Return the 5 highest-paying roles, title and salary only --
SELECT title, salary FROM roles ORDER BY salary DESC NULLS LAST LIMIT 5;

-- 21. Return all companies sorted by city (A–Z), and within each city by headcount (largest first) --
SELECT * FROM companies ORDER BY city ASC, headcount DESC;

-- 22. Return distinct combinations of sector and city from companies --
SELECT DISTINCT sector, city FROM companies;
