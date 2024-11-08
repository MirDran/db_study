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
