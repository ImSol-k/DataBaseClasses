-- 테이블 생성 ---------------------------------
create table book(
	book_id		int,
    title		varchar(50),
    author 		varchar(20),
    pub_date 	datetime
); 
show tables;
select * from book;
-- 컬럼 수정 -----------------------------------
-- 컬럼 추가
alter table book add pubs varchar(50);
-- 컬럼 데이터변경
alter table book modify title varchar(100);
-- 컬럼명 변경
alter table book rename column title to subject;
-- 컬럼삭제 
alter table book drop author;
-- 테이블 수정 ---------------------------------
rename table book to article;
select * from article;
-- 테이블 삭제 ---------------------------------
drop table article;

