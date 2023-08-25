drop table custom;

-- 회원 테이블 생성
create table custom(
	id varchar(20) primary key,
	pw varchar(300) not null, 
	name varchar(100) not null,
	point integer default 0, 
	grade varchar(4) default 'F',
	tel varchar(11) not null, 
	email varchar(100) not null,
	birth date not null,
	addr varchar(100) not null,
	postcode varchar(10) not null,
	regdate timestamp default current_timestamp
);

select * from custom;

-- 공지사항 테이블 생성
create table notice(
	no serial primary key, 
	title varchar(200) not null, 
	content varchar(1000),
	resdate timestamp default current_timestamp,
	visited integer default 0
);

select * from notice;

insert into notice 
values (default, '임시글1', '임시글1의 내용입니다.', default, default);
insert into notice 
values (default, '더미글2', '더미글2의 내용입니다.', default, default);
insert into notice 
values (default, '임시글3', '임시글3의 내용입니다.', default, default);
insert into notice 
values (default, '더미글4', '더미글4의 내용입니다.', default, default);
insert into notice 
values (default, '테스트글5', '테스트글5의 내용입니다.', default, default);
insert into notice 
values (default, '임시글6', '임시글6의 내용입니다.', default, default);
insert into notice 
values (default, '테스트글7', '테스트글7의 내용입니다.', default, default);
insert into notice
values (default, '더미글8', '더미글8의 내용입니다.', default, default);
insert into notice
values (default, '공지사항테스트9', '공지사항테스트글9의 내용입니다.', default, default);
insert into notice
values (default, '공지사항10', '공지사항글10의 내용입니다.', default, default);
insert into notice
values (default, '임시글11', '임시글11의 내용입니다.', default, default);
insert into notice 
values (default, '더미글12', '더미글12의 내용입니다.', default, default);

select * from notice;

