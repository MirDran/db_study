--emp 테이블 사전기준 이름순 정렬.

SELECT *
FROM emp
ORDER BY ename;

--emp 테이블 부서번호 별 정렬 + 급여가 높은 순서대로

SELECT *
FROM emp
ORDER BY deptno, sal DESC;


--emp 급여가 2000이 넘는 사람들 중 급여가 높은 순서대로

SELECT *
FROM emp
WHERE sal > 2000
ORDER BY sal DESC;

--student 테이블 1학년을 제외하고, 나이가 어린순서대로

SELECT *
FROM student
WHERE grade <> 1   -- != <> NOT IN
ORDER BY birthday DESC;

-----
--집합연산자
UNION --합 집합(중복제거)
UNION ALL -- 합 집합(중복제거x)
INTERSECT --교집합
MINUS --차집합


-- 학생들 중에 101번학과 학생들과 102번 학과 학생들 조회
SELECT * 
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT * 
FROM student
WHERE deptno1 = 102;

SELECT * 
FROM student
WHERE deptno1 IN (101,102);


--열의 숫자와 타입 도 같아야 함 
-- 각 테이블 조회 결과 갯수/ 타입이 일치하는 형태로 만들어서 결합
SELECT studno, name, deptno1 --  숫자 / 문자 / 숫자 3개
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT profno, name, deptno --  숫자 / 문자 / 숫자 3개
FROM professor
WHERE deptno = 101;

SELECT studno, name, deptno1 --  숫자 / 문자 / 숫자 3개
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT profno, name, 0 --  숫자 / 문자 / 숫자  인위적으로 3개 맞추려고 0추가
FROM professor
WHERE deptno = 101;



SELECT  studno idno,
        name, 
        deptno1 deptno, 
        NULL eamil,
        1 divtype--  숫자 / 문자 / 숫자 3개
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT  profno, 
        name, 
        deptno, 
        email,
        2-- 숫자 문자 숫자 문자 4개
FROM professor
WHERE deptno = 101;

SELECT *
FROM student
WHERE deptno1 = 101
INTERSECT
SELECT *
FROM student
WHERE deptno2 = 201;

SELECT *
FROM student
WHERE deptno1 = 101 AND deptno2 = 201;

SELECT * 
FROM emp
WHERE job = 'SALESMAN' AND comm > 400
MINUS
SELECT * 
FROM emp
WHERE hiredate < '1982-01-01';

