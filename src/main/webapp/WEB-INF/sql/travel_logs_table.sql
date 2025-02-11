// 여행 기록, 리뷰
CREATE TABLE TRAVEL_LOGS(
	id NUMBER PRIMARY KEY,
	user_id NUMBER(2) NOT NULL,
    place_id NUMBER(2) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
    image_url VARCHAR2(255),
    visited_date DATE,
    created_at DATE DEFAULT SYSDATE
);


/*시퀀스 생성*/
CREATE SEQUENCE SEQ_TRAVEL_LOGS_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_TRAVEL_LOGS_PK;
*/

/*컬럼삽입*/
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, image_url, visited_date, created_at)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 1, 1, '경주여행제목1' , '경주여행내용1', '/img/cheomseongdae.webp', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, image_url, visited_date, created_at)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 1, 1, '경주여행제목2' , '경주여행내용2', '/img/cheomseongdae.webp', TO_DATE('2025-01-02', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'));
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, image_url, visited_date, created_at)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 2, 1, '경주여행제목3' , '경주여행내용3', '/img/cheomseongdae.webp', TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'));
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, image_url, visited_date, created_at)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 2, 1, '경주여행제목4' , '경주여행내용4', '/img/cheomseongdae.webp', TO_DATE('2025-01-04', 'YYYY-MM-DD'), SYSDATE);
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, image_url, visited_date, created_at)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 3, 1, '경주여행제목5' , '경주여행내용5', '/img/cheomseongdae.webp', TO_DATE('2025-01-05', 'YYYY-MM-DD'), SYSDATE);



/* 테이블 삭제
drop table TRAVEL_LOGS;
 */

select * from TRAVEL_LOGS;