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
