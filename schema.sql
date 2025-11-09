CREATE DATABASE University_Management_System;
GO
USE University_Management_System;
GO

CREATE TABLE Departments
(
	DepartmentID INT Identity(1000,1),   --PRIMARY KEY
	DepartmentName NVARCHAR(150) not null,
	DepartmentHead NVARCHAR(100) not null ,
	CONSTRAINT PK_DepartmentID PRIMARY KEY (DepartmentID)
)
GO
CREATE TABLE Professors
(
	ProfessorID INT IDENTITY(1000,1), --PRIMARY KEY
	ProfessorName NVARCHAR(100) not null , 
	Email NVARCHAR(150) not null, --check
	Phone NVARCHAR(15) not null, 
	DepartmentID INT not null, --FOREIGN KEY
	CONSTRAINT PK_ProfessorID PRIMARY KEY (ProfessorID),
	CONSTRAINT FK_Professors_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	CONSTRAINT CH_Professors_Email CHECK (Email like '%@%')
)
GO
CREATE TABLE Students 
(
	StudentID INT IDENTITY(1000,1),  --PRIMARY KEY
	StudentName NVARCHAR(100) not null , 
	Email NVARCHAR(150) not null ,  --check
	Phone NVARCHAR(15) not null , 
	DepartmentID INT not null , --FOREIGN KEY 
	EnrollmentYear INT DEFAULT(YEAR(GETDATE())), --CHECK
	CONSTRAINT PK_StudentID PRIMARY KEY(StudentID) ,
	CONSTRAINT FK_Students_DepartmentID FOREIGN KEY ( DepartmentID) REFERENCES Departments(DepartmentID),
	CONSTRAINT CH_Students_Email CHECK (Email like  '%@%') ,
	CONSTRAINT CH_Students_EnrollmentYear CHECK (EnrollmentYear<=YEAR(GETDATE()))
)
GO
CREATE TABLE Courses 
(
	CourseID INT IDENTITY(1000,1), --PRIMARY KEY
	CourseName NVARCHAR(100) not null UNIQUE, 
	CourseCode NVARCHAR(10) not null UNIQUE,
	Credits INT not null, 
	DepartmentID INT not null , --FOREIGN KEY 
	CONSTRAINT PK_CourseID PRIMARY KEY(CourseID) , 
	CONSTRAINT FK_Courses_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

)
GO
CREATE TABLE Prerequisites
( 
	CourseID INT not null, --FOREIGN KEY
	PrerequisiteCourseID INT not null, --FOREIGN KEY 
	CONSTRAINT FK_Prerequisites_CourseID FOREIGN KEY(CourseID) REFERENCES Courses(CourseID), 
	CONSTRAINT FK_Prerequisites_PrerequisiteCourseID FOREIGN KEY(PrerequisiteCourseID) REFERENCES Courses(CourseID),
	CONSTRAINT PK_Prerequisites PRIMARY KEY (CourseID,PrerequisiteCourseID)
)
GO
CREATE TABLE Enrollments 
(
	EnrollmentID INT IDENTITY(1000,1) , --PRIMARY KEY
	StudentID INT not null, --FOREIGN KEY
	CourseID INT not null, --FOREIGN KEY 
	EnrollmentDate DATE DEFAULT(GETDATE()), --CHECK
	Grade INT not null, --CHECK
	CONSTRAINT PK_EnrollmentID PRIMARY KEY (EnrollmentID), 
	CONSTRAINT FK_Enrollments_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
	CONSTRAINT FK_Enrollments_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), 
	CONSTRAINT CH_Enrollments_EnrollmentDate CHECK (EnrollmentDate <= GETDATE()),
	CONSTRAINT CH_Enrollments_Grade CHECK (Grade>=0 AND Grade <=100)
)
GO
CREATE TABLE CourseSchedule
(
	ScheduleID INT IDENTITY(1000,1) , --PRIMARY KEY
	CourseID INT not null, --FOREIGN KEY
	ProfessorID INT not null, --FOREIGN KEY 
	Semester INT not null, --CHECK
	Room NVARCHAR(10) not null, 
	DayOfWeek NVARCHAR(20) not null ,  --CHECK
	Time Time not null ,
	CONSTRAINT PK_ScheduleID PRIMARY KEY(ScheduleID) , 
	CONSTRAINT FK_CourseSchedule_CourseID FOREIGN KEY(CourseID) REFERENCES Courses(CourseID), 
	CONSTRAINT FK_CourseSchedule_ProfessorID FOREIGN KEY(ProfessorID) REFERENCES Professors(ProfessorID),
	CONSTRAINT CH_CourseSchedule_DayOfWeek CHECK (LOWER(DayOfWeek) in ('monday','tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday')),
	CONSTRAINT CH_CourseSchedule_Semester CHECK (Semester IN (1, 2, 3, 4, 5, 6, 7, 8))
)
GO