-- Seed Data for University Management System

USE University_Management_System;
go
INSERT INTO Departments (DepartmentName, DepartmentHead) VALUES
('Computer Science', 'Dr. Ahmed Hassan'),
('Business Administration', 'Dr. Fatima Ibrahim'),
('Engineering', 'Dr. Karim Mansour'),
('Arts & Humanities', 'Dr. Layla Noor');

INSERT INTO Professors (ProfessorName, Email, Phone, DepartmentID) VALUES
('Dr. Ahmed Hassan', 'ahmed.hassan@university.edu', '9876543210', 1000),
('Dr. Mona Khalil', 'mona.khalil@university.edu', '9876543211', 1000),
('Dr. Omar Saleh', 'omar.saleh@university.edu', '9876543212', 1000),
('Dr. Fatima Ibrahim', 'fatima.ibrahim@university.edu', '9876543213', 1001),
('Dr. Hani Aziz', 'hani.aziz@university.edu', '9876543214', 1001),
('Dr. Karim Mansour', 'karim.mansour@university.edu', '9876543215', 1002),
('Dr. Leila Sarhan', 'leila.sarhan@university.edu', '9876543216', 1002),
('Dr. Layla Noor', 'layla.noor@university.edu', '9876543217', 1003);

INSERT INTO Students (StudentName, Email, Phone, DepartmentID, EnrollmentYear) VALUES
('Ali Mohamed', 'ali.mohamed@student.university.edu', '5551234567', 1000, 2023),
('Noor Khalifa', 'noor.khalifa@student.university.edu', '5551234568', 1000, 2023),
('Amira Hassan', 'amira.hassan@student.university.edu', '5551234569', 1000, 2022),
('Zain Ahmed', 'zain.ahmed@student.university.edu', '5551234570', 1000, 2022),
('Sara Ibrahim', 'sara.ibrahim@student.university.edu', '5551234571', 1001, 2023),
('Yousef Karim', 'yousef.karim@student.university.edu', '5551234572', 1001, 2023),
('Hana Rashid', 'hana.rashid@student.university.edu', '5551234573', 1001, 2022),
('Karim Fahmy', 'karim.fahmy@student.university.edu', '5551234574', 1002, 2023),
('Dina Samir', 'dina.samir@student.university.edu', '5551234575', 1002, 2022),
('Rami Nasser', 'rami.nasser@student.university.edu', '5551234576', 1002, 2022),
('Mona Amin', 'mona.amin@student.university.edu', '5551234577', 1003, 2023),
('Tariq Sayed', 'tariq.sayed@student.university.edu', '5551234578', 1003, 2023),
('Layla Farah', 'layla.farah@student.university.edu', '5551234579', 1003, 2022);

INSERT INTO Courses (CourseName, CourseCode, Credits, DepartmentID) VALUES
('Introduction to Programming', 'CS101', 3, 1000),
('Data Structures', 'CS102', 3, 1000),
('Database Design', 'CS103', 4, 1000),
('Web Development', 'CS104', 3, 1000),
('Algorithms', 'CS105', 3, 1000),
('Financial Accounting', 'BUS101', 3, 1001),
('Business Management', 'BUS102', 3, 1001),
('Marketing Principles', 'BUS103', 3, 1001),
('Circuit Analysis', 'ENG101', 4, 1002),
('Thermodynamics', 'ENG102', 4, 1002),
('Literature Basics', 'ART101', 3, 1003),
('World History', 'ART102', 3, 1003);

INSERT INTO Prerequisites (CourseID, PrerequisiteCourseID) VALUES
(1001, 1000),  -- Data Structures requires Introduction to Programming
(1002, 1001),  -- Database Design requires Data Structures
(1004, 1000),  -- Web Development requires Introduction to Programming
(1004, 1001),  -- Web Development also requires Data Structures
(1005, 1001);  -- Algorithms requires Data Structures

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1000, 1000, '2023-09-01', 85),
(1000, 1001, '2023-09-01', 88),
(1000, 1004, '2023-09-01', 82),
(1001, 1000, '2023-09-01', 90),
(1001, 1001, '2023-09-01', 87),
(1002, 1000, '2022-09-01', 78),
(1002, 1001, '2022-09-01', 81),
(1002, 1005, '2022-09-01', 79),
(1003, 1001, '2022-09-01', 92),
(1003, 1005, '2022-09-01', 89),
(1004, 1005, '2023-09-01', 84),
(1005, 1006, '2023-09-01', 88),
(1006, 1006, '2023-09-01', 91),
(1007, 1008, '2023-09-01', 85),
(1008, 1009, '2022-09-01', 79),
(1009, 1008, '2022-09-01', 83),
(1010, 1010, '2023-09-01', 86),
(1011, 1010, '2023-09-01', 90),
(1012, 1011, '2022-09-01', 88);

INSERT INTO CourseSchedule (CourseID, ProfessorID, Semester, Room, DayOfWeek, Time) VALUES
(1000, 1000, 1, 'A101', 'Monday', '09:00:00'),
(1000, 1000, 1, 'A101', 'Wednesday', '09:00:00'),
(1001, 1001, 2, 'A102', 'Tuesday', '10:30:00'),
(1001, 1001, 2, 'A102', 'Thursday', '10:30:00'),
(1002, 1001, 3, 'A103', 'Monday', '14:00:00'),
(1002, 1001, 3, 'A103', 'Wednesday', '14:00:00'),
(1004, 1002, 2, 'A104', 'Tuesday', '11:00:00'),
(1004, 1002, 2, 'A104', 'Friday', '11:00:00'),
(1005, 1000, 4, 'A105', 'Monday', '15:30:00'),
(1005, 1000, 4, 'A105', 'Thursday', '15:30:00'),
(1006, 1003, 1, 'B101', 'Tuesday', '09:00:00'),
(1006, 1003, 1, 'B101', 'Thursday', '09:00:00'),
(1007, 1004, 2, 'B102', 'Monday', '10:00:00'),
(1007, 1004, 2, 'B102', 'Wednesday', '10:00:00'),
(1008, 1005, 1, 'C101', 'Tuesday', '13:00:00'),
(1008, 1005, 1, 'C101', 'Friday', '13:00:00'),
(1009, 1006, 2, 'C102', 'Monday', '09:30:00'),
(1009, 1006, 2, 'C102', 'Thursday', '09:30:00'),
(1010, 1007, 1, 'D101', 'Wednesday', '14:00:00'),
(1010, 1007, 1, 'D101', 'Friday', '14:00:00'),
(1011, 1007, 1, 'D102', 'Tuesday', '15:00:00'),
(1011, 1007, 1, 'D102', 'Thursday', '15:00:00');