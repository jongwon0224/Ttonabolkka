CREATE TABLE PLACES_IMG (
    id NUMBER NOT NULL,  -- 장소 ID (PLACES 테이블의 ID를 참조)
    no NUMBER NOT NULL,  -- 사진 순번 (1부터 시작)
    image_url VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_places FOREIGN KEY (id) REFERENCES PLACES(id) ON DELETE CASCADE,  -- ✅ PLACES 테이블과 연결
    CONSTRAINT pk_places_img PRIMARY KEY (id, no)  -- 복합 기본키: id와 no 컬럼을 결합
);
/*PLACES_IMG 테이블은 CONSTRAINT 없이 생성 X*/


/*컬럼삽입*/
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/cheomseongdae.webp');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/bulguksa.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/seokguram.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/gyeongjuworld.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/californiabeach.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/birdpark.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/hwangroad.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/pinkflower.jpg');

INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/img/slum.jpg');

/* 테이블 삭제
 *  drop table PLACES_IMG;
 * 
 */

select * from PLACES_IMG;