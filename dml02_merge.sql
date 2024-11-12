--DML02 MERGE


--신발가게 날짜별 매출

DROP TABLE SHOE_M;

CREATE TABLE SHOE_M
(
    w_date DATE,
    s_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);

DROP TABLE CLOT_M;
--옷가게 날짜별 매출
CREATE TABLE CLOT_M
(
    w_date DATE,
    s_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);

DROP TABLE COMP_M;
--본사 전체 매출
CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);

CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10),
    type VARCHAR(2) -- 가게 구분 코드 'C' 옷가게, 'S' 신발가게
);


--하나의 가게
--날짜별 여러가게
--날짜구분코드

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'),1 , 5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'),1 , 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'),1 , 20000)
SELECT * FROM dual;

UPDATE SHOE_M
SET sales = 9000
WHERE w_date = '2024-11-02';

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'),50,9000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'),50,140000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'),50,26000)
SELECT * FROM dual;

UPDATE CLOT_M
SET sales = 94000
WHERE w_date = '2024-11-06';

SELECT * FROM dual;

SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

DELETE FROM COMP_M;

--DELETE - > 완전삭제 후 통으로 다시 

INSERT INTO COMP_M
SELECT * FROM SHOE_M;

INSERT INTO COMP_M
SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;


SELECT S_CODE, SUM(Sales)
FROM COMP_M
GROUP BY S_CODE;

SELECT w_date, SUM(Sales)
FROM COMP_M
GROUP BY w_date
ORDER BY w_date;

SELECT SUM(Sales)
FROM COMP_M
WHERE TO_CHAR(w_date, 'MM') = 11; -- 11월 

-----------------------------------------------------------------------------
SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

-----------------------------------MERGE 형식---------------------------------
--하나의 가게 + 날짜 중복X
MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date = s.w_date)
WHEN MATCHED THEN    --조건이 일치하는게 있으면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   -- 조건 일하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);
    
 MERGE INTO COMP_M m
USING CLOT_M c
ON (m.w_date = c.w_date)
WHEN MATCHED THEN    --조건이 일치하는게 있으면
    UPDATE SET m.sales = c.sales
WHEN NOT MATCHED THEN   -- 조건 일하는게 없으면
    INSERT VALUES (c.w_date, c.s_code, c.sales);
    
    
SELECT * FROM COMP_M;


--날짜별 여러가게


---- 날짜별  추가

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 2, 16420)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 2, 12775)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 2, 67000)
SELECT * FROM dual;

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'),60,13000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'),60,125000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'),60,197330)
SELECT * FROM dual;



MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN    --조건이 일치하는게 있으면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   -- 조건 일하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);
    
 MERGE INTO COMP_M m
USING CLOT_M c
ON (m.w_date = c.w_date AND m.s_code = c.s_code)
WHEN MATCHED THEN    --조건이 일치하는게 있으면
    UPDATE SET m.sales = c.sales
WHEN NOT MATCHED THEN   -- 조건 일하는게 없으면
    INSERT VALUES (c.w_date, c.s_code, c.sales);



SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

SELECT S_CODE, SUM(Sales)
FROM COMP_M
GROUP BY S_CODE;

SELECT w_date, SUM(Sales)
FROM COMP_M
GROUP BY w_date
ORDER BY w_date;

SELECT SUM(Sales)
FROM COMP_M
WHERE TO_CHAR(w_date, 'MM') = 11; -- 11월 


--가게 구분 코드

SELECT *
FROM comp_m;   -- 신발게가 따로 옷가게 따로 매출 확인


