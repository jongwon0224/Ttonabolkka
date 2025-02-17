// 여행 기록, 리뷰
CREATE TABLE TRAVEL_LOGS(
	id NUMBER PRIMARY KEY,
	user_id NUMBER(2) NOT NULL,
    place_id NUMBER(2) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
    visited_date DATE,
    created_at DATE DEFAULT SYSDATE,
    file_name VARCHAR2(256)
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
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content, visited_date, created_at,file_name)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 1, 1, '경주여행제목1' , '경주여행내용1', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-16', 'YYYY-MM-DD'),null);
INSERT INTO TRAVEL_LOGS(id, user_id, place_id, title, content,visited_date, created_at, file_name)
VALUES (SEQ_TRAVEL_LOGS_PK.NEXTVAL, 1, 1, '경주여행제목2' , '경주여행내용2', TO_DATE('2025-01-02', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), null);


/* 테이블 삭제
 *  drop table TRAVEL_LOGS;
 * 
 */

select * from TRAVEL_LOGS;