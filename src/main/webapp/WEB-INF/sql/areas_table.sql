/*테이블 생성*/
CREATE TABLE AREAS(
    id NUMBER Primary key,
    name VARCHAR2(255),
    image VARCHAR2(255) NOT NULL
);

/*시퀀스 생성*/
CREATE SEQUENCE SEQ_AREAS_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_AREAS_PK;
*/


/*areas테이블 컬럼 삽입*/
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '경주', '/img/경주.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '부산' , '/img/부산.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '속초' , '/img/속초.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '서울' , '/img/서울.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '인천' , '/img/인천.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '여수' , '/img/여수.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '제주도' , '/img/제주도.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '강릉' , '/img/강릉.jpg');
INSERT INTO AREAS(id, name, image)
VALUES (SEQ_AREAS_PK.NEXTVAL, '대천' , '/img/대천.jpg'');



/* 테이블 삭제
drop table areas;
*/

select * from areas;



