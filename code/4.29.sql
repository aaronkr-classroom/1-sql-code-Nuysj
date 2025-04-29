CREATE TABLE course(
	id CHAR(50) NOT NULL,
	 name VARCHAR(50) NOT NULL,
	 teacher_id char(50) NOT NULL
);
	
CREATE TABLE student(
	 student_id CHAR(50) NOT NULL,
	 frist_name VARCHAR(50) NOT NULL,
	 late_name VARCHAR(50) NOT NULL
);

CREATE TABLE student_course(
	 student_course CHAR(50) NOT NULL,
	 teacher_id char(50) NOT NULL
);

CREATE TABLE techer(
	 techer_id CHAR(50) NOT NULL,
	 frist_name VARCHAR(50) NOT NULL,
	 late_name VARCHAR(50) NOT NULL
);

INSERT INTO course
VALUES
	('1', 'Database design', '1'),
	('2', 'English literature', '2'),
	('3', 'Python programing', '3');

INSERT INTO student
VALUES
	('1', 'Shreya', 'Bain'),
	('2', 'Rianna', 'Foster'),
	('3', 'Yosef', 'Naylor');

INSERT INTO student_course
VALUES
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '2'),
	('2', '3'),
	('3', '1');

INSERT INTO techer
VALUES
	('1', 'Taylah', 'Booker'),
	('2', 'Sarah-Louise', 'Blake');

SELECT student.id
FROM student JOIN student_course ON ;
	