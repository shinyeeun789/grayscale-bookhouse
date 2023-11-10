CREATE DATABASE grayscale;
USE grayscale;

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

-- QnA 테이블 생성
create table qna(
	qno serial primary key,
	title varchar(200) not null,
	content varchar(1000),
	author varchar(16) not null,
	resdate timestamp,
	cnt integer default 0,
	lev integer,
	par integer
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

-- 상품 테이블 생성
create table product(
	pno serial primary key,
	cate varchar(3) not null, 
	prono varchar(10) not null,
	pname varchar(100) not null, 
	pcomment varchar(2000) not null,
	plist varchar(2000), 
	price integer default 1000,
	imgsrc1 varchar(256) default 'noimg.jpg',
	imgsrc2 varchar(256) default 'noimg.jpg',
	imgsrc3 varchar(256) default 'noimg.jpg',
	resdate timestamp default current_timestamp);


-- 입고 테이블 생성
create table receive(
	rno serial primary key,
	pno integer not null unique, 
	amount integer default 1,
	rprice integer default 1000,
	resdate timestamp default current_timestamp);

-- 출고 테이블 생성
create table serve(
	sno serial primary key,
	pno integer not null, 
    amount integer default 1,
	sprice integer default 1000,
	resdate timestamp default current_timestamp
);

-- 카테고리 테이블 생성
create table category(
	cno varchar(4) primary key,
	cname varchar(100) not null
);

-- 카테고리 등록
insert into category values('A', '교과서');
insert into category values('B', '참고서');
insert into category values('C', '문제집');
insert into category values('D', '기타');
insert into category values('E', '해외서적');

-- 카트 테이블 생성
create table cart(
	cartno varchar(30) primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer not null
);

-- 재고 처리 뷰
create view inventory as (select r.pno, r.amount-(case when s.amount is not null then s.amount else 0 end) as amount, rprice from receive r left outer join serve s on(r.pno=s.pno));
select * from inventory;
drop view inventory;

-- 결제 테이블 생성
create table payment(
	sno serial primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer default 1,
	pmethod varchar(100),
	pcom varchar(100),
	cnum varchar(100),
	payprice integer default 1000
);

-- 배송 테이블 생성
create table delivery(
	dno serial primary key,
	sno integer not null default 0, 
	cid varchar(20) not null,
	daddr varchar(300) not null, 
	custel varchar(13) not null,
	pcom varchar(100),
	ptel varchar(13),
	pstate integer default 0,	
	sdate timestamp default current_timestamp,
	rdate varchar(13),
	bcode varchar(30)
);

-- 리뷰 테이블 생성
create table review(
	rno serial primary key,
	sno integer not null,
	cid varchar(20) not null,
	pno integer not null,
	content varchar(500) not null,
	star integer default 5,
	resdate timestamp default current_timestamp
);

-- 상품 별 매출액 뷰 생성
create view profit as (select pno, sum(sprice*amount) as tot from serve group by pno EXCEPT select pno, sum(rprice*amount) as tot from receive group by pno);