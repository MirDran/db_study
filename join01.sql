--join 01
SELECT *
FROM emp;

SELECT *
FROM dept;

--조인 기준 deptno(기준) 가 같은

SELECT empno, ename,  dname, loc, b.deptno
--SELECT *
FROM emp a, dept b
WHERE a.deptno = b.deptno;


SELECT empno, ename,  dname, loc, b.deptno
--SELECT *
FROM emp a INNER JOIN dept b
ON a.deptno = b.deptno;


SELECT COUNT(*)
FROM student;



SELECT *
FROM emp a, dept b;

--student <-profno-> professor
SELECT *
FROM student;

SELECT *
FROM professor;

SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

SELECT *
FROM student s INNER JOIN professor p
ON s.profno = p.profno;

-- INNER JOIN NULL은 삭제 VS OUTER JOIN NULL 포함


SELECT *
FROM student s, professor p
WHERE s.profno = p.profno (+);

SELECT s.name, p.name
FROM student s LEFT OUTER JOIN professor p ---RIGHT OUTER JOIN
ON s.profno = p.profno;

--학생 , 학과, 교수 테이블 조인하여 학생 이름 학생의 이름 학과의 교수

SELECT * 
FROM student;

SELECT * 
FROM professor;

SELECT * 
FROM department;

SELECT 
    s.name STU_NAME, 
    d.dname DEPT_NAME, 
    p.name PROF_NAME
FROM student s, department d, professor p
WHERE   
    s.profno = p.profno
    AND s.deptno1 = d.deptno;


SELECT 
    s.name STU_NAME, 
    d.dname DEPT_NAME, 
    p.name PROF_NAME
FROM 
    student s
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;
    
SELECT 
    s.name STU_NAME, 
    d.dname DEPT_NAME, 
    p.name PROF_NAME
FROM student s, department d, professor p
WHERE   
    s.profno = p.profno
    AND
    p.deptno = d.deptno;


-- 교수 학과 이름, 학생 학과 이름

SELECT 
    s.name, 
    s.deptno1, 
    d.dname, 
    s.profno, 
    p.profno, 
    p.name,
    p.deptno,
    d2.dname
    
FROM student s, professor p, department d, department d2
WHERE s.profno = p.profno
    AND s.deptno1 = d.deptno
    AND p.deptno = d2.deptno;
    
    

SELECT * 
FROM customer;

SELECT * 
FROM gift;


SELECT c.gname,c.point,g.gname
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end;

SELECT *
FROM student;

SELECT *
FROM score;

SELECT *
FROM hakjum;

--1번
SELECT s.studno 학번, s.name 이름, c.total 점수, h.grade 학점
FROM student s, score c, hakjum h
WHERE s.studno = c.studno
AND
c.total BETWEEN h.min_point AND h.max_point;

--2번
SELECT s.studno 학번, s.name 이름, c.total 점수, h.grade 학점, s.deptno1 학과
FROM student s, score c, hakjum h
WHERE 
s.deptno1 IN (101,102)
AND
s.studno = c.studno
AND
c.total BETWEEN h.min_point AND h.max_point;

--3번
SELECT s.name 이름 , s.grade 학년 , p.name 교수명, p.deptno 전공번호, d.dname 과목명
FROM professor p, student s, department d
WHERE 
p.deptno <> 301
AND
p.profno = s.profno
AND
p.deptno = d.deptno;

-- INNER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

--OUTER JOIN 학생 기준
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno(+);

--OUTER JOIN 교수 기준
SELECT *
FROM student s, professor p
WHERE p.profno = s.profno(+);

--내 사번, 내 이름, 상사사번, 상사 이름

SELECT 
    e1.empno 사번
    ,e1.ename 이름
    ,e2.empno 상사사번
    ,e2.ename 상사이름
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno (+);



  