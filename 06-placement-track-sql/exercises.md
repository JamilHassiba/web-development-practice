# PlacementTrack — A Multi-Part SQL Practice Project

You've been hired (fictionally) as the backend engineer for **PlacementTrack**, a platform that helps UK CS students find and track placement-year applications. Your job is to build the database, load it, clean it, and answer the questions the product team keeps asking.

Everything here is solvable with **only** what you've learned so far: DDL, DML, SELECT, filtering, joins (basic + advanced), set operators, string/numeric/date/NULL functions, CASE, and aggregate functions. No window functions, no CTEs, no subqueries needed.

**How to use this:** work through the parts in order. Part 0 gives you the setup script. Parts 1–12 are the tasks. Part 13 is a set of boss challenges that combine everything. There are hints at the end, but try each task cold first.

**Dialect note:** the setup script is written to run on MySQL, PostgreSQL, or SQL Server without changes (no auto-increment, explicit IDs, standard types). Where a task needs a dialect-specific function, I've flagged it. Use whichever database the video used.

---

## Part 1 — DDL: shaping the schema

1. The product team wants to track how students found each role. Add a `source` column to `applications` (short text, e.g. 'careers fair', 'linkedin').
2. Salaries turn out to need pence-level precision for some part-time roles. Change `roles.salary` to a decimal type with 2 decimal places.
3. Add a `last_updated` date column to `students`.
4. Create a new table `saved_roles` with columns: `saved_id` (primary key), `student_id`, `role_id`, `saved_date`, and a `notes` column. Give `saved_date` a sensible NOT NULL constraint.
5. You've decided `students.last_updated` was a bad idea. Drop it.
6. Rename the `newsletter_signups` table to `marketing_signups`. (Check your dialect's syntax — this is one of the few genuinely non-portable statements.)

---

## Part 2 — DML: inserting, updating, deleting

7. Insert a new company: Halcyon Labs' rival, "Vantage AI", AI sector, Cambridge, 45 staff, founded 2023-05-04. Pick a sensible `company_id`.
8. Insert two roles for Vantage AI: an "ML Engineer Placement" at £33,000 in Cambridge (posted today, closes in 60 days), and a "Research Intern" with an unknown salary, remote.
9. Insert yourself as student 15. Use your real details — you're going to be querying yourself later.
10. Insert an application: you applied to the ML Engineer Placement today, status 'submitted', no response yet.
11. Every application with status `'submitted'` that was applied for before 2026-02-01 has gone stale. Update those to `'rejected'` and set their `response_date` to 2026-03-31.
12. Pixelforge has rebranded to "Pixelforge Studios". Update it.
13. Roles with no `closing_date` are causing bugs. Set every NULL `closing_date` to 90 days after that role's `posted_date`.
14. Delete all applications with status `'withdrawn'`.
15. Two students never signed up properly (13 and 14 have no applications). Delete student 14 only. Then write the DELETE you *would* run to remove all students with no email — but don't run it. Explain in a comment why it's dangerous.

> From here on, assume the original data (before Part 1 and 2 changes) unless a task says otherwise. If your data has drifted, re-run the Part 0 script.

---

## Part 3 — SELECT basics

16. Return every column from `roles`.
17. Return student first name, last name, and university only.
18. Return each role's title and salary, with the salary column aliased as `annual_salary_gbp`.
19. Return a list of distinct universities in the students table.
20. Return the 5 highest-paying roles, title and salary only.
21. Return all companies sorted by city (A–Z), and within each city by headcount (largest first).
22. Return distinct combinations of `sector` and `city` from companies.

---

## Part 4 — Filtering

23. All roles based in London.
24. All roles paying more than £28,000.
25. All roles paying between £25,000 and £32,000 inclusive.
26. All roles in London *or* Manchester, using an operator that isn't `OR`.
27. All applications with status 'offer' or 'interview'.
28. All roles that are remote (`is_remote = 1`) **and** pay more than £28,000.
29. All roles that are *not* in London.
30. All roles with an unknown salary.
31. All roles with a known salary and a known closing date.
32. All students graduating in 2026 or 2027 who study Computer Science.
33. All applications submitted in February 2026 (use a date range, not a function).
34. The 3 lowest-paying roles that have a known salary.
35. All companies founded before 2010 with more than 1,000 staff.

---

## Part 5 — String functions

36. Return each student's full name as a single column called `full_name` ("Amira Haddad").
37. Notice that student 2's first and last names have stray whitespace. Return all students with names trimmed.
38. Return every student email in lowercase.
39. Return each student's initials, e.g. "A.H." for Amira Haddad.
40. Return the university name in uppercase along with its character length.
41. Extract the domain part of each email (everything after the `@`).
42. Return each role's title with the word "Placement" replaced by "Placement Year".
43. Return the first 3 characters of every company name.
44. Find all students whose last name starts with "M".
45. Find all roles whose title contains the word "Engineer".
46. Build a display string for each role: `"Software Engineer Placement — London (£32000)"`. Handle roles with a NULL salary gracefully (they should still appear, with something sensible where the number goes).
47. The `interviewer_name` column has inconsistent casing ("r. castillo", "R. CASTILLO"). Return a cleaned, consistently-cased list of distinct interviewer names.

---

## Part 6 — Numeric functions

48. Return each role's salary and its monthly equivalent, rounded to the nearest whole pound.
49. Return each role's salary rounded to the nearest thousand.
50. Return each role's salary with a 4.5% raise applied, rounded to 2 decimal places.
51. Return each company's headcount and the headcount divided by 100, rounded *down*.
52. Return each company's headcount and the headcount divided by 100, rounded *up*.
53. Return interview scores along with the absolute difference between each score and 75.
54. Return each role's salary and the remainder when divided by 1000 (use a modulo operator/function).

---

## Part 7 — Date and time functions

55. Return today's date, and today's date and time.
56. Return each application's `applied_date` along with just its year, just its month, and just its day, in separate columns.
57. Return each role's `posted_date` and the day-of-week name.
58. Return each application's `applied_date` formatted as `DD/MM/YYYY`.
59. How many days did each application take to get a response? (NULL response dates should show as NULL for now.)
60. Return each role with its `closing_date` and the number of days between posting and closing.
61. Return each company's founded date and how many full years old the company is.
62. Return all applications made in the last 120 days relative to 2026-03-31 (treat that as "today").
63. Return each role's `posted_date` plus 14 days as `review_date`.
64. Group applications by the month they were applied in, and count them. (Month + year, so December 2025 and January 2026 are separate.)
65. Return every interview that happened in Q1 2026.

---

## Part 8 — NULL handling

66. Return every role's title and salary, showing `0` where salary is NULL.
67. Return every role's title and salary, showing the text `'Not disclosed'` where salary is NULL. (Watch your data types.)
68. Return each student's email, falling back to `'no email on file'`.
69. Return each application's `response_date`, falling back to its `applied_date` if the response date is missing.
70. Return every student's first name and their `mentor_id`, showing `'No mentor assigned'` where there isn't one.
71. Return interview scores, showing `'Not yet scored'` where NULL.
72. Return each role's salary and a column that shows NULL whenever the salary is exactly 28500 (use the function that turns a matching value into NULL).
73. Count how many roles have a NULL salary. Then count how many have a non-NULL salary. Confirm the two numbers add up to the total row count.
74. Explain (in a comment) why `WHERE salary != 32000` doesn't return roles with a NULL salary, and write a version that does include them.

---

## Part 9 — CASE

75. Label each role's salary band: `'Low'` under £25,000, `'Mid'` £25,000–£32,000, `'High'` above £32,000, `'Unknown'` if NULL.
76. Label each company by size: `'Startup'` under 100, `'Scale-up'` 100–999, `'Enterprise'` 1,000+.
77. Add a column to applications showing `'Successful'` for offers, `'In progress'` for submitted/screening/interview, and `'Unsuccessful'` for rejected/withdrawn.
78. Label each role `'Remote'` or `'On-site'` based on `is_remote`.
79. Label each student by graduation urgency: `'Graduating soon'` for 2026, `'Next year'` for 2027, `'Plenty of time'` for anything later.
80. For each interview, label the score `'Strong'` (80+), `'Pass'` (65–79), `'Weak'` (below 65), `'Pending'` (NULL).
81. Return a single row: count of applications that resulted in an offer, and count that didn't — as two columns, using CASE inside aggregate functions.
82. Order roles so that London roles appear first, then Remote, then everything else — using CASE in the ORDER BY.

---

## Part 10 — Aggregate functions

83. How many students are there? How many applications?
84. How many students have an email address on file? (Note how `COUNT(column)` differs from `COUNT(*)`.)
85. What's the average, minimum, maximum, and total salary across all roles?
86. What's the average salary per company? Show the company_id and the average.
87. How many roles does each company have? Include the company_id.
88. How many applications does each student have? Show student_id and the count, ordered from most to least.
89. Average interview score per application, ignoring unscored interviews.
90. Which statuses appear in `applications`, and how many of each?
91. Count applications per month of `applied_date`, ordered chronologically.
92. Average salary per city, but only for cities with more than 2 roles.
93. Companies with an average salary above £29,000.
94. The highest interview score per interviewer (clean the casing first).
95. For each role, the number of applications it received and the number that reached 'offer'. (CASE inside SUM.)
96. Total number of interview rounds conducted per application, and the maximum round reached.

---

## Part 11 — Joins (basics)

97. List every application with the student's full name and the role title.
98. List every role with its company name.
99. List every application with student name, role title, and company name.
100. List every company and its roles, **including companies with no roles**.
101. List every student and their applications, **including students who never applied**.
102. List every role and the count of applications it received, including roles with zero applications.
103. List every interview with the student's name and the company they interviewed at.
104. Show all students and all roles in a single result where each is matched to the other only if they're in the same city as the company... actually, simpler: show every student alongside every London role (a deliberate cross product — this is your CROSS JOIN warm-up).
105. Show every application alongside the interviews for it, including applications with no interviews.

---

## Part 12 — Joins (advanced)

106. Return each student's name alongside their mentor's name (self join). Include students with no mentor.
107. Find all students who have **never** applied to anything (anti join — LEFT JOIN + IS NULL).
108. Find all companies that have posted roles but received **zero** applications across all of them.
109. Find all roles that nobody has interviewed for.
110. Find every mentor who has at least one mentee, along with how many mentees they have.
111. Find pairs of students who study at the same university (self join, no student paired with themselves, and no duplicate mirror pairs — i.e. A–B but not also B–A).
112. Find pairs of roles at the same company with the same salary.
113. Full outer join: show every student and every application, with unmatched rows from both sides. (If your dialect doesn't support FULL OUTER JOIN, achieve it with two joins and a set operator.)
114. For each student, show their name, the number of applications, the number of interviews they've attended, and their best interview score. Include students with no applications at all.
115. Show every company alongside every sector's average headcount... simpler: cross join `companies` with a 3-row list of quarters ('Q1','Q2','Q3') to produce a reporting skeleton.

---

## Part 13 — Set operators

116. Return every email that appears in `newsletter_signups` or `alumni_network`, with no duplicates.
117. Same, but keep duplicates.
118. Return emails that appear in **both** lists.
119. Return emails in `newsletter_signups` that are **not** in `alumni_network`.
120. Return emails in `alumni_network` that are **not** in `newsletter_signups`.
121. Return emails in either list that don't correspond to any student in the `students` table. (Watch the casing on student emails.)
122. Build a single unified "contact list": all student emails plus all newsletter emails plus all alumni emails, deduplicated, sorted alphabetically.
123. Return all London-based *roles* and all London-based *companies* in one two-column result (`name`, `type`), where `type` says whether the row is a role or a company.

---

## Part 14 — Boss challenges

These combine most of what you've learned. Take your time.

**B1 — The placement leaderboard**
For every student, produce: full name (cleaned and properly cased), university, total applications, offers received, rejections, their success rate as a percentage rounded to 1 decimal place, and a CASE-based label (`'Strong'` if success rate ≥ 30%, `'Okay'` if 10–29%, `'Struggling'` if under 10%, `'No applications yet'` if they haven't applied). Include students with zero applications. Sort by success rate descending.

**B2 — Company health report**
For every company (including ones with no roles): company name, sector, size band (CASE on headcount), number of roles posted, number of roles with an undisclosed salary, average disclosed salary rounded to the nearest pound, total applications received across all roles, and the average number of applications per role rounded to 1 decimal. Show `'No roles posted'` in a `notes` column where applicable.

**B3 — Interview funnel by month**
For each month of `applied_date`: month label formatted as `'YYYY-MM'`, total applications, how many reached interview stage or beyond, how many resulted in an offer, and the offer conversion rate as a percentage. Sort chronologically.

**B4 — The interviewer scorecard**
For each interviewer (names cleaned to consistent casing): number of interviews conducted, number of distinct students interviewed, average score (excluding unscored), highest score, lowest score, and how many of their interviews led to the application eventually reaching 'offer'. Only include interviewers who've done 3 or more interviews.

**B5 — Stale application audit**
Find every application still sitting in 'submitted' or 'screening' as of 2026-03-31. For each: student full name, student email (or a fallback), company name, role title, days since applied, and an urgency CASE (`'Critical'` over 45 days, `'Chase up'` 21–45 days, `'Fine'` under 21). Only show ones where the role's closing date has already passed or is unknown. Sort most urgent first.

**B6 — The gap report**
Produce one result set listing every "gap" in the platform, with two columns: `gap_type` and `detail`. It should include: companies with no roles, roles with no applications, students with no applications, and roles with no closing date. Use set operators to stack the four queries into one result.

---

## Hints

<details>
<summary>Click to expand (try each task cold first)</summary>

- **13** — you need a date-add function against a column, not a literal. `DATE_ADD`/`DATEADD`/`+ INTERVAL` depending on dialect.
- **41** — find the position of `'@'`, then take a substring from there.
- **46** — concatenating a NULL usually makes the whole string NULL. Wrap the salary in your NULL-replacement function *and* cast it to text.
- **59** — `DATEDIFF` behaves differently across dialects (argument order in SQL Server, two-arg in MySQL, plain subtraction in Postgres). Check yours.
- **64 / 91** — group by year *and* month, or by a formatted year-month string. Grouping by month alone will merge Dec 2025 into Dec of any other year.
- **72** — the function is `NULLIF`.
- **74** — comparisons with NULL are neither true nor false; you need `OR salary IS NULL`.
- **81 / 95** — `SUM(CASE WHEN ... THEN 1 ELSE 0 END)` is the pattern. `COUNT(CASE WHEN ... THEN 1 END)` also works since COUNT ignores NULLs.
- **102** — LEFT JOIN from roles, then `COUNT(applications.application_id)`, not `COUNT(*)`. Think about why.
- **108** — you need a three-table chain with LEFT JOINs and a `HAVING COUNT(...) = 0`.
- **111** — the trick to killing mirror pairs is `s1.student_id < s2.student_id`.
- **113** — `UNION` of a LEFT JOIN and a RIGHT JOIN.
- **121** — student emails have inconsistent casing; lowercase both sides before comparing.
- **123** — both branches of a set operator need matching column counts and compatible types. Add a literal string as your `type` column.
- **B1** — success rate needs a guard against dividing by zero. CASE around the division, or multiply by `1.0` and let the CASE handle the zero-application branch first.
- **B3** — "interview stage or beyond" means status IN ('interview','offer'). Decide whether 'rejected' applications that had interviews should count — pick an interpretation and be consistent.

</details>

---

## Checking yourself

You don't have an answer key, and that's deliberate — the skill you're building is *knowing whether your result looks right*. For each query, ask:

1. **Row count sanity** — did a JOIN silently multiply your rows? If a student with 3 applications suddenly appears 6 times, you've fanned out through a second table.
2. **NULL sanity** — did an INNER JOIN quietly drop the rows you cared about? Students 13 and 14 are your canaries.
3. **Aggregate sanity** — does `COUNT(*)` differ from `COUNT(column)`? If so, you have NULLs, and that's usually the interesting part.
4. **Spot check by hand** — pick one student, run a simple query to see their raw rows, then verify your aggregate matches.

If you want, send me any query you're unsure about and I'll review it — or ask for the solutions to a specific part once you've had a proper go.

## Part 0 — Setup

Run this whole script before starting. Read it — the schema is your map for everything that follows.

```sql
CREATE TABLE companies (
    company_id   INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    sector       VARCHAR(50),
    city         VARCHAR(50),
    headcount    INT,
    founded_date DATE
);

CREATE TABLE students (
    student_id  INT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(120),
    university  VARCHAR(100),
    course      VARCHAR(60),
    grad_year   INT,
    mentor_id   INT
);

CREATE TABLE roles (
    role_id      INT PRIMARY KEY,
    company_id   INT NOT NULL,
    title        VARCHAR(100) NOT NULL,
    salary       INT,
    location     VARCHAR(50),
    posted_date  DATE,
    closing_date DATE,
    is_remote    INT
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    student_id     INT NOT NULL,
    role_id        INT NOT NULL,
    applied_date   DATE,
    status         VARCHAR(20),
    response_date  DATE
);

CREATE TABLE interviews (
    interview_id     INT PRIMARY KEY,
    application_id   INT NOT NULL,
    round_number     INT,
    interview_date   DATE,
    score            INT,
    interviewer_name VARCHAR(80)
);

CREATE TABLE newsletter_signups (email VARCHAR(120));
CREATE TABLE alumni_network    (email VARCHAR(120));

INSERT INTO companies VALUES
(1,'Northwind Bank','Fintech','London',12000,'1998-04-12'),
(2,'Pixelforge','Gaming','Manchester',340,'2011-09-01'),
(3,'Medisync','HealthTech','Bristol',890,'2015-02-20'),
(4,'Cargo Loop','Logistics','Leeds',210,'2019-06-30'),
(5,'Quantel','Fintech','London',5400,'2004-11-15'),
(6,'Greenline Energy','Energy','Glasgow',1750,'2009-01-08'),
(7,'Bytewise','Consulting','Birmingham',95,'2021-03-17'),
(8,'Halcyon Labs','AI','Cambridge',60,'2022-08-05');

INSERT INTO students VALUES
(1,'Amira','Haddad','amira.haddad@uni.ac.uk','University of Leeds','Computer Science',2027,NULL),
(2,'  Tom','Whitfield ','TOM.WHITFIELD@uni.ac.uk','University of Manchester','Computer Science',2027,1),
(3,'Priya','Raman','Priya.Raman@UNI.AC.UK','Imperial College London','Software Engineering',2026,NULL),
(4,'Daniel','Okoro','daniel.okoro@uni.ac.uk','University of Bristol','Computer Science',2027,3),
(5,'Sofia','Marchetti','sofia.marchetti@uni.ac.uk','University of Glasgow','Data Science',2026,3),
(6,'Jack','Reilly',NULL,'University of Birmingham','Computer Science',2028,2),
(7,'Yusuf','Demir','yusuf.demir@uni.ac.uk','University of Leeds','Software Engineering',2027,1),
(8,'Hannah','Cole','hannah.cole@uni.ac.uk','Durham University','Computer Science',2026,NULL),
(9,'Wei','Zhang','wei.zhang@uni.ac.uk','University of Cambridge','Computer Science',2027,8),
(10,'Grace','Adeyemi','grace.adeyemi@uni.ac.uk','University of Manchester','Data Science',2027,2),
(11,'Oliver','Bennett','oliver.bennett@uni.ac.uk','University of Leeds','Computer Science',2028,1),
(12,'Zara','Malik','zara.malik@uni.ac.uk','Imperial College London','Computer Science',2026,3),
(13,'Callum','Fraser',NULL,'University of Glasgow','Software Engineering',2027,NULL),
(14,'Nadia','Petrova','nadia.petrova@uni.ac.uk','Durham University','Computer Science',2028,8);

INSERT INTO roles VALUES
(1,1,'Software Engineer Placement',32000,'London','2026-01-15','2026-03-01',0),
(2,1,'Data Engineer Placement',31000,'London','2026-01-20','2026-02-28',0),
(3,2,'Gameplay Programmer Intern',24000,'Manchester','2026-02-01','2026-04-15',0),
(4,2,'QA Automation Placement',NULL,'Manchester','2026-02-10',NULL,1),
(5,3,'Backend Developer Placement',28500,'Bristol','2026-01-05','2026-02-20',0),
(6,3,'Full Stack Placement',28500,'Remote','2026-03-02','2026-05-01',1),
(7,4,'Platform Engineer Intern',26000,'Leeds','2026-02-14','2026-04-30',0),
(8,4,'Data Analyst Placement',25000,'Leeds','2026-02-14',NULL,0),
(9,5,'Software Engineer Placement',35000,'London','2025-11-30','2026-01-31',0),
(10,5,'Quant Developer Placement',42000,'London','2025-12-05','2026-01-15',0),
(11,5,'Site Reliability Intern',NULL,'London','2026-03-10','2026-05-20',1),
(12,6,'Embedded Software Placement',27000,'Glasgow','2026-01-25','2026-03-25',0),
(13,6,'Cloud Engineer Placement',29000,'Remote','2026-02-05','2026-04-05',1),
(14,7,'Junior Developer Placement',23000,'Birmingham','2026-03-01','2026-04-20',0),
(15,7,'IT Support Placement',21000,'Birmingham','2026-03-01',NULL,0);

INSERT INTO applications VALUES
(1,1,1,'2026-01-18','offer','2026-03-10'),
(2,1,9,'2025-12-02','rejected','2026-01-05'),
(3,1,5,'2026-01-10','interview','2026-02-01'),
(4,2,3,'2026-02-03','offer','2026-04-01'),
(5,2,4,'2026-02-12','submitted',NULL),
(6,2,7,'2026-02-16','rejected','2026-03-02'),
(7,3,9,'2025-12-01','offer','2026-01-20'),
(8,3,10,'2025-12-06','interview','2026-01-10'),
(9,3,1,'2026-01-16','rejected','2026-02-14'),
(10,4,5,'2026-01-07','offer','2026-02-15'),
(11,4,6,'2026-03-04','screening',NULL),
(12,4,14,'2026-03-05','submitted',NULL),
(13,5,13,'2026-02-07','interview','2026-03-01'),
(14,5,12,'2026-01-28','rejected','2026-02-20'),
(15,5,8,'2026-02-18','withdrawn','2026-02-25'),
(16,6,14,'2026-03-02','submitted',NULL),
(17,6,15,'2026-03-03','rejected','2026-03-18'),
(18,7,1,'2026-01-19','interview','2026-02-10'),
(19,7,2,'2026-01-22','rejected','2026-02-12'),
(20,7,7,'2026-02-15','offer','2026-04-02'),
(21,8,9,'2025-12-03','rejected','2026-01-08'),
(22,8,10,'2025-12-07','rejected','2026-01-12'),
(23,8,11,'2026-03-12','submitted',NULL),
(24,9,11,'2026-03-11','screening',NULL),
(25,9,1,'2026-01-17','rejected','2026-02-16'),
(26,10,2,'2026-01-21','interview','2026-02-11'),
(27,10,8,'2026-02-19','offer','2026-03-20'),
(28,11,3,'2026-02-05','rejected','2026-03-09'),
(29,11,15,'2026-03-04','submitted',NULL),
(30,12,10,'2025-12-08','offer','2026-01-14'),
(31,12,9,'2025-12-04','interview','2026-01-06'),
(32,12,13,'2026-02-09','withdrawn','2026-02-22');

INSERT INTO interviews VALUES
(1,1,1,'2026-02-05',78,'r. castillo'),
(2,1,2,'2026-02-26',85,'R. CASTILLO'),
(3,3,1,'2026-02-09',66,'meera shah'),
(4,4,1,'2026-03-02',81,'Liam Fox'),
(5,4,2,'2026-03-24',90,'liam fox'),
(6,7,1,'2025-12-18',72,'D. Okafor'),
(7,7,2,'2026-01-06',88,'d. okafor'),
(8,7,3,'2026-01-17',91,'S. Lindqvist'),
(9,8,1,'2026-01-04',59,'S. Lindqvist'),
(10,10,1,'2026-01-29',75,'Meera Shah'),
(11,10,2,'2026-02-11',80,'MEERA SHAH'),
(12,13,1,'2026-02-24',NULL,'K. Bauer'),
(13,18,1,'2026-02-04',64,'R. Castillo'),
(14,20,1,'2026-03-11',83,'K. Bauer'),
(15,20,2,'2026-03-27',87,'k. bauer'),
(16,26,1,'2026-02-06',70,'Liam Fox'),
(17,27,1,'2026-03-06',77,'D. Okafor'),
(18,27,2,'2026-03-17',82,'D. OKAFOR'),
(19,30,1,'2025-12-20',68,'S. Lindqvist'),
(20,30,2,'2026-01-05',74,'Meera Shah'),
(21,30,3,'2026-01-12',79,'Liam Fox'),
(22,31,1,'2025-12-19',61,'K. Bauer');

INSERT INTO newsletter_signups VALUES
('amira.haddad@uni.ac.uk'),('daniel.okoro@uni.ac.uk'),('wei.zhang@uni.ac.uk'),
('grace.adeyemi@uni.ac.uk'),('freya.nolan@uni.ac.uk'),('sam.begum@uni.ac.uk');

INSERT INTO alumni_network VALUES
('daniel.okoro@uni.ac.uk'),('wei.zhang@uni.ac.uk'),('hannah.cole@uni.ac.uk'),
('zara.malik@uni.ac.uk'),('freya.nolan@uni.ac.uk');
```

---

