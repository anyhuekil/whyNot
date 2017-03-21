
/*
1. DML : Data Maniplulation Language
1) select : 조회시 사용.
2) insert : 데이터 입력시 사용.
   insert into 테이블명 values(데이터1, 테이터2, 테이터3);
   
*/
select * from dept;
/*
테이블 복사하기..
create table 새로운테이블명
as select * from 복사할테이블명;
*/
create table dept01
as select * from dept;
select * from dept01;
/*
데이터 입력1)
ex) insert into dept01 values(50,'총무부','서울');
*/
insert into dept01 values(50,'총무부','서울');
select * from dept01;
commit; -- 확정처리, 재접속하거나 다른 사용자도 변경된 데이터를 볼 수 있게.
/*
데이터 입력2
insert into 테이블명(변경할컬럼명1, 변경할 컬럼명2) 
           values(첫번째입력할데이터,두번째입력할 데이터);
ex) dept01테이블에서 deptno만 60을 입력한다.
    dept01테이블에서 deptno와 loc만 입력한다.
*/
insert into dept01(deptno) values(60);
select * from dept01;
insert into dept01(deptno, loc) values(70,'인천');
/*
3) update : 입력되어 있는 데이터 내용중, 변경이 필요한 부분을
	수정처리한다.
	update 테이블명
	  set 변경하고자하는컬럼명1=변경할데이터,
	  	  변경하고자하는컬럼명2=변경할데이터
	 where 변경하고자하는 조건(컬럼명=조건데이터);
*/
select * from dept01;
-- dept01에 deptno가 60을 조건으로 하는 데이터를 dname 인사, loc 대전으로
-- 변경처리.
update dept01
  set dname='인사',
      loc='대전'
where deptno=60;
select * from dept01;	  
-- 확인예제..
-- select * from emp;
-- emp01이라는 복사 테이블을 만들고
-- 1) empno가 가장 많은 번호보다 +1해서, ename과 job, sal를 입력하세요
-- 2) 그외에 컬럼 mrg, hirdate(sysdate-현재날짜로수정), deptno는 40으로 수정처리하세요
select * from emp;
create table emp01
as select * from emp;
select max(empno)+1 from emp01;
-- 7935
insert into emp01(empno, ename, job, sal) 
          values(7935, '홍길동','SUPERMAN',5000);
commit;		  
SELECT * FROM emp01 where empno=7935;
update emp01
   set mgr=7777,
       hiredate=sysdate,
	   deptno=40
where empno=7935;
/* 숙제
emp03 복사테이블 생성
1. 입력  empno의 가장 작은수보다 -1, mgr:cleark의 mgr입력, sal:평균연봉, 
   comm:전체comm의 합계
2. 수정 ename:'신길동', job은 SUPERMAN, hirdate는 최근에 입사일+1
*/
select * from  emp;
/*
4. delete : 특정 조건의 데이터를 삭제처리하는 구문
	delete [없음] from 테이블명
	where 조건[컬럼명 = 조건데이터]
*/
-- DNAME이 'SALES'인 데이터를 DEPT01에서 삭제하시오..
DELETE FROM dept01
where DNAME='SALES';
-- 확인예제 deptno가 50이상인 데이터를 모두 삭제하시오..
select * from dept01;
delete from dept01
where deptno>=50;
-- emp01테이블 comm이 null이고, deptno가 20인 데이터를 삭제하세요.
delete from emp01
where comm is null
and deptno=20;
/*
Transaction(트랜잭션) : 데이터베이스에서 처리의 한 단위를 의미하며, 
여러개의 sql문의 하나의 논리적 작업 단위를 처리하는데 이를 의미하기도 한다.
TCL(Trasaction Control Language) : 이러한 트랜잭션을 제어를 위한 명령어..
 commit : 데이터의 dml을 통해 수정,삭제, 입력된 내용을 확정처리..
 rollback : 데이터를 commit하기전에 수정 삭제 입력된 내용을 원복처리..
 savepoint : 데이터를 특정시점으로 원복처리하고자 할때, 시점을 save하는 것을 말한다.
*/
select * from dept01;
-- 1) dept01테이블에 deptno 30 '총무' '강남'을 입력한 뒤, rollback처리를 해본다.
-- 2) dept01테이블에 deptno 40 '인사' '대전'을 입력한뒤,
--        commit하고  재접속한 경우와 commit하지 않고 재접속한 경우 데이터의 변경 내용을
--        확인한다.
insert into dept01 values(30,'총무','강남');
rollback;   -- 데이터가 입력되기 전으로 돌아가는 것을 확인할 수 있다.
 insert into dept01 values(50,'인사1','대전1');
-- db접속을 끊는다.
-- 외부에서 comit하기 전에는 데이터가 변경 원복이 된다.
-- tool에 따라 autocommit이 발생하는 경우가 있다..
select * from emp01;

