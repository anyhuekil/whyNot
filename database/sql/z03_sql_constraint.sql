/*
데이터 무결성 제약 조건?
데이터의 신뢰성의 확보하기 위하여, 테이블 생성시, 컬럼 속성값으로
지정하는 것을 말한다.
#제약조건 5가지..
1) not null : null 허용하지 않는다.
2) unique : 동일값의 입력을 허용하지 않는다.
3) primary key : not null과 unqique를 처리해야 하는 것..
4) foreign key : 참조되는 테이블의 컬럼값이 존재해야 입력이 가능
5) check : 저장 가능한 데이터값의 범위나 조건을 지정..

1. not null
	사원 테이블에 사원의 정보를 저장할 때, 반드시 사원번호와 사원이름이 저장되어야 입력되도록
	처리하고자 할때..
	create table 테이블명(컬럼명 컬럼type not null, ..., ...);

*/
create table emp02(
	empno number(4) not null,
	ename VARCHAR2(10) not null,
	job varchar2(9),
	deptno number(4)
);
-- 제약조건에 합당해야지 데이터가 입력이 가능하게 처리 됨..
insert into emp02 values(1000,'홍길동','대리',30);
select * from emp02;
/*
unique 제약조건 : 데이터 입력에 있어서, 동일한 데이터 입력을 허용하지 않는 것을 말한다.
emp03 테이블에  empno에 unique제약조건으로 동일한 사번을 입력하지 못하게 처리하세요..
*/
create table emp03(
	empno number(4) unique,
	ename varchar(25),
	mgr number(4)
);
insert into emp03 values(1000,'himan',null);
insert into emp03 values(1001,'himan2',7788);
insert into emp03 values(1002,null,null);
insert into emp03 values(1003,'himan3',8888);
select * from emp03;
/*
primary key : not null(반드시 데이터 입력해야), unique(반드시 유일한 데이터)
	의 내용을 둘다 처리할 때, 쓰인다. 주로 메인테이블의 key값을 설정할 때 활용된다.
	ex) memeber테이블에 memberid값을  primary key로 설정하세요..
*/
create table memeber(
	memberid varchar(20) primary key,
	pass varchar(20),
	name varchar(50),
	loc varchar(100)
);
insert into memeber values('1111','7777','홍길동','서울강남');
insert into memeber values('1112','7777','홍길동','서울강남');
insert into memeber values(null,'7777','홍길동','서울강남');
/*
foreign key : 참조되는 테이블이 반드시 값을 입력해야 하는 경우를 말한다.

*/
select * from emp;
select * from dept;
drop table DEPT_REF;
CREATE TABLE DEPT_REF
(
   DEPTNO   NUMBER (2) primary key,
   DNAME    VARCHAR2 (14),
   LOC      VARCHAR2 (13)
);

CREATE TABLE EMP_REF
(
   EMPNO      NUMBER (4) primary key,
   ENAME      VARCHAR2 (10),
   JOB        VARCHAR2 (9),
   MGR        NUMBER (4),
   HIREDATE   DATE,
   SAL        NUMBER (7, 2),
   COMM       NUMBER (7, 2),
   DEPTNO     NUMBER (2) REFERENCES DEPT_REF(DEPTNO)
);
--  컬럼 컬럼TYPE references 참조할테이블명(참조할컬럼명)
insert into DEPT_REF values(20, '총무','경기');
select * from DEPT_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1000,'홍길동',10); 
select * from EMP_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1002,'마길동',20); 
/* 숙제
참조키 관계에 있는 테이블 구성하기 
메인테이블  student_main(id, pass, name) :아이디, 패스워드, 이름
서브테이블  student_point(id, subject, point); 아이디, 과목, 점수
  student_main 과 student_point  id로  foreign key 관계를 설정하고,
  student_main에 데이터가 있어야만 student_point를 입력할 수 있게끔 처리
*/
/*
check 제약 조건
입력된는 값을 체크하여 설정된 값 이외의 값이 들어오지 못하게 조건을 설정하는 것을 말한다.
ex) 사원테이블에 gender라는 컬럼을 두고, 여기에 'M', 'F' 두개의 값 외에는 입력 되지 
못하게 처리하자.
*/
create table emp04(
 empno number(4),
 ename varchar2(10),
 gender varchar2(1) check(gender in('M','F'))
);
insert into emp04 values(9998,'신길동','D');
select * from emp04;





