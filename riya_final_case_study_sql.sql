 create database blood_donation;
 use blood_donation;
 CREATE TABLE Donors (
    donor_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    blood_group VARCHAR(10),
    registration_date DATE
);
desc Donors;
CREATE TABLE BloodDonations (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    donation_date DATE,
    blood_group VARCHAR(10),
    quantity FLOAT,
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);
desc BloodDonations;
CREATE TABLE Recipients (
    recipient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    blood_group VARCHAR(10),
    required_quantity FLOAT,
    request_date DATE
);
desc Recipients;

INSERT INTO Donors (donor_id, name, age, blood_group, registration_date) VALUES
(1, 'John Doe', 30, 'A+', '2024-01-15'),
(2, 'Jane Smith', 25, 'B+', '2024-02-20'),
(3, 'Emily Davis', 35, 'O-', '2024-03-10'),
(4, 'Michael Brown', 28, 'AB+', '2024-04-12'),
(5, 'Sarah Wilson', 32, 'A-', '2024-05-18'),
(6, 'David Johnson', 40, 'B-', '2024-06-22'),
(7, 'Laura White', 29, 'O+', '2024-07-30'),
(8, 'James Taylor', 45, 'AB-', '2024-08-05'),
(9, 'Linda Martinez', 38, 'A+', '2024-09-14'),
(10, 'Robert Lee', 50, 'B+', '2024-10-20');

insert into Donors values (11, 'Alice Brown', 27, 'A+', '2024-11-01'),
(12, 'Bob Green', 34, 'B+', '2024-11-15'),
(13, 'Charlie Black', 29, 'O-', '2024-12-01'),
(14, 'Diana White', 31, 'AB+', '2024-12-10'),
(15, 'Ethan Blue', 36, 'A-', '2024-12-20');

select * from Donors;

INSERT INTO BloodDonations (donation_id, donor_id, donation_date, blood_group, quantity) VALUES
(1, 1, '2024-01-20', 'A+', 0.5),
(2, 2, '2024-02-25', 'B+', 0.5),
(3, 3, '2024-03-15', 'O-', 0.5),
(4, 4, '2024-04-18', 'AB+', 0.5),
(5, 5, '2024-05-25', 'A-', 0.5),
(6, 6, '2024-06-30', 'B-', 0.5),
(7, 7, '2024-07-10', 'O+', 0.5),
(8, 8, '2024-08-15', 'AB-', 0.5),
(9, 9, '2024-09-20', 'A+', 0.5),
(10, 10, '2024-10-25', 'B+', 0.5);

insert into BloodDonations values (11, 11, '2024-11-05', 'A+', 0.5),
(12, 12, '2024-11-20', 'B+', 0.5),
(13, 13, '2024-12-05', 'O-', 0.5),
(14, 14, '2024-12-15', 'AB+', 0.5),
(15, 15, '2024-12-25', 'A-', 0.5);

select * from BloodDonations;


INSERT INTO Recipients (recipient_id, name, age, blood_group, required_quantity, request_date) VALUES
(1, 'Alice Brown', 40, 'A+', 0.5, '2024-04-01'),
(2, 'Bob Johnson', 50, 'B+', 0.5, '2024-04-05'),
(3, 'Charlie Green', 60, 'O-', 0.5, '2024-05-10'),
(4, 'Diana King', 35, 'AB+', 0.5, '2024-06-15'),
(5, 'Ethan Scott', 45, 'A-', 0.5, '2024-07-20'),
(6, 'Fiona Adams', 55, 'B-', 0.5, '2024-08-25'),
(7, 'George Clark', 65, 'O+', 0.5, '2024-09-30'),
(8, 'Hannah Lewis', 70, 'AB-', 0.5, '2024-10-05'),
(9, 'Ivy Walker', 75, 'A+', 0.5, '2024-11-10'),
(10, 'Jack Hall', 80, 'B+', 0.5, '2024-12-15');

