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
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 0) + 1, '/img/cheomseongdae.webp');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/image/cheomseongdae/cheomseongdaeMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/image/cheomseongdae/cheomseongdaeSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/image/cheomseongdae/cheomseongdaeSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/image/cheomseongdae/cheomseongdaeSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (1, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 1), 1) + 1, '/image/cheomseongdae/cheomseongdaeSub4.jpg');


INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 0) + 1, '/img/bulguksa.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 1) + 1, '/image/bulguksa/bulguksaMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 1) + 1, '/image/bulguksa/bulguksaSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 1) + 1, '/image/bulguksa/bulguksaSub2.JPG');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 1) + 1, '/image/bulguksa/bulguksaSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (2, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 2), 1) + 1, '/image/bulguksa/bulguksaSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 0) + 1, '/img/seokguram.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 1) + 1, '/image/seokguram/seokguramMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 1) + 1, '/image/seokguram/seokguramSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 1) + 1, '/image/seokguram/seokguramSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 1) + 1, '/image/seokguram/seokguramSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (3, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 3), 1) + 1, '/image/seokguram/seokguramSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 0) + 1, '/img/gyeongjuworld.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 1) + 1, '/image/gyeongjuworld/gyeongjuworldMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 1) + 1, '/image/gyeongjuworld/gyeongjuworldSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 1) + 1, '/image/gyeongjuworld/gyeongjuworldSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 1) + 1, '/image/gyeongjuworld/gyeongjuworldSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (4, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 4), 1) + 1, '/image/gyeongjuworld/gyeongjuworldSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 0) + 1, '/img/californiabeach.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 1) + 1, '/image/californiabeach/californiabeachMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 1) + 1, '/image/californiabeach/californiabeachSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 1) + 1, '/image/californiabeach/californiabeachSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 1) + 1, '/image/californiabeach/californiabeachSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (5, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 5), 1) + 1, '/image/californiabeach/californiabeachSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 0) + 1, '/img/birdpark.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 1) + 1, '/image/birdpark/birdparkMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 1) + 1, '/image/birdpark/birdparkSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 1) + 1, '/image/birdpark/birdparkSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 1) + 1, '/image/birdpark/birdparkSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (6, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 6), 1) + 1, '/image/birdpark/birdparkSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 0) + 1, '/img/hwangroad.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 1) + 1, '/image/hwangroad/hwangroadMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 1) + 1, '/image/hwangroad/hwangroadSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 1) + 1, '/image/hwangroad/hwangroadSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 1) + 1, '/image/hwangroad/hwangroadSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (7, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 7), 1) + 1, '/image/hwangroad/hwangroadSub4.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 0) + 1, '/img/pinkflower.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 1) + 1, '/image/pinkflower/pinkflowerMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 1) + 1, '/image/pinkflower/pinkflowerMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 1) + 1, '/image/pinkflower/pinkflowerMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 1) + 1, '/image/pinkflower/pinkflowerMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (8, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 8), 1) + 1, '/image/pinkflower/pinkflowerMain.jpg');



INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 0) + 1, '/img/slum.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 1) + 1, '/image/slum/slumMain.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 1) + 1, '/image/slum/slumSub1.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 1) + 1, '/image/slum/slumSub2.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 1) + 1, '/image/slum/slumSub3.jpg');
INSERT INTO PLACES_IMG(id, no, image_url)
VALUES (9, NVL((SELECT MAX(no) FROM PLACES_IMG WHERE id = 9), 1) + 1, '/image/slum/slumSub4.jpg');


/* 테이블 삭제
 *  drop table PLACES_IMG;
 * 
 */

select * from PLACES_IMG;