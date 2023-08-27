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
	
select * from product where cate in (select cate from product where pno=1) order by random() limit 4;


select * from product;
select * from serve;

select r.pno, r.amount-(case when s.amount is not null then s.amount else 0 end) as amount, rprice from receive r left outer join serve s on(r.pno=s.pno);

select r.pno, sum(r.amount)-sum(s.amount) as amount, avg(rprice) from receive r left outer join serve s on (r.pno=s.pno) group by r.pno, s.pno;
	
select pname, cname, i.rprice, i.amount as amount, price 
from product p left outer join receive r on(p.pno=r.pno) left outer join category c on(p.cate=c.cno) left outer join inventory i on(i.pno=p.pno);


-- 입고 테이블 생성
create table receive(
	rno serial primary key,
	pno integer not null unique, 
	amount integer default 1,
	rprice integer default 1000,
	resdate timestamp default current_timestamp);

-- 입고 등록 쿼리문
insert into receive(pno, amount, rprice)
values (1, 10, 15000)
on conflict(pno)
do update
set amount = (select amount from receive where pno=1)+10, rprice = ((select rprice from receive where pno=1) + 10000) / 2

-- 출고 테이블 생성
create table serve(sno serial primary key,
pno integer not null, amount integer default 1,
sprice integer default 1000,
resdate timestamp default current_timestamp);

insert into serve values(default, 1, 2, 15000, default);

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
	cartno serial primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer not null
);

select cartno, cid, c.pno, pname, amount, price from cart c, product p where c.pno=p.pno and cid='kimname1';

-- 재고 처리 뷰
create view inventory as (select r.pno, r.amount-(case when s.amount is not null then s.amount else 0 end) as amount, rprice from receive r left outer join serve s on(r.pno=s.pno));
select * from inventory;
drop view inventory;