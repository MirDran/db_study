--ddl

CREATE TABLE new_table
(
    no  NUMBER(3), -- ()안에 3은 세자리 숫자
    nama VARCHAR2(10),
    birth DATE
);

SELECT * 
FROM new_table;

DESC new_table; -- 테이블 구조 보는 것 desc


CREATE TABLE professor2 -- 교수2 생성
AS
SELECT * FROM professor; -- 교수2로 교수의 모든것을 복사

SELECT *
FROM professor2
WHERE position = 'assistant professor';

UPDATE professor2
--SET bonus = 200 --200으로 저장
SET bonus = bonus + 200 -- 200을 인상
WHERE  position = 'assistant professor';


commit; -- 중간 세이브 포인트 느낌
rollback; -- 세이브 전 으로 가는 느낌

CREATE TABLE dept4
AS
SELECT dcode,area FROM dept2;

SELECT *
FROM dept4;

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

INSERT INTO dept4
VALUES (2000,'Cheonan');

UPDATE dept4
SET area = 'Asan'
WHERE dcode = 2000;

INSERT INTO dept4
VALUES (2001,'Asan Office','Asan', 'Y');

CREATE TABLE dept6
AS
SELECT * FROM dept4;

CREATE TABLE dept5
AS
SELECT * FROM dept4;

SELECT * FROM dept5;
SELECT * FROM dept6;


-- 테이블 삭제 (롤백 ROLLBACK 불가 / 자동 COMMIT 커밋
DROP TABLE dept5;

TRUNCATE TABLE dept5;
TRUNCATE TABLE dept6;

-- 데이터 삭제 DELETE / 롤백 ROLLBACK 가능 / 자동 COMMIT 커밋 X
SELECT * FROM dept4;

DELETE FROM dept4;
ROLLBACK;


SELECT *
--DELETE 
FROM dept4
WHERE temp_code = 'Y';
