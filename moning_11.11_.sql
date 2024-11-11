SELECT *
FROM emp2;

SELECT *
FROM dept2;

SELECT 
   AVG(e.pay)
FROM emp2 e, dept2 d 
WHERE e.deptno = d.dcode
AND SUBSTR(d.area,1,INSTR(d.area,' ',1)) = 'Seoul ';

SELECT 
    e.empno 사번,
    e.name 이름,
    e.deptno 부서번호,
    d.dname 부서이름,
    d.area 근무지역,
    e.pay 급여
FROM emp2 e, dept2 d
WHERE e.pay > (SELECT 
                   AVG(e.pay)
                FROM emp2 e, dept2 d
                WHERE e.deptno = d.dcode
                AND SUBSTR(d.area,1,INSTR(d.area,' ',1)) = 'Seoul ')
AND e.deptno = d.dcode;
                
                
----------------------------------------------------------------------------
/* emp2 dept2 테이블을 참고하여,

'AL Pacino'와 "같은 지역"에서
근무하는 직원들의 평균 연봉보다
많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요 */

SELECT *
FROM emp2;

SELECT area
FROM dept2
WHERE dcode =  (SELECT deptno
                FROM emp2 
                WHERE name = 'AL Pacino');--(알파치노가 속한 부서 번호);

--평균 급여보다 큰 직원들 정보 <-평균급여 <- emp2 에 직원들 목록있고 = deptno =dcode 서울브랜치에 위치

SELECT dcode
FROM dept2
WHERE area = (SELECT area
                FROM dept2
                WHERE dcode =  (SELECT deptno
                                FROM emp2 
                                WHERE name = 'AL Pacino'));


SELECT AVG(pay)
FROM emp2
WHERE deptno IN (SELECT dcode
                FROM dept2
                WHERE area = (SELECT area
                                FROM dept2
                                WHERE dcode =  (SELECT deptno
                                                FROM emp2 
                                                WHERE name = 'AL Pacino')));
                                                
SELECT empno, name, deptno,
    (SELECT dname from dept2 WHERE dcode = deptno) dnamem,
    (SELECT area from dept2 WHERE dcode = deptno) area,
    pay
FROM emp2 e
WHERE pay > (SELECT AVG(pay)
            FROM emp2
            WHERE deptno IN (SELECT dcode
                            FROM dept2
                            WHERE area = (SELECT area
                                            FROM dept2
                                            WHERE dcode =  (SELECT deptno
                                                            FROM emp2 
                                                            WHERE name = 'AL Pacino'))));


SELECT e.empno, e.name, e.deptno,
    d.dname,
    d.area,
    e.pay
FROM emp2 e, dept2 d
WHERE pay > (SELECT AVG(pay)
            FROM emp2
            WHERE deptno IN (SELECT dcode
                            FROM dept2
                            WHERE area = (SELECT area
                                            FROM dept2
                                            WHERE dcode =  (SELECT deptno
                                                            FROM emp2 
                                                            WHERE name = 'AL Pacino'))))
AND e.deptno = d.dcode;




