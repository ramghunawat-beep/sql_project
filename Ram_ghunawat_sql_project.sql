CREATE DATABASE student;
USE student;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration VARCHAR(20)
);

CREATE TABLE Marks (
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Attendance (
    student_id INT,
    attendance_percentage FLOAT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students VALUES
(1,'Ram',27,'BCA','Pune'),
(2,'Shyam',24,'BBA','Mumbai'),
(3,'govinda',29,'BA','Delhi'),
(4,'sanskar',22,'BSc','Nagpur'),
(5,'yugh',21,'BCom','Aurangabad'),
(6,'amit',27,'BCA','Pune'),
(7,'bhagat',24,'BBA','Mumbai'),
(8,'neha',29,'BCA','Delhi'),
(9,'madhav',22,'BSc','Nagpur'),
(10,'jammel',21,'BCom','Pune'),
(11,'sagar',27,'BCA','Aurangabad'),
(12,'vijay',24,'BA','Mumbai'),
(13,'riya',29,'BCA','Delhi'),
(14,'nidi',22,'BSc','Nagpur'),
(15,'gauri',21,'BA','Pune'),
(16,'pravin',27,'BCA','Aurangabad'),
(17,'saurav',24,'BBA','Mumbai'),
(18,'harshda',29,'BA','Delhi'),
(19,'poonam',22,'BSc','Nagpur'),
(20,'priyanka',21,'BCom','Aurangabad'),
(21,'prasan',24,'BBA','Mumbai'),
(22,'akshra',24,'BBA','Mumbai'),
(23,'shardha',29,'BCA','Delhi'),
(24,'sargam',22,'BSc','Nagpur'),
(25,'ananya',21,'BA','Aurangabad'),
(26,'kajal',27,'BCA','Pune'),
(27,'salman',24,'BA','Mumbai'),
(28,'veer',29,'BCA','Delhi'),
(29,'pawan',22,'BSc','Nagpur'),
(30,'swapnil',21,'BCom','Pune'),
(31,'pratik',22,'BSc','Nagpur'),
(32,'moiz',21,'BCom','Aurangabad'),
(33,'balu',27,'BA','Pune'),
(34,'rohan',24,'BBA','Mumbai'),
(35,'sita',29,'BCA','Delhi'),
(36,'geeta',22,'BSc','Nagpur'),
(37,'palak',21,'BA','Pune'),
(38,'ashvini',27,'BCA','Aurangabad'),
(39,'raj',24,'BBA','Mumbai'),
(40,'sushil',29,'BCA','Delhi');


INSERT INTO Courses VALUES
(101,'BCA','3 Years'),
(102,'BBA','3 Years'),
(103,'BSc','3 Years'),
(104,'BCom','3 Years'),
(105,'BCA','3 Years'),
(106,'BBA','3 Years'),
(107,'BSc','3 Years'),
(108,'BCom','3 Years'),
(109,'BCA','3 Years'),
(110,'BBA','3 Years'),
(111,'BSc','3 Years'),
(112,'BCom','3 Years'),
(113,'BCA','3 Years'),
(114,'BBA','3 Years'),
(115,'BCA','3 Years'),
(116,'BCA','3 Years'),
(117,'BCA','3 Years'),
(118,'BCA','3 Years'),
(119,'BCA','3 Years'),
(120,'BCA','3 Years'),
(121,'BCA','3 Years'),
(122,'BCA','3 Years'),
(123,'BCA','3 Years'),
(124,'BCA','3 Years'),
(125,'BCA','3 Years'),
(126,'BCA','3 Years'),
(127,'BCA','3 Years'),
(128,'BCA','3 Years'),
(129,'BCA','3 Years'),
(130,'BCA','3 Years');

INSERT INTO Marks VALUES
(1,101,85),
(2,102,78),
(3,103,86),
(4,104,70),
(5,105,88),
(6,106,50),
(7,107,60),
(8,108,68),
(9,109,65),
(10,110,72),
(11,111,55),
(12,112,69),
(13,113,79),
(14,114,66),
(15,115,85),
(16,116,88),
(17,117,81),
(18,118,52),
(19,119,64),
(20,120,63),
(21,121,63),
(22,122,67),
(23,123,53),
(24,124,99),
(25,125,98),
(26,126,84),
(27,127,84),
(28,128,59),
(29,129,94),
(30,130,93);


INSERT INTO Attendance VALUES
(1,90),
(2,60),
(3,85),
(4,72),
(5,95),
(6,61),
(7,66),
(8,86),
(9,75),
(10,65),
(11,40),
(12,60),
(13,95),
(14,62),
(15,96),
(16,95),
(17,66),
(18,58),
(19,76),
(20,78),
(21,89),
(22,69),
(23,96),
(24,93),
(25,99),
(26,97),
(27,66),
(28,85),
(29,77),
(30,96);

SELECT * FROM Students;

SELECT * FROM Students WHERE city='Mumbai';

SELECT * FROM Marks ORDER BY marks DESC;


SELECT course, COUNT(*) 
FROM Students 
GROUP BY course;

SELECT student_id, AVG(marks) as avg_marks
FROM Marks
GROUP BY student_id
HAVING avg_marks > 80;


SELECT s.name, c.course_name, m.marks
FROM Students s
INNER JOIN Marks m ON s.student_id = m.student_id
INNER JOIN Courses c ON m.course_id = c.course_id;


CREATE VIEW student_performance AS
SELECT s.name, AVG(m.marks) as avg_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;


DELIMITER //

CREATE PROCEDURE TopStudents()
BEGIN
    SELECT s.name, m.marks
    FROM Students s
    JOIN Marks m ON s.student_id = m.student_id
    ORDER BY m.marks DESC
    LIMIT 30;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER check_marks
BEFORE INSERT ON Marks
FOR EACH ROW
BEGIN
    IF NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot exceed 100';
    END IF;
END //

DELIMITER ;


