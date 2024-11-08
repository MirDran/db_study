--sub Query

--1번

SELECT *
FROM student;

SELECT *
FROM department;

SELECT 
    s.name,
    s.deptno1 DEPT_NO,
    d.dname DEPT_NAME
FROM student s, department d
WHERE s.deptno1 = d.deptno
AND s.deptno1 = (SELECT deptno1
                    FROM student
                    WHERE name = 'Anthony Hopkins');


/* 2. professor, department 테이블 활용. 
이름이 'Meg Ryan' 인 교수보다 나중에 입사한 사람의 이름, 입사일, 학과명 을 출력하세요.*/

SELECT *
FROM professor;

SELECT *
FROM department;

SELECT
    p.name 이름,
    p.hiredate 입사일,
    d.dname 학과명
FROM professor p, department d
WHERE p.deptno = d.deptno
AND p.hiredate > (SELECT hiredate
FROM professor
WHERE  name = 'Meg Ryan')
ORDER BY hiredate;



/* 3.student 테이블, 1전공이 201번 학과의 평균 몸무게보다 몸무게가 많이 나가는 학생들의 이름과 몸무게 출력하세요.*/

SELECT *
FROM student;

SELECT 
    name 이름,
    weight 몸무게
FROM student
WHERE weight > (SELECT 
    AVG(WEIGHT)
FROM student
WHERE deptno1 = 201);
 
 
 ----------------------------------------------
 
SELECT 
  *
FROM emp2;

SELECT *
FROM dept2
WHERE area = 'Pohang Main Office' ;

SELECT *
FROM emp2
WHERE deptno IN (SELECT dcode
                FROM dept2
                WHERE area = 'Pohang Main Office');
                
                
                
SELECT dcode
FROM dept2
WHERE area = 'Pohang Main Office'  
AND dcode = 1003;

SELECT *
FROM emp2
WHERE deptno = :dno;



/*
연습문제

1.
emp2 테이블 활용
직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
*/

SELECT *
FROM emp2;

SELECT *
FROM emp2
WHERE position = 'Section head';


/*

2.
Student 테이블.
전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적네 나가는 학생보다
몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
*/


/*
3.
emp2, dept2 활용
각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
부서명, 직원명, 연봉 출력*/

SELECT 
    d.dname 부서명,
    e.name 직원명,
    e.pay 연봉
FROM emp2 e, dept2 d
WHERE e.pay <ALL(SELECT AVG(pay)
                FROM emp2
                GROUP BY deptno)
AND e.deptno = d.dcode;


--------다중 컬럼

SELECT *
FROM student
WHERE (grade, weight) IN (SELECT grade,MAX(Weight)
                            FROM student
                            GROUP BY grade);


/* 
1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
교수번호화 이름, 학과명을 출력하세요
(입사일 순으로 오름차순 정렬)
*/

SELECT p.profno 교수번호, p.name 교수명, d.dname 학과명, p.hiredate 입사일
FROM professor p, department d
WHERE (p.deptno, p.hiredate) IN (SELECT deptno, MIN(hiredate)
                                FROM professor
                                GROUP BY deptno)
AND p.deptno = d.deptno
ORDER BY p.hiredate;

/*
2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
(연봉순으로 오름차순 정렬)
*/

SELECT name, position, 
    TO_CHAR(pay, '$999,999,999') pay
FROM emp2
WHERE (position, pay) IN (SELECT position, MAX(pay)
                            FROM emp2
                            GROUP BY position)
ORDER BY pay;

SELECT *
FROM emp2 e1
WHERE pay >= (SELECT AVG(e2.pay)
            FROM emp2 e2
            WHERE e2.position = e1.position);

SELECT *
FROM emp2;

SELECT *
FROM dept2;

--join
SELECT e.name, d.dname
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode;

--subquery

SELECT dname
FROM dept2
WHERE dcode = 1006;

SELECT
    name,
    (SELECT dname
    FROM dept2
    WHERE dcode = deptno) dname
