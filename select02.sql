--단일행 함수
-- INITCAP - 첫글자를 대문자 나머지 소문자
-- 사용 법 SELECT INITCAP(ename) 

-- 임시로 사용하는 테이블 dual;

SELECT ename, INITCAP('ABCED'), INITCAP(ename)
FROM emp;

SELECT LOWER(name), UPPER(name) 
FROM student;

SELECT  LENGTH('abcdefasd'), LENGTHB('abcdefasd'), --LENGTHB는 바이트의 B
        LENGTH('점심'), LENGTHB('점심')
FROM dual;

/*
SELECT 
FROM dual;
*/

SELECT *
FROM emp  -- 이름 5글자인 이상인 사람들
WHERE LENGTH(ename)>=5
ORDER BY LENGTH(ename); --DESC는 올림차순

SELECT '아침'||'점심', CONCAT('아침','점심')
FROM dual;

--CONCAT은 2개로 정해져 있음

SELECT '아침'||'점심'||'저녁',CONCAT(CONCAT('아침','점심'),'저녁')
FROM dual;

-- SUBSTR 문자 잘라냄
-- SUBSTR (대상, 시작지점, 몇자리 잘라낼 것인가)
-- 시작지점의 -는 뒤에서 부터 n번째 임
SELECT  SUBSTR('abcdefg',2,3),
        SUBSTR('abcdefg',3,5),
        SUBSTR('abcdefg',-5,2)
FROM dual;
--결과 bdc 
--결과 cdefg
--결과 cd

SELECT  name, 
        SUBSTR(jumin,3,4) birthday,
        SUBSTR(jumin,3,4) -1 " birthday - 1"
FROM student
WHERE deptno1 = 101;


