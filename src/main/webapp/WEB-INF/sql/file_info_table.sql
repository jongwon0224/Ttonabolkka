// 여행 기록, 리뷰 사진
CREATE TABLE FILE_INFO (
	file_name VARCHAR2(256),
	original_file_name VARCHAR2(256),
	file_path VARCHAR2(256),
	url_file_path VARCHAR2(256)
);

/* 테이블 삭제
drop table FILE_INFO;
 */

select * from FILE_INFO;