FROM emp2;


SELECT MIN(pay)                   -- AVG(pay) 계산식으로 적용이 됨
FROM (SELECT deptno, AVG(pay) pay  --컬럼명이 AVG(pay) 위 사례문에 컬럼별칭을 사용함
        FROM emp2
        GROUP BY deptno);


SELECT empno,ename, job, mgr ,sal, comm, deptno
FROM emp;

SELECT sal, mgr
FROM (SELECT empno,ename, job, mgr ,sal
        FROM emp);

--emp 테이블 dept 테이블 조회하여 부서번호와 부서별 최대급여 및 부서명 출력
-- 그룹바이 집계 -> 조인 반대도 가능 (인라인뷰)
SELECT e.deptno, e.max_sal, d.dname
FROM (SELECT deptno, MAX(sal) max_sal
        FROM emp
        GROUP BY deptno) e, dept d  --부서별 이므로 기준 묶는 것은 부서 번호
WHERE e.deptno = d.deptno; 

--조인 하고 그룹바이
SELECT deptno, MAX(sal), dname
FROM( SELECT e.sal, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno)
GROUP BY deptno, dname;

/*
1.
student, department 테이블 활용
학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요
*/


-- 1) 다중컬럼 비교=========================================================

--1-1) join----------------------------------------------------------------
SELECT d.dname 학과명, s.height MAX_HEIGHT ,s.name 학생, s.height
FROM student s, department d
WHERE (s.deptno1,s.height) IN (SELECT deptno1,MAX(height) max_height
                            FROM student
                            GROUP BY deptno1)
AND s.deptno1 = d.deptno
ORDER BY deptno1;


--1-2) 서브쿼리 스칼라 서브쿼리-----------------------------------------------
SELECT (SELECT dname
        FROM department
        WHERE deptno = deptno1),
        height MAX_HEIGHT ,name 학생, height
FROM student s
WHERE (deptno1,height) IN (SELECT deptno1,MAX(height) max_height
                            FROM student
                            GROUP BY deptno1)
ORDER BY deptno1;

--2 인라인뷰 (서브쿼리)--------------------------------------------------


SELECT t.max_height, s.name, s.height
FROM (SELECT deptno1, MAX(height) max_height
        FROM student
        GROUP BY deptno1) t, student s
WHERE t.deptno1 = s.deptno1
AND t.max_height = s.height;

----2-1) join =-----------------------------------------------------------

SELECT d.dname,t.max_height, s.name, s.height
FROM (SELECT deptno1, MAX(height) max_height
        FROM student
        GROUP BY deptno1) t, student s, department d
WHERE t.deptno1 = s.deptno1
AND t.max_height = s.height
AND d.deptno = t.deptno1; ---- t랑 s랑 같은 학과 번호라 둘 중 아무거나 상관 X


---2-2) 스칼라 ---------------------------------------------------------

SELECT (SELECT dname
        FROM department
        WHERE deptno = t.deptno1), t.max_height, s.name, s.height
FROM (SELECT deptno1, MAX(height) max_height
        FROM student
        GROUP BY deptno1) t, student s
WHERE t.deptno1 = s.deptno1
AND t.max_height = s.height;

/*
2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
(학년 컬럼으로 오름차순 정렬해서 출력하세요)
*/


SELECT s.grade, s.name, s.height, e.avg_height
FROM (SELECT grade, AVG(height) avg_height
        FROM student
        GROUP BY grade) e, student s
WHERE s.grade = e.grade
AND
s.height > e.avg_height
ORDER BY s.grade;

--상호관계-------------------------------------------------------------------

SELECT
    s.grade, 
    s.name, 
    s.height,
    (SELECT AVG(t.height)
    FROM student t
    WHERE t.grade = s.grade) avg_height
FROM student s
WHERE s.height >(SELECT AVG(t.height)   -- 내학년 평균키
                FROM student t
                WHERE t.grade = s.grade);

