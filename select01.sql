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
--DISTINCT

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

--패턴 검색
--LIkE % or _
--% 아무거나 아무갯수 0~N개
--_ : 그 위치에 한개

SELECT *
FROM emp
WHERE ename LIKE '%MI%';  -- SMITH 중간에 MI라고 포함 된 MI로 시작한 것 도 찾음
--WHERE ename LIKE 'MI%';  -- MI로 시작하는 (대소문자 구별함)
--WHERE ename LIKE 'M%'; --MIND MID MOM MIKE 등 뒤에 신경 안쓰고  M으로 시작하면 가져옴
--WHERE ename = 'WARD';

SELECT *
FROM emp
WHERE ename LIKE '_MI__'; -- 5글자 이며 2~3번째가 MI 여야 함
--WHERE ename LIKE '_MI'; -- 글자의 숫자 무조건 정해져야함 현재 첫글자 아무거나의 3글자
--WHERE ename LIKE '_MI%'; -- 앞에 글자가 무조건 있어야 하므로 밀러 사라짐


-- < <= > >=

SELECT *
FROM emp
WHERE hiredate < '1981-05-01'; -- 숫자가 미래일 수록 크고 과거일 수록 작음
--WHERE hiredate = '81/05/01/';

SELECT *
FROM student;

--정렬 ORDER BY
--정렬을 사용하지 않으면 순서보장X
-- WHERE 다음에 ORDER BY 사용 조건이 없으면 FROM 밑에
-- ORDER BY 뒤에 정렬할 기준이 되는 컬럼명 [ASC|DESC] [오름차순|내림차순]

SELECT *
FROM student
ORDER BY name; -- name 기준 오름차순

SELECT *
FROM student
ORDER BY name DESC; -- name 기준 내림차순

SELECT *
FROM student
ORDER BY grade DESC; -- 학년차 기준 내림차순

SELECT *
FROM student
ORDER BY birthday;  -- 생일 기준 오름차순 낮음 (과거 부터)

SELECT *
FROM student
ORDER BY birthday DESC; -- 생일 기준 내림차순 (미래부터)

SELECT *
FROM student
WHERE grade IN (1,2,3) -- 학년 1,2,3 학년만 조회
ORDER BY grade, height DESC; -- 학년 오름차순 정렬 (1학년부터) 1차,2차 분류 학년 별 키순
                    -- 둘다 적용이 아닌 각각 EDSC 적용


SELECT *
FROM emp
ORDER BY ename;


SELECT deptno, sal
FROM emp
ORDER BY sal DESC;


SELECT *
FROM emp
WHERE sal > 2000
ORDER BY sal DESC;

SELECT *
FROM student
WHERE grade NOT IN (1)
ORDER BY birthday DESC;



