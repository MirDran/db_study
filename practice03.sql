--emp 전체 sal 급여 평균

SELECT 
    AVG(sal) 평균급여
FROM emp;

--emp 30번부서사람들 평균급여
SELECT 
    AVG(sal)
FROM emp
WHERE deptno = 30;

--emp 각부서별 평균 급여
SELECT 
    deptno,
    AVG(sal)
FROM emp
GROUP BY deptno;

--emp 각부서별 인원과 평균 급여
SELECT 
    deptno,
    COUNT(*),
     AVG(sal)
FROM emp
GROUP BY deptno;
--emp 각 직업별 평균 급여

SELECT 
    job,
    AVG(sal)
FROM emp
GROUP BY JOB;
--emp 각 직업별 가장 높은 급여 얼마?
SELECT 
    job,
    MAX(sal )
FROM emp
GROUP BY JOB;

--emp 각 부서별 가장 높은 급여 얼마?
SELECT 
    deptno,
    MAX(sal)
FROM emp
GROUP BY deptno;