/*
DDL :data definition language
테이블 구조 생성, 변경 및 삭제하는 것을 말한다.
크게..
1. 테이블 구조를 신규로 생성하는 create table
2. 테이블 구조를 변경하는 alter table
3. 테이블 구조를 삭제 drop table
4. 기타  -  truncate, rename 테이블명
*/
/*
1. create table(테이블생성)
	create table 테이블명(컬럼명 datatype 기타제약조건,
	                       ...      );
	1) datatype
		char(size) : 고정형 문자열, 문자열의 크기가 고정된 것으로
				큰데이터가 들어올 수 없지만, 작은데이터는 지정된 크기로 저장된다.
		varchar2(size) : 가변형 문자열, 데이터의 최대 크기를 지정하면,
				그 데이터 이하의 크기가 가변적으로 저장될 수 있다.
		number(전체자리수, 소수점이하자리수) : 숫자를 저장하는 data type,
				number(숫자), number( 숫자, 0) : 정수형 data type 저장.
				소수점이하자리수를 정해주면 실수형 데이터를 저장할 수 있다.
		date : 날짜를 저장하는 데이터 type (날짜+시분초)
		long : 4000byte이상의 문자열을 저장 할때 활용되는 데이터타입.최고치 2gb
		lob : 2g이하 바이너리(모든 파일저장가능) 데이터 저장
			

	1) 테이블 생성하기.
		create table 테이블명(컬럼명 데이터type)
		ex) emp10라는 테이블에 컬럼명 empno 정수형, ename 가변문자형, sal 실수형으로
			만들고자 한다.			
*/
	create table emp10( empno number(4), ename varchar2(20), sal number(7,2) );
/*
과제 login인 하는 화면을 만들고 id와 password을 체크하고, 다음 화면에서
	id@@@ 님 환영합니다. 남은 point는 @@@ 입니다. 라는 내용이 나타난다고 한다.
	이에 필요로 하는 테이블과 테이블 구조를 만드세요..
*/
/*테이블 구조 변경하기.
1. 테이블의 새로운 컬럼을 추가 할 때 - add column
2. 테이블에 컬럼을 수정할 때 - modify column
3. 테이블에 컬럼을 삭제할 때 - drop column

## 기본 형식..
alter table 테이블이름 add(컬럼명 데이터type)
ex) emp01에 job이라는 이름으로 가변형문자9가 들어가는 컬럼을 추가한다..
*/
select * from emp10;
alter table emp10 add(job varchar2(9));
-- 확인 emp10 날짜형데이터 createDate, 실수형데이터7,3 추가할려고 한다. 
alter table emp10 add(createDate date, sal2 number(7,3));
/*
테이블 컬럼 수정
alter table 테이블명
modify(변경할컬럼명 변경할데이터type);

ex) emp10테이블의 sal2 를 문자형으로 변경하고자 한다.

*/
alter table emp10
modify(sal2 varchar2(10));
/*
테이블에서 data type변경의 한계
1. 데이터 있는 경우
	1) 다른 data type으로 변경이 불가능..
	2) 같은 data type이라도 현재 보다 작은 데이터 type변경은 불가능.
2. 데이터 없는 경우
	type과 크기변경이 자유롭다.. 
*/
/*
테이블의 컬럼 삭제..
alter table 테이블명
drop column  컬럼명;

ex) emp10에서 sal2 컬럼을 삭제 처리한다..
*/
alter table emp10
drop column sal2;
select * from emp10;
/*
테이블명 변경
alter table 기존테이블명 rename to 새로운테이블명.
ex) emp10테이블명을 empexp10으로 테이블명을 변경한다.
*/
select * from empexp10;
alter table emp10 rename to empexp10;
/*
컬럼명 변경
alter table 테이블명 rename column 기존컬럼명 to 새로운컬럼명

ex) empexp10에서 createdate컬럼을 hiredate로 변경처리..
*/
alter table empexp10 rename column createdate to hiredate;
select * from empexp10;
/* 확인예제
	dept01 테이블을  dept10Exp라는 테이블명으로 변경하고,
	컬럼명 loc를 location으로 변경하시오. 크기는 13--> 25로.
	
*/
alter table dept01 rename to dept10Exp;
select * from dept10Exp;
alter table dept10Exp rename column loc to location; 
alter table dept10Exp modify location varchar(25);

/*
ddl로 데이터의 모든 내용 삭제 처리..
truncate table 테이블명..
 ex) dept10Exp에 있는 모든 데이터를 ddl로 삭제 처리..
*/
truncate table dept10Exp;
select * from dept10Exp;
/*
테이블 구조 삭제

*/


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

/*
데이터 사전(데이터 dictionary)
관리자에서 데이터베이스와 관련된 정보를 제공하는 것을 말한다.

DBA_XXX : 관리자만 접근가능한 객체(테이블 등)의 정보 조회.
ALL_XXX : 자신 계정 소유 또는 권한을 부여 받은 객체(테이블)의 정보조회
USER_XXX : 자신의 계정이 소유한 객체 등에 관련 정보 조회.
*/
select * from user_tables
where table_name like '%EMP%'; -- 사용자 테이블 관련 정보..
/*
제약조건 확인하기..
user_constraints에서 각 테이블의 무결성 제약조건에 관련된 내용을 데이터
딕셔너리를 통해서 확인할 수 잇다.
## contraint_type
P : primary_key
R : foreign_key
U : unique
C : check, not null

** 데이터 사전을 통해서 생성된 테이블의 목록, 테이블의 구조, 제약조건을 
확인할 수 있다..
*/
select * from user_constraints
where table_name like '%DEPT%';
