--24.11.14 Moning Quiz

/*
1. 다음 두 명령어는 어떤 기능을 수행하는 명령어인지 작성하고,
두 기능의 차이점이 있다면 설명하시오.
DELETE FROM 테이블명;
-----ROLLBACK 가능, 특정 테이터 삭제 가능 DML

TRUNCATE TABLE 테이블명;
-----ROLLBACK 불가능, 통으로 삭제 DDL
*/


/*
2. 다음 조건에 따라 테이블을 생성하시오.
테이블명 : T_MEMBER_POINT

*내부 컬럼
ID : 숫자형 6자리
순번 : 숫자형 6자리
멤버ID : 문자형 24바이트, Null 안됨(꼭 입력해야함)
점수 : 숫자형 3자리
채점일시 : 날짜형, 단 입력된 값이 없을 경우 입력(현재)시간을 기본값으로 설정
※ 기본키(PK) : ID와 순번의 조합
*/

CREATE TABLE T_MEMBER_POINT
(
    id NUMBER(6),
    no NUMBER(6),
    memid VARCHAR2(24) NOT NULL,
    score NUMBER(3),
    sdate date DEFAULT SYSDATE,
    CONSTRAINT dual_pk PRIMARY KEY (id, no)
);

/*
3. 다음 조건에 맞는 시퀀스를 생성하시오. -> 생성한 시퀀스는 id 컬럼에 사용
시퀀스명 : T_MEMBER_POINT_PK_SEQ
*상세조건
1부터 시작하며 1씩 증가한다.
값의 범위는 1~999999
순환하지 않도록 한다.
*/

CREATE SEQUENCE T_MEMBER_POINT_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE

/*;
4. 생성한 시퀀스의 값을 불러서 임의의 데이터를 저장해보시오.
(*순번은 각 멤버ID 별로 자동 계산되어 저장하도록 해주세요)
- 시퀀스 사용 -> id
- 순번(no) -> 해당 학생이 시험을 치룬 회차 계산되서 저장
--;
*/
;

INSERT INTO T_MEMBER_POINT(id, no, memid,score, sdate)
VALUES (T_MEMBER_POINT_PK_SEQ.nextval,
(SELECT COUNT(*)+1 FROM T_MEMBER_POINT WHERE memid = 'A'),
'A', 76, SYSDATE);

INSERT INTO T_MEMBER_POINT(id, no, memid,score, sdate)
VALUES (T_MEMBER_POINT_PK_SEQ.nextval,
(SELECT COUNT(*)+1 FROM T_MEMBER_POINT WHERE memid = 'B'),
'B', 78, SYSDATE);

INSERT INTO T_MEMBER_POINT(id, no, memid,score, sdate)
VALUES (T_MEMBER_POINT_PK_SEQ.nextval,
(SELECT COUNT(*)+1 FROM T_MEMBER_POINT WHERE memid = 'C') ,
'C', 80, SYSDATE);

SELECT * FROM T_MEMBER_POINT;
SELECT T_MEMBER_POINT_PK_SEQ.nextval FROM dual;
SELECT T_MEMBER_POINT_PK_SEQ.currval FROM dual;

DELETE T_MEMBER_POINT;
DROP SEQUENCE T_MEMBER_POINT_PK_SEQ;


--
INSERT INTO T_MEMBER_POINT(id,no,memid,scoer)
VALUES (T_MEMBER_POINT_PK_SEQ.nextval,



--------------------------------------------------------------------------------