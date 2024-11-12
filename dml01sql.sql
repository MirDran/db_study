--dml

-- 데이터 저장 INSERT
-- 데이터 수정 UPDATE
-- 데이터 삭제 DELETE
-- 데이터 병합 MERGE

-- INSERT INTO 테이블명 (컬럼명...)
-- VALUES (데이터 값...)

INSERT INTO new_table(no, nama, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table(no, nama, birth)
VALUES (2, '이름2', SYSDATE);

INSERT INTO new_table(no, nama, birth)
VALUES ('이름3', 3, SYSDATE);

INSERT INTO new_table(no, nama, birth)
VALUES ('이름4', 3, TO_DATE('2001-10-25'));

--컬럼명 생략
-- 전체컬럼에 저장하는 경우 + 순서
INSERT INTO new_table
VALUES (5, '이름5', SYSDATE);


INSERT ALL
INTO tt01 VALUES (7, '이름7',NULL)
INTO tt01 VALUES (8, '이름7',NULL)
INTO tt01 VALUES (9, '이름7',NULL)
INTO tt01 VALUES (10, '이름7',NULL)
SELECT * FROM dual;

SELECT * FROM tt01;

INSERT INTO tt01
SELECT deptno*2, loc, SYSDATE FROM dept;





