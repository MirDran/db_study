-- ddl 02 제약조건

-- CONSTRAINT
CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE , -- 중복 값이 들어가지 못한다.
    name VARCHAR(10) NOT NULL , -- NULL이 들어가면 안된다.
    hiredate DATE
);

INSERT INTO tt01 -- 제약 조건 확인 Shift + F4
VALUES (1, '이름1', SYSDATE);

INSERT INTO tt01
VALUES (2, '이름2', SYSDATE);

SELECT * FROM tt01;

INSERT INTO tt01
VALUES (3, '이름3', SYSDATE);

CREATE TABLE tt03
(
    no NUMBER(3)
        CONSTRAINT tt03_no_uk UNIQUE,
    name VARCHAR2(10)
        CONSTRAINT tt03_name_nn NOT NULL,
    --score NUMBER(3) CHECK (score BETWEEN 0 AND 100) 약식
    score NUMBER(3)
        CONSTRAINT tt03_scoer_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT tt03_pass_ck CHECK (pass IN ('Y', 'N'))
);

--Oracle DB 숫자/문자/날짜   boolean이 없다 True/False 구분이 없어서 값으로 구분함

-- 1:true 0:false // Y:true N:flase // T:true F:false // true:true false:falase

SELECT * FROM tt03;

INSERT INTO tt03
VALUES (1,'이름1', 50, 'Y');

INSERT INTO tt03
VALUES (1,'이름1', 50, 'Y'); -- 중복 UNIQUE

INSERT INTO tt03
VALUES (1,NULL, 50, 'Y'); -- 이름 NOT NULL

INSERT INTO tt03
VALUES (1,'이름1', 500, 'Y'); -- SCORE 범위는 0~100까지

INSERT INTO tt03
VALUES (2,'이름2', 70, 'D'); -- pass Y OR N 만 가능




