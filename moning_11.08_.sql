-- 2024.11.08 moning


/*
참조 테이블 : panmae, product, gift
출력 데이터 : 상품명, 상품가, 구매수량, 총금액,
적립포인트, 새해2배적립포인트, 사은품명, 포인트 범위

- panmae 테이블을 기준으로 포인트를 보여준다.
- 포인트는 구매한 금액 1원당 100의 포인트를 부여한다.
(단, 01월 01인 경우는 새해 이벤트로 인해 1원당 200의 포인트를 부여한다.)
- 적립포인트와 새해2배적립포인트를 모두 보여준다.
(이 경우, 이벤트 날인 01월 01일을 제외하고는 포인트가 동일 할 것이다.)
- 새해2배적립포인트를 기준으로 해당 포인트 기준으로 받을수 있는 사은품을 보여준다.
- 사은품 명 옆에 해당 사은품을 받을 수 있는 포인트의 범위를 함께 보여준다.

* 출력 양식과 컬럼 헤더에 표기되는 이름 확인!
*/

SELECT *
FROM panmae;

SELECT *
FROM product;

SELECT *
FROM gift;

SELECT 
    TO_CHAR(TO_DATE(pa.p_date), 'YYYY-MM-DD') 판매일자,
    pa.p_code 상품코드,
    pr.p_name 상품명,
    pr.p_price 상품가,
    pa.p_qty 구매수량,
    TO_CHAR(pa.p_total, '999,999,999') 총금액,
    TO_CHAR(pa.p_total*100, '999,999,999') 적립포인트,
    CASE
    WHEN '01' = SUBSTR(pa.p_date,7,2) THEN TO_CHAR(pa.p_total*200, '999,999,999')
    ELSE TO_CHAR(pa.p_total*100, '999,999,999')
    END 새해2배적립포인트,
    g.gname 사은품명,
    g.g_start 포인트start,
    g.g_end 포인트end
FROM panmae pa, product pr, gift g
WHERE pa.p_code  = pr.p_code 
AND
CASE
    WHEN (TO_CHAR(TO_DATE(pa.p_date), 'DD') = '01') THEN pa.p_total*200
    ELSE pa.p_total*100
END BETWEEN g.g_start AND g.g_end;



-------- 선생님

SELECT 
--    p.p_date 판매일자,
    TO_CHAR(TO_DATE(p.p_date), 'YYYY-MM-DD') 판매일자,
--    SUBSTR(p.p_date, 1, 4)||'-'||SUBSTR(p.p_date, 5, 2)||'-'||SUBSTR(p.p_date, 7, 2),
    p.p_code 상품코드,
    pr.p_name 상품명,
    TO_CHAR(pr.p_price, '9,999') 상품가,
    p.p_qty 구매수량,
    TO_CHAR(p.p_total, '9,999') 총금액,
    TO_CHAR(p.p_total*100, '999,999') 적립포인트,
--    TO_CHAR(p.p_total*200, '9,999,999') 새해2배적립포인트,
--    CASE
--       WHEN (TO_CHAR(TO_DATE(p.p_date), 'MMDD') = '0101') THEN TO_CHAR(p.p_total*200, '9,999,999')
--       ELSE TO_CHAR(p.p_total*100, '999,999')
--    END 새해2배적립포인트,
    TO_CHAR (DECODE( SUBSTR(p.p_date, 5, 4), '0101',p.p_total*200, p.p_total*100),'9,999,999')
    새해2배적립포인트,
    g.gname 사은품명,
    TO_CHAR(g.g_start, '999,999') 포인트START,
    TO_CHAR(g.g_end, '999,999') 포인트END
--    TO_CHAR(TO_DATE(p.p_date), 'MMDD')
FROM panmae p, product pr, gift g
WHERE p.p_code = pr.p_code
AND (DECODE( SUBSTR(p.p_date, 5, 4), '0101',p.p_total*200, p.p_total*100)) 
BETWEEN g.g_start AND g.g_end
ORDER BY p.p_date;


SELECT *
FROM panmae;

SELECT *
FROM product;

SELECT *
FROM gift;