insert into Recipients values(11, 'Karen Young', 55, 'A+', 0.5, '2024-11-20'),
(12, 'Larry King', 60, 'B+', 0.5, '2024-12-01'),
(13, 'Mona Lisa', 65, 'O-', 0.5, '2024-12-10'),
(14, 'Nina Brown', 70, 'AB+', 0.5, '2024-12-20'),
(15, 'Oscar Wilde', 75, 'A-', 0.5, '2024-12-30');

select * from Recipients;

-- 50 Question on there 
-- Donors Table:
-- 1 . List all donors 
SELECT * FROM Donors;

-- 2 . Find donors of a specific blood group
SELECT * FROM Donors WHERE blood_group = 'A+';

-- 3 . Count the number of donors by blood group
SELECT blood_group, COUNT(*) AS donor_count FROM Donors GROUP BY blood_group;

-- 4 . Find donors registered after a specific date
SELECT * FROM Donors WHERE registration_date > '2023-01-01';

-- 5 . List donors by age range
SELECT * FROM Donors WHERE age BETWEEN 18 AND 30;

-- 6 . Find the youngest donor
SELECT * FROM Donors ORDER BY age ASC LIMIT 1;

-- 7 . Find the oldest donor
SELECT * FROM Donors ORDER BY age DESC LIMIT 1;

-- 8 . Count the number of male and female donors
SELECT registration_date, COUNT(*) AS count FROM Donors GROUP BY registration_date;

-- 9 . Find donors with a specific name
SELECT * FROM Donors WHERE name LIKE '%John%';

-- 10 . List donors sorted by registration date
SELECT * FROM Donors ORDER BY registration_date DESC;

-- BloodDonation Table :
-- 11 . List all blood donations
SELECT * FROM BloodDonations;

-- 12 . Find donations made by a specific donor
SELECT * FROM BloodDonations WHERE donor_id = 1;

-- 13 . Count the number of donations made by each donor
SELECT donor_id, COUNT(*) AS donation_count FROM BloodDonations GROUP BY donor_id;

-- 14 . Find the total quantity of blood donated by each donor
SELECT donor_id, SUM(quantity) AS total_donated FROM BloodDonations GROUP BY donor_id;

-- 15 . List donations made on a specific date
SELECT * FROM BloodDonations WHERE donation_date = '2023-05-01';

-- 16 . Find the largest single blood donation
SELECT * FROM BloodDonations ORDER BY quantity DESC LIMIT 1;

-- 17 . Find the total quantity of blood donated in a specific month
SELECT SUM(quantity) AS total_donated FROM BloodDonations WHERE MONTH(donation_date) = 5;

-- 18 . Count the number of donations made in each month
SELECT MONTH(donation_date) AS month, COUNT(*) AS donation_count 
FROM BloodDonations GROUP BY MONTH(donation_date);

-- 19 . Find the average quantity of blood donated per donation
SELECT AVG(quantity) AS average_quantity FROM BloodDonations;

-- 20 . List donations sorted by quantity
SELECT * FROM BloodDonations ORDER BY quantity DESC;

-- Recipients Table 
-- 21 . List all recipients
select * from Recipients;

-- 22 . Find recipients needing a specific blood group
SELECT * FROM Recipients WHERE blood_group = 'O-';

-- 23 . Count the number of recipients by blood group needed
SELECT blood_group, COUNT(*) AS recipient_count 
FROM Recipients GROUP BY blood_group;

-- 24 . Find recipients who need more than a specific quantity of blood
SELECT * FROM Recipients WHERE required_quantity > 2.0;

-- 25 . List recipients by age range
SELECT * FROM Recipients WHERE age BETWEEN 30 AND 50;

-- 26 . Find the youngest recipient
SELECT * FROM Recipients ORDER BY age ASC LIMIT 1;

-- 27 . Find the oldest recipient
SELECT * FROM Recipients ORDER BY age DESC LIMIT 1;

