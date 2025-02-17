CREATE TABLE USERS(
    userno NUMBER Primary key,
    id VARCHAR2(50) UNIQUE,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(255) NOT NULL,
    tel VARCHAR2(100) NOT NULL
);



/*시퀀스생성*/
CREATE SEQUENCE SEQ_USERS_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_USERS_PK;
*/


/*테이블 삭제
drop table users;
*/


/*컬럼 삽입 = user_status구분 => 1:회원, 2:관리자, 3:휴먼, 4:정지 etc...*/
INSERT INTO users(id, username, nickname, email, password, user_status)
VALUES (SEQ_users_PK.NEXTVAL, '황종원', '황종투', 'aaa@naver.com', '123', 1);

INSERT INTO users(id, username, nickname, email, password, user_status)
VALUES (SEQ_users_PK.NEXTVAL, '황황원', '황종쓰리', 'bbb@naver.com', '456', 1);






select * from users;
