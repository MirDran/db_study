SELECT 
    studno 번호,
    name 이름,
    ID 아이디
FROM student
WHERE height between 160 and 175
UNION ALL
SELECT 
    profno 번호,
    name 이름,
    ID 아이디
FROM professor
WHERE deptno IN(101,102,103,201) and bonus is null;

SELECT 
    '이름:'||name 이름,
    '아이디:'||ID 아이디,
    '주민번호:'|| REPLACE(jumin,SUBSTR(jumin,7),'-')||SUBSTR(jumin,7) 주민번호
FROM student;

---- DECODE

SELECT 
    deptno,
    name,
    DECODE(name,'Audie Murphy',DECODE(deptno,101, 'BEST!')) DECODE
FROM professor;

SELECT 
    deptno,
    name,
    DECODE(deptno,101,DECODE(name,'Audie Murphy','BEST!','GOOD!')) 비고
FROM professor;

SELECT 
    deptno,
    name,
    DECODE(deptno,101,DECODE(name,'Audie Murphy','BEST!','GOOD!'),'N/A') 비고
FROM professor;

SELECT 
    name,
    jumin,
    DECODE(SUBSTR(jumin,7,1),1,'남자','여자') 성별
FROM student
WHERE deptno1 = 101;

SELECT 
    name,
    tel,
    DECODE(SUBSTR(tel,1,INSTR(tel,')')-1),'02','서울', '031','경기','051','부산','052','울산','055','경남','기타지역') 지역명
FROM student
WHERE deptno1 = 101;

SELECT 
    name,
    jumin,
    birthday,
    CASE
        WHEN SUBSTR(jumin,3,2) BETWEEN 1 AND 3 THEN '1분기'
        WHEN SUBSTR(jumin,3,2) BETWEEN 4 AND 6 THEN '2분기'
        WHEN SUBSTR(jumin,3,2) BETWEEN 7 AND 9 THEN '3분기'
        WHEN SUBSTR(jumin,3,2) BETWEEN 10 AND 12 THEN '4분기'
    END 분기
FROM student;

SELECT 
    empno,
    ename,
    sal,
    CASE 
        WHEN sal BETWEEN 1 AND 1000 THEN 'Level 1'
        WHEN sal BETWEEN 1001 AND 2000 THEN 'Level 2'
        WHEN sal BETWEEN 2001 AND 3000 THEN 'Level 3'
        WHEN sal BETWEEN 3001 AND 4000 THEN 'Level 4'
        WHEN sal>4001  THEN 'Level 5'
    END 급여등급
FROM emp;