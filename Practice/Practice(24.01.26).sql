-- create table ----------------------------------------------
create table author(
	author_id	int			auto_increment	primary key,
    author_name	varchar(50) not null,
    author_desc varchar(50));
select * from author;
create table book(
	book_id	int		auto_increment primary key,
    title 	varchar(50) not null,
    pubs 	varchar(50),
    pub_date date,
    author_id int,
    constraint book_fk foreign key (author_id)
    references author (author_id));
select * from book;
-- create data -----------------------------------------------
insert into author values (null, '김영하', '알쓸신잡');
insert into book values (null, '26년', '재미주의','2012-02-04', 5);
-- 출력 -------------------------------------------------------
select b.book_id, b.title, b.pubs, b.pub_date, b.author_id,
       a.author_name, a.author_desc
from book b
join author a
where b.author_id = a.author_id;
-- 변경 -------------------------------------------------------
update author
set author_desc = '서울특별시'
where author_id = 4;

