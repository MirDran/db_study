--1. 테이블 T_PERSON_INFO

CREATE TABLE T_PERSON_INFO
(
    stno NUMBER(8) PRIMARY KEY,
    name VARCHAR2(10),
    age NUMBER(3),
    HAC VARCHAR2(20)
);

INSERT INTO T_PERSON_INFO
VALUES (20210034, '이상형', 21, '법학과');

INSERT INTO T_PERSON_INFO
VALUES (20220011, '김건우', 24, '물리학과');

INSERT INTO T_PERSON_INFO
VALUES (20240109, '전지훈', 20, '컴퓨터공학과');

INSERT INTO T_PERSON_INFO
VALUES (20230002, '강순구', 21, '건축학과');

DROP TABLE T_PERSON_INFO;
SELECT * FROM T_PERSON_INFO;

--2. 테이블 : board_list

CREATE TABLE board_list
(
    board_list_id  NUMBER(5) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(2000),
    writer VARCHAR(40) NOT NULL,
    create_time NUMBER(13) NOT NULL
);


-- 3번

SELECT * FROM emp;
SELECT * FROM dept;


SELECT 
    e.empno no, 
    e.ename name, 
    e.sal salary,
    d.dname d_name,
    d.loc location
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.sal <2000
ORDER BY SAL DESC;

-- 4번

-- 4-1) COMMIT
-- 4-2) ROLLBACK

-- 5번

--5-1) orcl
--5-2) 192.168.0.108
--5-3) 1521
--5-4) scott   
--5-5) tiger
