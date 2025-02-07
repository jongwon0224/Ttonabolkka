CREATE TABLE LIKES(
    id NUMBER Primary key,
    user_id Number NOT NULL,
    place_id NUMBER NOT NULL
);


--시퀀스 생성
CREATE SEQUENCE SEQ_LIKES_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_LIKES_PK;
*/


/*테이블 삭제
drop table likes;
*/

/*컬럼삽입 = user_id는 users테이블의 id값 참조 / place_id는 places테이블 id참조*/
INSERT INTO likes(id, user_id, place_id)
VALUES (SEQ_likes_PK.NEXTVAL, 1, 1);


select * from likes;

