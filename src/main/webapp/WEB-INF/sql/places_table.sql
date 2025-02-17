CREATE TABLE PLACES(
	id NUMBER PRIMARY KEY,
	name VARCHAR2(255) NOT NULL,
    description VARCHAR2(3000) NOT NULL,
    area_id NUMBER NOT NULL,
    address VARCHAR2(255) NOT NULL,
    latitude NUMBER(9,6),
    longitude NUMBER(9,6),
<<<<<<< HEAD
    category_id NUMBER NOT NULL
=======
    category_id NUMBER NOT NULL,
    image_url VARCHAR2(255) NOT NULL,
    image_url VARCHAR2(255),
    image_url VARCHAR2(255),
    image_url VARCHAR2(255),
    image_url VARCHAR2(255)

>>>>>>> ad6261fdbc1110a0de12e29a511b96648cb123e0
);


/*시퀀스 생성*/
CREATE SEQUENCE SEQ_PLACES_PK
START WITH 1
INCREMENT BY 1
NOCYCLE;


/*시퀀스 삭제
drop sequence SEQ_PLACES_PK;
*/

/*컬럼삽입*/
INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '첨성대', '경주 관광지 첨성대입니다', 1, '주소', 1);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '불국사', '경주 관광지 불국사입니다', 1, '주소', 1);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '석굴암', '경주 관광지 석굴암입니다', 1, '주소', 1);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '경주월드', '경주 테마파크 경주월드입니다', 1, '주소', 2);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '캘리포니아 비치', '경주 테마파크 캘리포니아 비치입니다', 1, '주소', 2);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '경주 버드파크', '경주 테마파크 경주 버드파크입니다', 1, '주소', 2);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '황리단길', '경주 핫플레이스 황리단길입니다', 1, '주소', 3);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '첨성대 핑크뮬리', '경주 핫플레이스 핑크뮬리입니다', 1, '주소', 3);

INSERT INTO PLACES(id, name, description, area_id, address, category_id)
VALUES (SEQ_PLACES_PK.NEXTVAL, '추억의 달동네', '경주 핫플레이스 추억의 달동네입니다', 1, '주소', 3);


/* 테이블 삭제
 *  drop table places;
 * 
 */

select * from places;