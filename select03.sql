--복수행 함수 

--COUNT (대상) 갯수

SELECT 
    count(*)
FROM emp;

SELECT 
    count(empno)
FROM emp;

SELECT 
    count(job),
    count(mgr),
    count(hiredate),
    count(comm)         -- NULL은 갯수로 안침
FROM emp;

SELECT count(*)
FROM emp
WHERE comm IS NOT NULL;

SELECT SUM(sal), COUNT(*)
FROM emp;

-- 10번, 20번 부서 다니는 애들 총 몇명? 총 급여 얼마?
SELECT COUNT(*), SUM(sal)
FROM emp
WHERE deptno IN(10,20);

SELECT 
    AVG(height), 
    MAX(height), 
    MIN(height),
    STDDEV(height), 
    VARIANCE(height)
FROM student;

--student 평균 키
--전체가 아닌 학년 별 평균 키

SELECT AVG(height)
FROM student;

SELECT '1학년' 학년, AVG(height) 평균키
FROM student
WHERE grade =1
UNION ALL
SELECT '2학년', AVG(height)
FROM student
WHERE grade =2
UNION ALL
SELECT '3학년', AVG(height)
FROM student
WHERE grade =3
UNION ALL
SELECT '4학년', AVG(height)
FROM student
WHERE grade =4;

--SELECT...
--FROM ...
--WHERE...
--GROUP BY
--ORDER BY

-- GROUP BY 특정 컬럼을 기준으로 그룹 지어서 계산
-- 명시된 컬럼은 같이 조회 가능
SELECT AVG(height)
FROM student
GROUP BY grade;

SELECT studno, AVG(height)
FROM student
GROUP BY studno;

SELECT grade, AVG(height) height
FROM student
GROUP BY grade
ORDER BY height;

-- 해빙절

--SELECT
--FROM 
--WHERE 
--GROUP BY
--HAVING
--ORDER BY;

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal);

-- 급여가 1500이 상인 직원들 대상으로, 부서별 평균 급여 보여주기

SELECT deptno, AVG(sal)
FROM emp
WHERE sal >= 1500
GROUP BY deptno;

--부서별 평균 급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(SAL) >= 1500;

--student 각 학년별 평균 몸무게
-- 평균 몸무게 65키오 이상인 경우만 확인

SELECT 
    grade,
    AVG(weight)
FROM student
GROUP BY Grade
HAVING AVG(weight) >= 65;


--student 4학년 제외 각 학년별 평균 몸무게
-- 평균 몸무게 65키오 이상인 경우만 확인

SELECT 
    grade,
    AVG(weight)
FROM student
WHERE grade NOT IN (4) --grade <> 4
GROUP BY Grade
HAVING AVG(weight) >= 65;

SELECT deptno,job, ROUND(AVG(sal),1)
FROM emp
GROUP BY deptno, job;

SELECT deptno,job, ROUND(AVG(sal),1)
FROM emp
GROUP BY ROLLUP(deptno, job);

SELECT *
FROM emp
WHERE job = 'SALESMAN' AND deptno = 30;


--GROUP BY ROLLUP(deptno, job);
--1)deptno, job 그룹화 
--2)deptno 그룹화 계
--3)() 그룹화 계


--GROUP BY ROLLUP(deptno, job, mgr);
--1) deptno, job, mgr 그룹
--2)deptno, job 계
--3)deptno 계
--4)() 계

--GROUP BY ROLLUP((deptno, job));
--1) deptno, job 그룹화
--2) () 그룹화 계


-- RANK DENSE RANK

--순위 RNAK() OVER (ORDER BY 정렬기준)
-- 그룹단위 순위 RANK () OVER (PARTITION BY 기준 ORDER BY 정렬기준)
                            -- GROUP BY

SELECT 
    ename, 
    sal, 
    RANK() OVER(ORDER BY sal DESC),
    DENSE_RANK() OVER(ORDER BY sal DESC)
FROM emp;

SELECT
    name,
    height,
    RANK() OVER(ORDER BY Height DESC) 순위1,
    DENSE_RANK() OVER(ORDER BY Height DESC) 순위2,
    grade,
    RANK() OVER(PARTITION BY grade ORDER BY Height DESC) 순위3,
    DENSE_RANK() OVER(PARTITION BY grade  ORDER BY Height DESC) 순위4
FROM student
ORDER BY grade, height DESC;


