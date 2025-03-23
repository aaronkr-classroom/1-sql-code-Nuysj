CREATE TABLE 학원생(
    id bigserial, --bigserial은 PostgresSQL에서만 사용할 수 있는 자동 증가하는 숫자.
	학원생이름 varchar(25),
	폰번호 varchar(13),
	나이 int,
	학교이름 varchar(25),
	학년 int,
	반 int,
	반번호 int
);
SELECT * FROM  학원생;

INSERT INTO 학원생 (학원생이름, 폰번호, 나이, 학교이름, 학년, 반, 반번호)
VALUES ('홍길동', '010-1237-6542', 19, '송원고', 3, 1, 10),
       ('김하나', '010-3218-8765', 18, '한빛고', 2, 2, 7),
	   ('홍길동', '010-4587-9834', 19, '송원고', 3, 1, 31),
	   ('박순희', '010-7789-6754', 17, '이슬고', 1, 3,16);

CREATE TABLE 학교(
       id bigserial,
	   학교명 varchar(25),
	   분류 int,
	   학생수 numeric, --int는 약간 작은 정수이어서 number ic 타입 사용.
	   주소 varchar(100)
);

INSERT INTO 학교(학교명, 분류, 학생수, 주소)
VALUES ('송원고', 3, 435, '경기 성남 분당구 항새올로 123'),
       ('한빛고', 2, 377, '경기 성남 분당구 판교역로 67'),
	   ('이슬고', 1, 507, '경기 성남 분당구 미금로 567');

   SELECT * FROM 학교;
   TABLE 학교;


ALTER TABLE 학원생
ADD CONSTRAINT 폰번호_키 PRIMARY KEY (폰번호);

TABLE 학원생;

ALTER TABLE 학교
ADD CONSTRAINT 학교명_키 PRIMARY KEY (학교명);

TABLE 학교;
