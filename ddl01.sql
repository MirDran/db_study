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

SELECT SYSDATE FROM dual;
