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
