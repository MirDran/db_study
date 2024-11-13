---1번 문제
INSERT INTO dept2(dcode, dname,pdept,area)
VALUES (9010, 'temp_10',1006,'temp area');

--2번 문제
INSERT INTO dept2(dcode, dname,pdept)
VALUES (9020, 'temp_20',1006);

--3번 문제 CTAS? 방법
CREATE TABLE professor4
AS
SELECT profno, name, pay 
FROM professor
WHERE profno <= 3000;

--3번 문제 ITAS 방법 이라고 함
DROP TABLE professor4;

CREATE TABLE professor5
AS
SELECT profno, name, pay
FROM professor
WHERE 1=2;

INSERT INTO professor5
SELECT profno, name, pay 
FROM professor
WHERE profno <= 3000;

SELECT * FROM professor5;


-- 4번문제
UPDATE professor
SET bonus = 100
WHERE name = 'Sharon Stone';

--------결과보기

SELECT *
FROM dept2;

SELECT *
FROM professor4;

SELECT name, bonus
FROM professor
WHERE name = 'Sharon Stone';

ROLLBACK;


CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

SELECT * FROM product_quiz;

SELECT 
    FLOOR(price / 10000) * 10000 PRICE_GROUP,
    COUNT(*) PRODUCTS
FROM product_quiz
GROUP BY FLOOR(price / 10000) * 10000
ORDER BY PRICE_GROUP;
      
                            

SELECT 
    FLOOR(price / 10000) * 10000 PRICE_GROUP,
    COUNT(*) PRODUCTS
FROM product_quiz
GROUP BY FLOOR(price / 10000) * 10000
ORDER BY PRICE_GROUP;


-- 1. 단순 계산 먼저
    SELECT 0 PRICE_GROUP, COUNT(*) PRODUCTS
    FROM product_quiz
    WHERE price BETWEEN 0  AND 9999
UNION ALL
    SELECT 10000, COUNT(*)
    FROM product_quiz
    WHERE price BETWEEN 10000  AND 19999
UNION ALL
    SELECT 20000, COUNT(*)
    FROM product_quiz
    WHERE price BETWEEN 20000  AND 29999
UNION ALL
    SELECT 30000, COUNT(*)
    FROM product_quiz
    WHERE price BETWEEN 30000  AND 39999;


--- group by로 묶기
--만의 자리 수를 뽑아내면?

/*
10000 1
900   0
22000 2
30000 1
15000 3
17000 1
*/
SELECT TRUNC(price/10000)
FROM product_quiz;

SELECT 
    TRUNC(price/10000)*10000 price_group,
    COUNT(*) products
FROM product_quiz
GROUP BY TRUNC(price/10000)
ORDER BY price_group;

SELECT
    CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END price_group,
    COUNT(*) products
FROM product_quiz
GROUP BY CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END
ORDER BY price_group;

SELECT price price_group, count(*) priducts
FROM(
        SELECT product_id, product_code, TRUNC(price/10000)*10000 price
        FROM product_quiz)
GROUP BY price
ORDER BY price;



