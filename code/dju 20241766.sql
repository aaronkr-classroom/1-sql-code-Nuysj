 --새로운 실습 DB 생성
 CREATE DATABASE univdb25;

 -- 학생 테이블생성
 CREATE TABLE 학생(
	학번 CHAR(4) NOT NULL, --s001
	이름 VARCHAR(20) NOT NULL,
	주소 VARCHAR(50) NULL DEFAULT '미정',
	학년 INT NOT NULL,
	나이 INT NULL,
	성별 CHAR(1) NOT NULL,
	휴대폰번호 CHAR(14) NULL, --0101-5555-5555
	소속학과 VARCHAR(20) NULL,
	PRIMARY KEY (학번) 
 );

 -- 과목 테이블 생성
 CREATE TABLE 과목(
 	과목번호 CHAR(4) NOT NULL PRIMARY KEY,
	이름 VARCHAR(20) NOT NULL,
	강의실 CHAR(3) NOT NULL,
	개설학과 VARCHAR(20) NOT NULL,
	시수 INT NOT NULL 
 );

 -- 수강 테이블 생성
CREATE TABLE 수강(
	학번 CHAR(6) NOT NULL,
	과목번호 CHAR(4) NOT NULL,
	신청날짜 DATE NOT NULL, --2025.04.01
	중간성적 INT NULL DEFAULT 0,
	기말성적 INT NULL DEFAULT 0,
	평가학점 CHAR(1) NULL,
	PRIMARY KEY( 학번, 과목번호) --s001
 );

 -- 학생 테이블입력
 INSERT INTO 학생
 VALUES 
	('s001', '김연아', '서울 서초', 4, 23, '여', '010-1111-2222', '컴퓨터'),
	('s002', '홍길동', DEFAULT, 1, 26, '남', NULL, '통계'),
	('s003', '이승엽', NULL, 3, 30, '남', NULL, '정보통신'),
	('s004', '이영애', '경기 분당', 2, NULL, '여', '010-4444-5555', '정보통신'),
	('s005', '송윤아', '경기 분당', 4, 23, '여', '010-6666-7777', '컴퓨터'),
	('s006', '홍길동', '서울 종로', 2, 26, '남', '010-8888-9999', '컴퓨터'),
	('s007', '이온진', '경기 과천', 1, 23, '여', '010-2222-3333', '경영');

