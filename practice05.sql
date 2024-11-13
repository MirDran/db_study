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
GROUP BY price
ORDER BY price;
      
                            
SELECT product_id
FROM product_quiz
WHERE price BETWEEN 0 AND 9999;                                                             