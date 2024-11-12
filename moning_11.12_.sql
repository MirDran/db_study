/*
1. 테이블 생성 쿼리 CREATE TABEL 
2. 데이터 저장 쿼리 INSERT
3. 데이터 수정 쿼리 UPDATE
4. 데이터 삭제 쿼리 DELETE
5/ 데이터 조회 쿼리 SELECT
*/ 
DROP TABLE T_MENU_12;

CREATE TABLE T_MENU_12
(
    Menu_Id NUMBER
        CONSTRAINT T_MENU_12_Menu_ID_PK PRIMARY KEY,
    Menus VARCHAR2(128)
        CONSTRAINT T_MENU_12_Menus_NN NOT NULL,
    Price NUMBER(10),
    Type CHAR(64),
    FineDate DATE
);

INSERT INTO T_MENU_12
VALUES (1,'싸이버거',6000,'완전식품',SYSDATE);

INSERT INTO T_MENU_12
VALUES (2,'콩나물비빔밥',7000,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12
VALUES (3,'닭가슴살',3000,'단백질',SYSDATE);

INSERT INTO T_MENU_12
VALUES (4,'베트남쌀국수',8000,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12
VALUES (5,'라면',2000,'밀가루',SYSDATE);

-- * 생성한 해당 데이터를 조회하시오.
SELECT * FROM T_MENU_12;

-- * 베트남쌀국수의 가격을 8500원으로 변경하시오.
UPDATE T_MENU_12
SET Price = 8500
WHERE menu_id = 4;

-- * 메뉴에서 라면을 삭제하시오.
DELETE FROM T_MENU_12
WHERE menu_id = 5;

commit;

---========================================================================
-- 선생님 버전

CREATE TABLE T_MENU_12
(
    id NUMBER
        CONSTRAINT T_MENU_12_Menu_ID_PK PRIMARY KEY,
    name VARCHAR2(128) NOT NULL,
    price NUMBER(10),
    type VARCHAR2(64), -- 기본값 NULL 가능하여 NOT NULL 쓸 이유 없음
    develop_date DATE
);


INSERT INTO T_MENU_12 (id, name, price, type, develop_date)
VALUES(1, '싸이버거', 6000 ,'완전식품',SYSDATE);

INSERT INTO T_MENU_12 
VALUES(2, '콩나물비빔밥', 7000 ,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12 (name,id, price, type, develop_date) -- 순서에 맞게 
VALUES('싸이버거', 3, 6000 ,'완전식품',SYSDATE);

INSERT INTO T_MENU_12 
VALUES(4, '베트남쌀국수', 8000 ,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12 
VALUES(5, '라면', 2000 ,'밀가루',SYSDATE);

-- 테이블 조회
SELECT id, name, price, type,
    TO_CHAR(develop_date, 'YYYY-MM-DD HH:MI:ss')
FROM T_MENU_12;

-- 가격변경
UPDATE T_MENU_12
SET price = 8500
WHERE id = 4;
--WHERE name = '베트남쌀국수';

-- 라면 삭제
SELECT *
--DELETE
FROM T_MENU_12
WHERE id = 5;

commit;
