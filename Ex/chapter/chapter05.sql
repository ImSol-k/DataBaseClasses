-- 유저생성 -----------------------------------
create user 'webdb'@'%' identified by '1234';
-- 비번변경 -----------------------------------
alter user 'webdb'@'%' identified by 'webdb';
flush privileges; #생략가능
-- 모든권한부여 --------------------------------
grant all privileges on webdb.* to 'webdb'@'%';
-- 계정삭제 -----------------------------------
drop user 'webdb'@'%';
-- DB 생성 -----------------------------------
create database web_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption = 'n';
show databases;
-- DB 삭제 -----------------------------------
drop database web_db;
-- book생성 ----------------------------------
drop user if exists 'book'@'%'; #계정이 있다면 삭제
-- 새로생성
create user 'book'@'%' identified by 'book';
grant all privileges on *.* to 'book'@'%';
create database book_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption = 'n';
-- sori -------------------------------------
create user 'sori'@'localhost' identified by 'sori';
grant select on hrdb.* to 'sori'@'localhost'; #권한 부분부여