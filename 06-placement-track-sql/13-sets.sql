-- 116. Return every email that appears in newsletter_signups or alumni_network, with no duplicates --
SELECT email
FROM newsletter_signups
UNION
SELECT email
FROM alumni_network;

-- 117. Same, but keep duplicates --
SELECT email
FROM newsletter_signups
UNION ALL
SELECT email
FROM alumni_network;

-- 118. Return emails that appear in **both** lists --
SELECT email
FROM newsletter_signups
INTERSECT
SELECT email
FROM alumni_network;

-- 119. Return emails in newsletter_signups that are **not** in alumni_network --
SELECT email
FROM newsletter_signups
EXCEPT
SELECT email
FROM alumni_network;

-- 120. Return emails in alumni_network that are **not** in newsletter_signups --
SELECT email
FROM alumni_network
EXCEPT
SELECT email
FROM newsletter_signups;

-- 121. Return emails in either list that don't correspond to any student in the students table. (Watch casing on student emails) --
SELECT email
FROM newsletter_signups
UNION
SELECT email
FROM alumni_network
EXCEPT
SELECT LOWER(email)
FROM students;

-- 122. Build a single unified "contact list": all student emails plus all newsletter emails plus all alumni emails, no duplicates, sorted alphabetically --
SELECT email
FROM newsletter_signups
UNION
SELECT email
FROM alumni_network
UNION
SELECT LOWER(email)
FROM students
WHERE email IS NOT NULL
ORDER BY email ASC;

-- 123. Return all London-based *roles* and all London-based *companies* in one two-column result (name, type), where type says whether the row is a role or a company --
SELECT title AS name, 'role' AS type
FROM roles
WHERE location = 'London'
UNION ALL
SELECT company_name, 'company' AS type
FROM companies
WHERE city = 'London';
