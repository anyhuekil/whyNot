create table code(
	name VARCHAR2(50),
	value VARCHAR2(50)
);

select * from emp;


create table member(
	memid VARCHAR2(50) PRIMARY KEY,
	pass varchar2(30),
	name varchar2(50),
	point number,
	auth varchar2(20)
);
insert into member values('himan','7777','하이맨',10,'admin');
insert into member values('superman','8888','슈퍼맨',20,'user');
insert into member values('legend','9999','홍길동',50,'guest');
insert into member values('whyNot','whywhy','뭥미',777,'user');
commit;



CREATE TABLE product(
	name VARCHAR2(50),
	price NUMBER,
	cnt NUMBER
);



CREATE TABLE Quebank(
	no NUMBER,
	que VARCHAR2(100),
	coransw VARCHAR2(500),
	queType VARCHAR2(50)
);












create table Student(
	name VARCHAR2(50),
	grade NUMBER,
	sect NUMBER,
	kor NUMBER,
	eng NUMBER,
	math NUMBER
);






select * from student;