--INSTR (대상, 찾는 것 ,시작위치, 몇번째위치를 찾느냐( 기본값은 1 스킵 가능) 공백포함
SELECT  INSTR('2024/11/04 10/45/45','/',1,1),
        INSTR('2024/11/04 10/45/45','/',1,2),
        INSTR('2024/11/04 10/45/45','/',6,2),
        INSTR('2024/11/04 10/45/45','/',1,4),
        INSTR('2024/11/04 10/45/45','/',1,5),
        INSTR('2024/11/04 10/45/45','/',16,2)
FROM dual;

SELECT  name,
        tel,
        INSTR(tel,')',1)
FROM student
WHERE deptno1 = 201;

-- 1번.
SELECT  name 이름, 
        SUBSTR(jumin,1,2) 년도,
        SUBSTR(jumin,3,2) 월,
        SUBSTR(jumin,5,2) 일
FROM student;

-- 2번.
SELECT  name,
        tel,
        INSTR(tel,')',1,1) 위치  --스킵으로 1은 빼도 괜찮음
FROM student
WHERE deptno1 = 201;

-- 3번.
SELECT  name,
        tel,
        INSTR(tel,3,1) 위치 -- 1제외 가능 기본값 1
FROM student
WHERE deptno1 = 101;

-- 4번.
SELECT  name,
        tel,
        SUBSTR(tel,1,INSTR(tel,')',1)-1) 지역번호  --INSTR 1 없어도 가능
FROM student
WHERE deptno1 = 201;

SELECT 
        LPAD('문자',10,'*'),
        LPAD(123, 5, 0),
        LPAD(33, 3, 0)
        
FROM dual;

-- LPAD RPAD 문자를 채워줌

SELECT
        --   어떤것 ,채울수, 무엇을
        LPAD(id, 10 ,'*' ), --10 자리가 되도록 *을 채워라 왼쪽으로
        RPAD(id, 10 ,'*' )  --10 자리가 되도록 *을 채워라 오른쪽으로
FROM student;

SELECT LPAD(ename,9,123456)
FROM emp;

--LTRIM RTRIM 문자를 제거함

-- 불필요한 요소 제거
-- 공백제거용으로 주로 사용
SELECT LTRIM('abcd','a'),
        RTRIM('abcd','d'),
        RTRIM('abcd','b'),  --적용 X
        LTRIM('abcd','d'),   --적용 x
        LTRIM(' abcd '),    --기본으로 띄어쓰기 (SPB)를 인식함
        RTRIM(' abcd '),
        TRIM(' abcd '),
        TRIM(' a b c d ')  -- betwwen 처럼 맨 앞과 맨 뒤만 제거 해줌
FROM dual;

--REPLACE 문자 변경 (문자열 또는 컬럼, 변경대상, 변경내용)
SELECT 
        REPLACE('abcde','c','*'),       
        REPLACE('2024-11-04','-','/')
FROM dual;



--1.
--emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
--글자만 '-' 으로 변경해서 출력하세요 .

SELECT  ename, 
        REPLACE(ename,SUBSTR(ename,3,2),'--') REPLACE 
FROM emp
WHERE deptno = 20;


--2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게
--출력하세요

SELECT  name,
        REPLACE(jumin,SUBSTR(jumin,7,7),'-/-/-/-') 주민뒷자리숨김,
        SUBSTR(jumin,1,6)|| '-/-/-/-' 주민뒷자리숨김2,
        CONCAT(SUBSTR(jumin,1,6),'-/-/-/-') 주민뒷자리숨김3
FROM student
WHERE deptno1 = 101;

--3,
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
--단 모든 국번은 3자리로 간주합니다.


SELECT  name,
        tel,
        REPLACE(tel,SUBSTR(tel,5,3),'***') REPLACE,
        SUBSTR(tel,1,4)||'***'||SUBSTR(tel, 8, 5) 숨김2,
        SUBSTR(tel,1,4)||'***'||SUBSTR(tel, -5, 5) 숨김3,
        CONCAT(CONCAT(SUBSTR(tel,1,4),'***'),SUBSTR(tel, 8, 5)) 숨김4
--응용
--        SUBSTR(tel,1,INSTR(tel,')')),
--        SUBSTR(tel,-5,INSTR(tel,'-')-1)
--        CONCAT(CONCAT(SUBSTR(tel,1,INSTR(tel,')')),LPAD('*',4,'*')),SUBSTR(tel,-5,INSTR(tel,'-')))
FROM student
WHERE deptno1 = 102;


SELECT  name,
        tel,
        INSTR(tel, ')'), -- 괄호위치
        INSTR(tel, '-'), -- 빼기위치
        INSTR(tel, '-')-INSTR(tel, ')')-1 , -- 가운데 자리 수 갯수
        SUBSTR(tel, INSTR(tel, ')')+1, (INSTR(tel, '-')-INSTR(tel, ')')-1)), --가운데 자리
        -- tel, 어디부터? ) 다음부터    몇자리? 가운데자리수
        
        SUBSTR(tel, 1, INSTR(tel, ')')) ||
        LPAD('*',(INSTR(tel, '-')-INSTR(tel, ')')-1),'*')
        || SUBSTR(tel, -5, 5)
        
FROM student;



--4.
--Student 테이블에서 아래와 같이 deptno1 이
--101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
--지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.

SELECT name,
        tel,
        REPLACE(tel,SUBSTR(tel,-4),'****') REPLACE
FROM student
WHERE deptno1 = 101;

SELECT
    ROUND(1.66,1),      --반올림
    TRUNC(1.4567,2),    --버림
    TRUNC(1.4567,0),    -- 소숫점 0번째 까지 버림
    TRUNC(123.4567,-1),
    MOD(15,4),          -- 나눗셈 후 남은것 나머지 값
    CEIL(123.123),      -- 가까운 큰 정수
    FLOOR(123.123),     -- 가까운 작은 정수
    POWER(3,5)          -- (n의,n제곱)
FROM dual;

SELECT 
    rownum,  -- 행 번호 기본적인 제공 기능
    CEIL(rownum/3),
    CEIL(rownum/4),
    empno,
    ename
FROM emp;

SELECT
    NULL,
    SYSDATE, --현재 날짜 시간
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05','2024-03-31'),
    MONTHS_BETWEEN('2024-03-05','2024-01-05'),
    ADD_MONTHS(SYSDATE, 3),
    LAST_DAY(SYSDATE), -- 2월 28 , 31일 , 30일 등 을 인해서 필요함
    NEXT_DAY(SYSDATE,'수'),
    NEXT_DAY(SYSDATE,'토')
FROM dual;

