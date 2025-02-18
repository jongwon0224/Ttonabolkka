// 여행 기록, 리뷰
CREATE TABLE TRAVEL_LOGS(
	id NUMBER PRIMARY KEY,
	user_id VARCHAR2(255) NOT NULL,
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



/* 테이블 삭제
 *  drop table TRAVEL_LOGS;
 * 
 */

select * from TRAVEL_LOGS;