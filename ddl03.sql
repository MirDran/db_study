-- DDL03
 
-- 외래키 참조하는 테이블(부모) 에 존재하는 값만 저장 가능 + (null 도 가능)
-- 외래키 설전된 테이블(부모) 에서 자신들 참조하는 데이터가 존재(자식)하는 경우, 삭제 불가능 

DROP TABLE T_MEMBER;


ON DELETE CASCADE; -- 부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; -- 부모 데이터 삭제시, 참조하는 자식 데이터 null로 변경


CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR(30),
    club_id REFERENCES T_CLUB(id) ON DELETE SET NULL
);

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR(30),
    club_id REFERENCES T_CLUB(id) ON DELETE CASCADE
);

CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30)
);

SELECT * FROM t_club; -- 클럽 조회
SELECT * FROM T_MEMBER; -- 멤버 조회

INSERT INTO T_CLUB
VALUES (1,'독서');

INSERT INTO T_CLUB
VALUES (2,'등산');

INSERT INTO T_CLUB
VALUES (3,'낚시');

SELECT * FROM T_MEMBER; -- 멤버 조회

INSERT INTO T_MEMBER
VALUES (1,'가이름',3);

SELECT *
FROM T_MEMBER m, T_CLUB C
WHERE m.club_id = c.id;

INSERT INTO T_MEMBER
VALUES (2,'나이름',2);

INSERT INTO T_MEMBER
VALUES (3,'다이름',1);

INSERT INTO T_MEMBER
VALUES (4,'라이름', NULL);

SELECT *
--delete
FROM t_club
WHERE id = 3;

UPDATE T_MEMBER
SET CLUB_ID = null
WHERE ID = 1; -- 진행 후 삭제 가능

SELECT * FROM GIFT;
SELECT * FROM CUSTOMER;

-- 데이터 딕셔너리
-- USER_ / DBA_ / ALL_
--- INDEXES / CONSTRAINTS / TABLES / SEQUENCES / SYNONYMS
-- VIEWS / ROLES

SELECT *
FROM USER_TABLES;

SELECT *
FROM TAB; -- 테이블 이름 정보;

SELECT *
FROM TAB
WHERE tname LIKE '%DEPT%';

SELECT *
FROM ALL_TABLES;

SELECT *
FROM USER_ROLE_PRIVS;

----------------

CREATE TABLE tt05
(
    ID NUMBER ,
    NO NUMBER ,
    AGE NUMBER,
    CONSTRAINT tt05_pk PRIMARY KEY (ID,NO)  -- ID, NO 두개 컬름을 묶어서 PK / PK는 하나 구성하는걸 2개로 묶은것임
    
);