TABLE 학생; --	postgrares

 -- 괴목 테이블 입력
 INSERT INTO 과목
 VALUES
	('c001', '데이터베이스', '126', '컴퓨터', 3),
	('c002', '정보보호', '137', '정보통신', 3),
	('c003', '모바일웹', '128', '컴퓨터', 3),
	('c004', '철학개론', '117', '철학', 2),
	('c005', '전공글쓰기', '120', '교양학부', 1);

	SELECT * FROM 과목; --표준 sqL

 -- 수강 테이블 입력
 INSERT INTO 수강
 VALUES 
	('s001', 'c002', '2019-09-03', 93, 98, 'A'),
	('s004', 'c005', '2019-03-03', 72, 78, 'C'),
	('s003', 'c002', '2017-09-06', 85, 82, 'B'),
	('s002', 'c001', '2018-03-10', 31, 50, 'F'),
	('s001', 'c004', '2019-03-05', 82, 89, 'B'),
	('s004', 'c003', '2020-09-03', 91, 94, 'A'),
	('s001', 'c005', '2020-09-03', 74, 79, 'C'),
	('s003', 'c001', '2019-03-03', 81, 82, 'B'),
	('s004', 'c002', '2018-03-05', 92, 95, 'A');

 -- DESCRTBE TABLE 수강;

	SELECT 이름, 주소 FROM 학생;
	SELECT ALL 소속학과 FROM 학생;
	SELECT DISTINCT 소속학과 FROM 학생;
	SELECT DISTINCT 소속학과 FROM 학생; --중복 값 제거

	SELECT 이름, 학년, 소속학과, 휴대폰번호 FROM 학생
	WHERE 학년 >= 2 AND 소속학과 = '컴퓨터';

	SELECT 이름, 학년, 소속학과, 휴대폰번호 FROM 학생
	WHERE (학년 >= 1 AND 학년 <=3) OR NOT (소속학과 = '컴퓨터'); -- BETWEEN 1 AND 3도 괜찮

	SELECT 이름, 학년, 소속학과 FROM 학생
	WHERE 소속학과 = '컴퓨터' OR 소속학과 = '정보통신'
	ORDER BY 학년 ASC; -- WHERE 소속학과 = '컴퓨터' OR '정보통신' (x)

	SELECT * FROM 학생
	ORDER BY 학년 ASC, 이름 DESC; -- 학년(오름차순), 이름(내림차순)

	SELECT * FROM 수강
	ORDER BY 중간성적 DESC
	LIMIT 3; --LIMIT 5, 3은 MY SQL에서만

	SELECT COUNT(*) AS 학생수,
		COUNT(주소) AS 주소수,
		COUNT (DISTINCT 주소) AS 중복되지않은주소 FROM 학생;

	SELECT AVG(나이) AS 남학생평균나이 FROM 학생 WHERE 성별 = '남';

	SELECT 성별, MAX(나이) AS 최고나이, MIN(나이) AS 최저나이;
	FROM  학생 GROUP BY 성별;

	SELECT 학번, 이름 FROM 학생
	WHERE 이름 LIKE '이__'

	SELECT 이름, 주소, 학년 FROM 학생
	WHERE 주소 LIKE '%서울%'
	ORDER BY 학년 DESC;

	SELECT 이름, 휴대폰번호 FROM 학생
	WHERE 휴대폰번호 IS NULL;

	SELECT 학번 FROM 학생 WHERE 성별 = '여'
	UNION
	SELECT 학번 FROM 수강 WHERE 평가학점 = 'A'

	SELECT  이름 FROM 학생 WHERE 학번 IN (
		SELECT 학번 FROM 수강 WHERE 과목번호 = (
			SELECT 과목번호 FROM 과목 WHERE 이름 = '정보보호'
		)
	); --'정보보호'과목을 수강한 학생의 이름을 검색

	SELECT 이름 FROM 학생 WHERE EXISTS (
		SELECT * FROM 수강
		WHERE 수강. 학번 = 학생. 학번 AND 과목번호 = 'c002'
	); -- 과목번호가 'c002'인 과목을 수강하 학생 이름을 검색

		--join
	SELECT * FROM 학생 CROSS JOIN 수강;

	SELECT * FROM 학생 JOIN 수강 ON 학생. 학번 = 수강. 학번; --동등조인

	SELECT S1.이름, S2.이름
	FROM 학생 AS S1 JOIN 학생 AS S2 ON S1. 주소 = S2. 주소
	WHERE S1. 학년 > S2. 학년; --셀프 조인

	SELECT 학생. 학번, 이름, 평가학점 -- 왼쪽 외부 조인
	FROM 학생 LEFT OUTER JOIN 수강 ON 학생.학번 = 수강. 학번;

	SELECT 학생. 학번, 이름, 평가학점 -- 오른쪽 외부 조인
	FROM 학생 RIGHT OUTER JOIN 수강 ON 학생.학번 = 수강. 학번;

	SELECT 학생. 학번, 이름, 평가학점 -- 전체 외부 조인
	FROM 학생 FULL OUTER JOIN 수강 ON 학생.학번 = 수강. 학번;

	--CRUD
	--INSERT 위에 해서 다시 암함
	UPDATE 학생 SET 학년 = 3 WHERE 이름 = '이온진';
	SELECT * FROM 학생;

	UPDATE 학생 SET 학년 = 3 WHERE 이름 = '이은진' WHERE 이름 = '이온진';
	UPDATE 학생 SET 학년 = 3 WHERE 이름 ='이온진'
	SELECT * FROM 학생;

	UPDATE 학생
	SET 학년 = 학년 + 1, 소속학과 = '자유전공학부'
	WHERE 학년 = 4;
	SELECT * FROM 학생;

	DELETE FROM 학생 WHERE 이름 = '송윤아';
	SELECT * FROM 학생;

	