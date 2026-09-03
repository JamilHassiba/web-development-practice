-- 1. Add a source column to applications --
ALTER TABLE applications 
ADD COLUMN source VARCHAR(25);

-- 2. Change roles.salary to a decimal type with 2 decimal places --
ALTER TABLE roles ALTER salary TYPE NUMERIC(10, 2);

-- 3. Add a last_updated date column to students --
ALTER TABLE students ADD COLUMN last_updated DATE;

-- 4. Create new table saved_roles with columns: saved_id (primary key), student_id, role_id, saved_date (not null), notes --
CREATE TABLE saved_roles (
    saved_id INTEGER PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    role_id INTEGER REFERENCES roles(role_id),
    saved_date DATE NOT NULL,
    notes TEXT
);

-- 5. Drop students.last_updated --
ALTER TABLE students DROP COLUMN last_updated;

-- 6. Rename the newsletter_signups table to marketing_signups --
ALTER TABLE newsletter_signups RENAME TO marketing_signups;
