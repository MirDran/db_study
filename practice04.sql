-- practice04
-- join 6가지 문제
-- 3번문제 2010-05-31 기준으로

-- 1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 
-- 학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

SELECT *
FROM student; --학생 테이블

SELECT *
FROM department; -- 학과 테이블

SELECT 
    s.name stu_name --학생 이름
    ,s.deptno1      --학과 번호
    ,d.dname dept_name -- 학과 이름
FROM student s, department d
WHERE s.deptno1 = d.deptno;

/* 2. emp2 테이블과 p_grade 테이블을 조회하여
현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과
상한 금액을 아래 결과 화면과 같이 출력하세요. */

SELECT *
FROM emp2; --emp2 테이블

SELECT *
FROM p_grade; --p_grade 테이블 포지션

SELECT 
    e.name
    ,e.position
    ,TO_CHAR(e.pay, '999,999,999')
    ,TO_CHAR(p.s_pay, '999,999,999') LOWPAY
    ,TO_CHAR(p.e_pay, '999,999,999') HIGHPAY
FROM emp2 e, p_grade p
WHERE e.position = p.position (+)
AND e.position is NOT null
ORDER BY PAY;

/*
3. Emp2 테이블과 p_grade 테이블을 조회하여
사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.
*/

SELECT *
FROM emp2;

SELECT *
FROM p_grade;

SELECT 
    e.name
    ,trunc((TO_DATE('2010-05-30')-e.birthday)/365)+1 한국나이
    ,e.position 지금포지션
    
FROM emp2 e, p_grade p
WHERE e.position = p.position (+)
ORDER BY e.birthday DESC;

--SELECT 200-1972+1 FROM dual;
--SELECT 200-1980+1 FROM dual;

---------- 선생님

SELECT
--    birthday,
--    '2010-05-30',
--    SUBSTR('2010-05-30', 1,4),
--    To_CHAR(TO_DATE('2010-05-30'),'YYYY'),
--    TO_CHAR(birthday, 'YYYY'),
    2010 - TO_CHAR(birthday, 'YYYY')+1 나이
    -- DATE- DATE
--    trunc((TO_DATE('2010-05-30')-birthday)/365,0)
    --              CHAR
    
FROM emp2;

SELECT
    e.name,
    To_CHAR(TO_DATE('2010-05-30'),'YYYY')- TO_CHAR(e.birthday, 'YYYY') +1 한국나이,
    e.position 지금포지션,
    p.position 지금나이에맞는포지션
FROM emp2 e, p_grade p
WHERE To_CHAR(TO_DATE('2010-05-30'),'YYYY')- TO_CHAR(e.birthday, 'YYYY') +1 
BETWEEN p.s_age AND p.e_age
ORDER BY birthday DESC;

SELECT 
    MONTHS_BETWEEN(SYSDATE, TO_DATE('2010-05-30'))/12
FROM dual;

----4번

SELECT *
FROM customer;

SELECT *
FROM gift;

SELECT 
    c.gname,
    c.point,
    REPLACE(g.gname,g.gname,'Notebook')
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end 
AND point > 600001
ORDER BY point DESC;

------- 4번 선생님

SELECT * FROM gift;
SELECT * FROM customer;

SELECT 
    c.gname, 
    c.point
    'Nootbook' GNAME_1
    
FROM customer c, gift g
WHERE 
    c.point BETWEEN g.g_start AND g.g_end
    AND
    g.gno >= 7;
--  c.point > 600000



SELECT *
FROM customer c, gift g
WHERE 
    c.point > g.g_start
    AND
    g.gno = 7;

----5번

SELECT 
   profno,
   name,
   hiredate,
   RANK() OVER (ORDER BY hiredate) -1 COUNT
FROM professor;



--조인 기준

SELECT 
    p1.profno,
    p1.name,
    p1.hiredate,
    COUNT(p2.profno) count
FROM professor p1, professor p2
WHERE p1.hiredate > p2.hiredate(+)
GROUP BY p1.profno, p1.name, p1.hiredate
ORDER BY p1.hiredate;



----6번
SELECT *
FROM emp;


SELECT 
    e1.empno,
    e1.ename,
    e1.hiredate,
    COUNT(e2.empno) count
FROM emp e1, emp e2
WHERE e1.hiredate > e2.hiredate(+)
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY e1.hiredate;
