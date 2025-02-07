CREATE TABLE CATEGORIES(
    id NUMBER Primary key,
    name VARCHAR2(255)
);


/*시퀀스 생성*/
CREATE SEQUENCE SEQ_CATEGORIES_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_CATEGORIES_PK;
*/


/*카테고리 테이블 컬럼 삽입*/
INSERT INTO CATEGORIES(id, name)
VALUES(SEQ_CATEGORIES_PK.NEXTVAL, '관광지');
INSERT INTO CATEGORIES(id, name)
VALUES(SEQ_CATEGORIES_PK.NEXTVAL, '테마파크');
INSERT INTO CATEGORIES(id, name)
VALUES(SEQ_CATEGORIES_PK.NEXTVAL, '핫플레이스');


/* 테이블 삭제
drop table categories;
*/


select * from categories;