-- 28 . Count the number of request date recipients
SELECT request_date, COUNT(*) AS count FROM Recipients GROUP BY request_date;

-- 29 . Find recipients with a specific name 
SELECT * FROM Recipients WHERE name LIKE '%John%';

-- 30 .List recipients sorted by request date
SELECT * FROM Recipients ORDER BY request_date DESC;

-- Combined Queries

-- 31 . Find the total quantity of blood donated by each blood group
SELECT d.blood_group, SUM(bd.quantity) AS total_donated
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
GROUP BY d.blood_group;

-- 32 . List donors who have donated more than a specific quantity of blood
SELECT d.name, SUM(bd.quantity) AS total_donated
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
GROUP BY d.name
HAVING total_donated > 5.0;

-- 33 . Find the average age of donors who have donated blood
SELECT AVG(d.age) AS average_age
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id;

-- 34 . List recipients who need a specific blood group and the donors who can donate to them
SELECT r.name AS recipient_name, d.name AS donor_name
FROM Recipients as r
JOIN Donors d ON r.blood_group = d.blood_group;

-- 35 . Find the total quantity of blood needed by each blood group
SELECT blood_group, SUM(required_quantity) AS total_needed
FROM Recipients
GROUP BY blood_group;

-- 36 . List donors who have donated blood in the last month
SELECT d.name
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
WHERE bd.donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 37 . Find the total number of donations made by donors of a specific blood group
SELECT d.blood_group, COUNT(bd.donation_id) AS donation_count
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
WHERE d.blood_group = 'B+'
GROUP BY d.blood_group;

-- 38 . List recipients who have requested blood in the last week
SELECT * FROM Recipients WHERE request_date >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK);

-- 39 . Find the total quantity of blood donated by each donor in the last year
SELECT d.name, SUM(bd.quantity) AS total_donated
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
WHERE bd.donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY d.name;

-- 40 .List donors who have not donated blood in the last year
 SELECT d.name
FROM Donors d
LEFT JOIN BloodDonations bd ON d.donor_id = bd.donor_id AND bd.donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
WHERE bd.donation_id IS NULL;

-- 41 . Find the total quantity of blood needed by recipients in the last month
SELECT SUM(required_quantity) AS total_needed
FROM Recipients
WHERE request_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 42 . List donors who have donated more than once
SELECT d.name, COUNT(bd.donation_id) AS donation_count
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
GROUP BY d.name
HAVING donation_count > 1;

-- 43 . Find the average quantity of blood donated per donation in the last year
SELECT AVG(bd.quantity) AS average_quantity
FROM BloodDonations bd
WHERE bd.donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

/* 44 . List recipients who need more than a specific quantity of
 blood and the donors who can donate to them*/
 SELECT r.name AS recipient_name, d.name AS donor_name
FROM Recipients r
JOIN Donors d ON r.blood_group = d.blood_group
WHERE r.required_quantity > 2.0;

-- 45. Find the total number of recipients who have requested blood
SELECT COUNT(*) AS total_recipients FROM Recipients;

-- 46 . Find the donor with the highest total blood donation quantity
SELECT d.name, SUM(bd.quantity) AS total_donated
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
GROUP BY d.name
ORDER BY total_donated DESC
LIMIT 1;

-- 47 . List donors who have donated blood in the last month
SELECT d.name
FROM Donors d
JOIN BloodDonations bd ON d.donor_id = bd.donor_id
WHERE bd.donation_date >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);

-- 48 . Find the total number of blood donations made in the last year
SELECT COUNT(*) AS total_donations
FROM BloodDonations
WHERE donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 49 . Find the average blood quantity donated per month in the last year
SELECT MONTH(donation_date) AS month, AVG(quantity) AS avg_quantity
FROM BloodDonations
WHERE donation_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY month;

-- 50 . Find the recipient who needs the largest blood quantity
SELECT r.name, r.required_quantity
FROM Recipients r
ORDER BY r.required_quantity DESC
LIMIT 1;




























 























