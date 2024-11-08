/*
1. 조회 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;

select * from dept;
* : 모두 , 전체 , ALL 을 의미함

테이블 구조 확인 (Describe)
DESC 테이블 명 ;

조회 데이터 리터럴 활용하기!
SELECT '문자', 3019 FROM 테이블명;  문자는 ' ' 숫자는 그냥 쓰면 된다.

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 AS "컬럼별칭"
    컬럼명 "컬럼별칭"
    컬럼명 컬럼별칭
FROM 테이블명;

*/


select * from dept; -- dept테이블에 있는 모든 컬럼을 조회

select * from dept2; -- dept2테이블에 있는 모든 컬럼을 조회

select * from emp;

select mgr,sal from emp; -- emp 테이블에서 mgr과 sal 컬럼을 조회

--가독성
SELECT *
FROM emp;

SELECT
    empno,
    ename,
    job
FROM emp;

DESC emp; --emp 테이블의 구조를 보여달라


SELECT empno, ename, '그냥문자',999 FROM emp;

SELECT '그냥문자',999 FROM emp; --테이블의 행의 만큼 생김 (emp) 12개 있어서 12개만 나옴

SELECT ename AS "이름",
       empno "사번",
       job 직업,
       '그냥문자' 중요한의미,
       sal "직원의 월급" -- 스페이스의 경우 ""를 사용해서 같은 문장인 걸 알려줌
FROM emp;


--중복값 제거
DISTINCT

SELECT * FROM emp;

SELECT DISTINCT job  --job 중복제거 조회
FROM emp;

SELECT DISTINCT (deptno) -- depno 부서번호 중복제거 조회
FROM emp;

SELECT DISTINCT deptno, job -- 두개 조합 중복 제거 30 세일즈맨로 여래개 중복 제거
FROM emp;

-- || 연결 연산자

SELECT '나는' || '배가고프다' FROM dept;

SELECT deptno || dname AS "부서번호이름",
       deptno || dname "부서번호이름",
       deptno || dname 부서번호이름
FROM dept;

SELECT  deptno+10,
        deptno+20,
        deptno+30
FROM dept;

SELECT deptno+deptno+deptno
FROM dept;

SELECT * FROM student;

SELECT name||'''s  ID : '||id||', WEIGHT is '|| weight ||'Kg' as "ID AND WEIGHT"
FROM student;

SELECT * FROM emp;

SELECT ename||'('||job||') , '||ename||''''||job||'''' AS "NAME AND JOB"
FROM emp;

SELECT * FROM emp;

SELECT ename||'''s sal is $'||sal AS "Name and Sal" 
FROM emp;

--WHERE 조건
--찾고싶은 조건 (결과 필터링)

/*
SELECT  ...   
FROM    ...
WHERE   ...
*/

SELECT *
FROM emp;

SELECT *
FROM emp
WHERE comm is null; --성과급을 받지 않는 사람들만

SELECT *
FROM emp
WHERE comm is not null; --성과급 받는 사람들

SELECT DISTINCT deptno FROM emp;

--부서번호 20번 부서에 속한 사람들의 이름과 급여
SELECT ename, sal   --*에서 변경
FROM emp
WHERE deptno = 20;

--emp 테이블 급여 2000보다 적게 받는 사람들 목록
SELECT *
FROM emp
WHERE sal < 2000 ;

--emp 테이블 직업이 CLERK 인 사람들만 취합
SELECT *
FROM emp
WHERE job = 'CLERK';


--emp 테이블 직업이 CLERK이 아닌 사람들만 취합
SELECT *
FROM emp
WHERE job <> 'CLERK';
--WHERE job != 'CLERK';

--emp 테이블 급여가 2000~3000인 사람들만 조회
SELECT *
FROM emp
--WHERE sal >= 2000 AND sal <= 3000 ; -- sal <금액 sal> 금액 붙여야 함 가운데 AND OR
WHERE sal BETWEEN 2000 AND 3000;

--student 테이블에서 1학년과 3학년 만 조회 (1학년 이거나 3학년 이거나)
SELECT *
FROM student
--WHERE grade = 1 or grade = 3;
WHERE grade IN (1,3);

--student 테이블에서 1학년과 3년만 제외하고 조회
SELECT *
FROM student
--WHERE grade IN (2,4);
WHERE grade NOT IN (2,4);
--WHERE grade <> 1 AND grade <> 3;


