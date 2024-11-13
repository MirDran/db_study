---SEQ 시퀀스 
--여러개의 연속된 순차적인 값

CREATE TABLE seq_test
(
    no NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32)
);

SELECT * FROM seq_test;

-- 보고 수동으로 일일이 저장
INSERT INTO seq_test VALUES(1, '가이름');
-- 다음 가입자 이름 '나이름' 저장
-- 자동화는..?
INSERT INTO seq_test VALUES( 2, '나이름');

--서브쿼리로 갯수 활용
SELECT COUNT(*) FROM seq_test; -- 현재 저장된 갯수
SELECT COUNT(*)+1 FROM seq_test; -- 다음 저장할 차례 값

INSERT INTO seq_test VALUES ((SELECT COUNT(*)+1 FROM seq_test), '다이름');
INSERT INTO seq_test VALUES ((SELECT COUNT(*)+1 FROM seq_test), '라이름');
INSERT INTO seq_test VALUES ((SELECT COUNT(*)+1 FROM seq_test), '마이름');

-- 테이블 관리
--데이터 삭제로 관리하는 테이블

SELECT * FROM seq_test;
-- '다'탈퇴 -> 삭제
SELECT *
--DELETE 
FROM seq_test
WHERE no =3;

-- 오류남 
INSERT INTO seq_test VALUES ((SELECT COUNT(*)+1 FROM seq_test), '바이름');


--서브쿼리로 갯수 - no Pk 값을 따져보고 활용
SELECT no FROM seq_test; -- PK로 따지겠다
SELECT MAX(no) FROM seq_test; -- 제일 큰 PK 값
SELECT MAX(no)+1 FROM seq_test; -- 제일 큰 PK 값 다음 값

INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test),'바이름');
INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test),'사이름');

SELECT * FROM seq_test;

SELECT *
--DELETE 
FROM seq_test
WHERE no =7;

INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test),'아이름');

DELETE FROM seq_test;

INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test),'자이름');

SELECT NVL( MAX(no), 0)+1 FROM seq_test;

INSERT INTO seq_test VALUES ((SELECT NVL( MAX(no), 0)+1 FROM seq_test),'자이름');
INSERT INTO seq_test VALUES ((SELECT NVL( MAX(no), 0)+1 FROM seq_test),'차이름');
INSERT INTO seq_test VALUES ((SELECT NVL( MAX(no), 0)+1 FROM seq_test),'카이름');

SELECT *
--DELETE 
FROM seq_test
WHERE no =2;

INSERT INTO seq_test VALUES ((SELECT NVL( MAX(no), 0)+1 FROM seq_test),'타이름');

SELECT * FROM seq_test;

-- 순차적으로 중복되지 않는 값을 사용 -> 시퀀스

CREATE SEQUENCE sqe_test_pk_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10
CYCLE
CACHE 5;
--NOCYCLE;
--(CACHE 20)

DROP SEQUENCE sqe_test_pk_seq;

--시퀀스명.nextval -- 다음값 호출 (사용)
--시퀀스명.currval -- 현재값 확인

SELECT sqe_test_pk_seq.nextval FROM dual;
SELECT sqe_test_pk_seq.currval FROM dual;

CREATE SEQUENCE sqe_test_pk_seq
INCREMENT BY 1
START WITH 1; -- 만 써도 가능하다
-- MIN/MAX 체크 X
--NOCYCLE;
--(CACHE 20)


INSERT INTO seq_test VALUES (sqe_test_pk_seq.nextval,'A이름');
INSERT INTO seq_test VALUES (sqe_test_pk_seq.nextval,'B이름');

SELECT * FROM seq_test;
DELETE FROM seq_test;

INSERT INTO seq_test VALUES (sqe_test_pk_seq.nextval,'C이름');
INSERT INTO seq_test VALUES (sqe_test_pk_seq.nextval,'D이름');


SELECT * 
FROM user_sequences;

--시퀀스 값 확인
SELECT sqe_test_pk_seq.currval FROM dual; --현재 4 nextval은 5 1씩 증가하기 때문에
--1이 될 수 있도록 증가값을 변경
ALTER SEQUENCE sqe_test_pk_seq INCREMENT BY -10;
ALTER SEQUENCE sqe_test_pk_seq MINVALUE 0;
--시퀀스 1회 실행
SELECT sqe_test_pk_seq.nextval FROM dual;
--다시 증가값 설정 변경
ALTER SEQUENCE sqe_test_pk_seq INCREMENT BY 1;

--설정 완료 후 시퀀스 확인
SELECT sqe_test_pk_seq.nextval FROM dual;




