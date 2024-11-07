--24.11.07_moning
--1. emp 테이블에서 평균 급여가 2000 이상인 부서의 부서번호와 평균급여를 구하세요.

SELECT 
    deptno 부서명,
    ROUND(AVG(sal),2) 평균급여
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

--2. panmae 테이블
--각 판매일자 별 총 판매한 수량과 총 판매한 금액을 출력하세요.

SELECT *
FROM panmae;

SELECT 
    p_date 판매일자,
    SUM(p_qty) 판매수량,
    SUM(p_total) 판매금액
FROM panmae
GROUP BY p_date
ORDER BY p_date;

--3. panmae 테이블
--판매일자 기준으로 각 상품코드당 총 판매수량과 총 판매금액을 보여주세요. 판매일자 기준, 각 상품코드 당 (그룹바이 2개)
--판매일자 기준으로 모든 상품의 판매수량과 판매금액의 소계를 출력하고, SUM 사용 (셀렉트에)
--마지막에 전체 판매수량과 판매금액의 합계도 보여주세요. ROLLUP 사용 (그룹바이 에서 사용)

SELECT *
FROM panmae;

SELECT 
    p_date 판매일자,
    p_code 상품코드,
    sum(p_qty) 판매수량,
    sum(p_total) 판매금액
FROM panmae
GROUP BY ROLLUP(p_date, p_code);

