-- 작가테이블 만들기 ---------------------------
create table author(
	author_id 	int				primary key,
    author_name	varchar(100)	not null,
    author_desc varchar(500));
-- 책 테이블 만들기 ----------------------------
create table book(
	book_id 	int			 primary key,
    title 		varchar(100) not null,
    pubs 		varchar(100),
    pub_date 	datetime,
    author_id	int,
    constraint book_fk foreign key (author_id)
    references author (author_id));
-- 작가 등록 ---------------------------------
select * from author;
-- 묵시적 방법
-- 테이블 생성시 정의한 순서에 따라 값 지정
insert into author values (5,'이준기','세계최강');
insert into author values (3, '김소리', null);
-- 명시적 방법
-- 지정되지 않은 컬럼은 null자동입력
insert into author(author_id, author_name) 
values (4,'정우성');
-- 레코드 변경 --------------------------------
update author 
set author_name = '기안84',
	author_desc = '웹툰작가'
where author_id = 1;
-- 일부만 변경 가능
update author 
set author_name = '김도현'
where author_id = 3;