SELECT 
    ROUND(SYSDATE), 
    TRUNC(SYSDATE),
    TRUNC(123.113,1),
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE +3,
    SYSDATE -3,
    SYSDATE +7,
    -- 다음달의 첫날
    TRUNC(ADD_MONTHS(SYSDATE, 1),'mm'),
    LAST_DAY(SYSDATE)+1,
    --전월의 마지막 날
    TRUNC(SYSDATE, 'mm')-1,
    LAST_DAY(ADD_MONTHS(SYSDATE,-1))
FROM dual;

--------------

SELECT 2+'2' -- 자동 형변환
FROM dual;

SELECT 2 || '123a'
FROM dual;

SELECT 
    TO_CHAR(123),
    TO_CHAR(593241.13),
    TO_CHAR(507.13),
    TO_CHAR(SYSDATE), -- 날짜 =-> 문자
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    ROUND(SYSDATE),
    TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT 
    studno,
    name,
    TO_CHAR(birthday, 'YYYY-MM-DD')
FROM student
WHERE TO_CHAR(birthday, 'MM') = 01; 

SELECT 
    empno,
    ename,
    hiredate
FROM emp
WHERE TO_CHAR(hiredate,'mm') IN (01,02,03);

SELECT
    TO_CHAR(1234,'999999'),
    TO_CHAR(1234,'099999'),
    TO_CHAR(1234,'$99999'),
    TO_CHAR(1234,'9999.9999'),
    TO_CHAR(1234,'99,999')
FROM dual;

SELECT 
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD') hiredate,
    TO_CHAR((sal*12)+comm,'$99,999') AS "SAL",
--    TO_CHAR(((sal*12)+comm)*0.15+(sal*12)+comm,'$99,999') AS "15%인상"
    TO_CHAR(((sal*12)+comm)*1.15,'$99,999') AS "15%인상"
FROM emp
WHERE comm IS NOT NULL;

--문자 -> 날짜 TO_DATE
SELECT 
    TO_DATE('2024-06-02') + 3,
    TO_DATE('2024/06/02') + 3,
    TO_DATE('24-06-02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02')+3,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024,01,05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YYYY') -- 20년 12월 10일
FROM dual;


-- NVL

SELECT
    sal,
    comm,
    sal*12+comm,   --숫자*12 +null 
    sal*12+NVL(comm,0)
FROM emp;

SELECT 
    profno,
    name,
    pay,
    bonus,
    TO_CHAR(pay*12+NVL(bonus,0),'99,999') TOTAL
FROM professor
WHERE deptno = 201;

SELECT 
    NVL(NULL,10),
    NVL2(123,'있다','없다'),
    NVL2(null,'있다','널이다')
FROM dual;

SELECT
    empno,
    ename,
    comm,
    NVL2(comm,'Exist','NULL') NVL2,
    sal*12+NVL(comm,0) TOTAL,
    sal*12+NVL2(comm,comm,0) TOTAL2,
    NVL2(comm, sal*12+comm, sal*12) TOTAL3
FROM emp
WHERE deptno = 30;


SELECT 
    DECODE(10,10,'같다','다르다'),
    DECODE(10,20,'같다','다르다'),
    DECODE(10,20,'같다'), -- 다르면 NULL이 생략 되어있음
    DECODE(10,12,'같다',null),
    DECODE(10,10,'같다','다르다'),
    DECODE(10,30,'30이다',40,'40이다',50,'50이다','아니다'),
    DECODE(10,30,'30이다',40,'40이다',50,'50이다',60,'60이다','아니다'),
    DECODE(10,30,'30이다',40,'40이다',50,'50이다',60,'60이다',null),
    DECODE(10,30,'30이다',40,'40이다',50,'50이다',60,'60이다')
FROM dual;

SELECT 
    deptno,
    name,
    DECODE(deptno, 101, '컴퓨터공학','다른학과'),
    DECODE(deptno, 101, '컴퓨터공학','ETC'),
    DECODE(deptno, 101, '컴퓨터공학'),
    DECODE(deptno, 101, '컴퓨터공학',null)
FROM professor;

SELECT 
    deptno,
    name,
    DECODE(deptno, 101, '컴퓨터공학', 102, '멀티미디어', 103, '소프트웨어','ETC') dname
FROM professor;

--CASE

--grade
-- 1 1학년 2 2학년 3 3학년 4 4학년
-- 1 저학년 2 저학년 3 고학년 4 고학년

SELECT grade || '학년'
FROM student;

SELECT
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4,'고학년') 구분, 
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE 
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
FROM student;






