/*	16. a16_sequence */

/*
sequence
오라클에서 중복된 값을 넣지 않기 위해 기본 키(primary key)를 
테이블에 하나의 컬럼에 설정한다.
이 컬럼에 중복되지 않는 값을 넣기 위해서 오라클에서는 sequence
라는 객체를 지원하고 있다. 
시퀀스는 데이블 내의 유일한 숫자를 자동으로 생성하여 자동으로
번호를 입력할 수 있게 하기에 사용자의 유일키 생성에 대한 부담을
줄여 준다.
ex) 학생 테이블에 번호를 입력한다.
	no 이름 ....
	no 컬럼에 1, 2, 3, 4, 5..  으로 자동으로 입력을 해야할 때.
	사번 테이블에 번호를 입력한다.
	empno ename
	1000 부터 시작 1001, 1002, 1003, 1004 .... 	
	학번입력..
	studId  name..
	C020001   시작여 C020002, C020003.....
	[단과코드][SEQUENCE] : 합성번호..
EX) 입력시, 자동으로 NUMBERING 처리..	
	INSERT INTO 테이블  VALUES( SEQUENCE명.NEXTVAL, ....)
	INSERT INTO 테이블  VALUES( 'C0'||SEQUENCE명.NEXTVAL, ....)
					--> 문자와 조합된 sequence 처리..

형식]	
CREATE SEQUENCE 시퀀스명
   	START WITH N  --> 시작하는 번호를 지정..EX) 1, 1001, 20001
	INCREMENT BY N  --> 증감 단위..EX) 1, 2(2 STEP단위로 증가)
	                                 -1(1 STEP단위로 감소)
	MAXVALUE N  --> 증가했을 때, 최고 범위 EX) 999999
							1 ~ 999999 까지 데이터를  NUMBERING
							처리한다.									  	
데이터 입력이나 활용시.
	시퀀스명.NEXTVAL : 시퀀스를 증가시키며 현재값을 출력..
	시퀀스명.CRURRVAL : 시퀀스의 현재값을 출력.

EX) ## 시작값이 1이고 1씩 증가하고, 최대값이 99999인 시퀀스 
	EXP01_SEQ를 만들어 보자..

*/
CREATE SEQUENCE EXP01_SEQ
		START WITH 1
		INCREMENT BY 1
		MAXVALUE 99999;
SELECT EXP01_SEQ.NEXTVAL FROM DUAL; -- 시작 번호가 1개 생성 및 NUMBERRING
-- 현재 서버의 유일한 NUMBER ....
SELECT EXP01_SEQ.CURRVAL FROM DUAL; -- 현재 번호 호출.
-- EX) 학생테이블(STUDENT_SEQ_EXP)에 
--     no 이름 
create table student_seq_exp(
	no number primary key,
	name varchar2(50)
);
-- 테이블에 seqence를 활용하여 데이터를 입력한다.
CREATE SEQUENCE student_SEQ
		START WITH 1
		INCREMENT BY 1
		MAXVALUE 99999;
insert into student_seq_exp values(	student_SEQ.nextval, '이름입력');
select * from student_seq_exp;
/* 확인예제
	1) emp_seq_exp 테이블 생성후(empno ename)
	emp_seq10 시퀀스 생성,
		1000 부터 시작 1001, 1002, 1003, 1004 .... 	
	입력처리..
	2) college 테이블 생성(studid, name)
	college_seq 시퀀스 생성.
		20001, 20002
	학번입력..
	studId  name..
	C020001   시작여 C020002, C020003.....
	[단과코드][SEQUENCE] : 합성번호..
*/

create sequence emp_seq10
	start with 1000
	increment by 1
	maxvalue 9999;
create table emp_seq_exp(
	empno number primary key,
	ename varchar2(50)
);	  


/*	17. a17_user */
/*
## 사용자 계정으로 접속 방법..
command 창에서 접속하는 방법..
sqlplus system/1111  또는 sqlplus scott/tiger
sqlplus 내부에서 
sql>conn 계정명/비밀번호

## 여러가지 client 툴을 이용해서 접근 주요 핵심 정보..

IP/port번호/ sid/ 계정/비밀번호

*/
/*
## 사용자 생성하기..(system계정의 worksheet에서 처리)
create user 사용자명
identified by 패스워드;
ex) scott01이란 계정에 비밀번호가 tiger로 설정하여
	생성 하겠습니다.
*/
create user c##scott01 identified by tiger;
/*
권한 부여
1. session : 접속 관련된 권한 부여..
형식
grant 권한종류
to 사용자계정
 계정이 생성된 것으로 해당 계정을 접속해서 사용할 수 있는
 것이 아니라, 접속 권한을 설정해야지 접속이 된다..
 ex) scott01 계정에 접속권한를 설정해 준 뒤에 접속을 해보자.
 system 관리자 계정으로 접속한 뒤..
 grant create session
 to scott01;   -- 접속할 session권한을 scott01에게 준다.

*/
grant create session
to c##scott01;
/*
테이블 스페이스
데이터베이스 생성시, 각종 오브젝트(테이블, 인덱스, 뷰등)가
실제 데이터 파일에 저장되는 물리적 공간이고, 
사용자와 매핑해서 테이블 스페이스 즉 물리적 공간 파일을 매핑할 
수 있다..
1. 생성 형식..
	## create tablespace 테이블스페이스명
		datafile '물리적파일이 있는 위치' size 크기설정(ex 10M
		default storage( -- 물리적 크기에 설정 초기 및 
									block단위 별 증가 크기.
		   initial 크기   : 초기의 크기설정.
		   next  크기 : 증가의 크기설정
		   maxextends : 최대 증가의 크기 : 생성할 extends의 최대 값..
		   pctincrease : extents의 증가율, defult값은 50..
		)
	ex) 테이블 스페이스 이름 ts01로 하고..
		C:\a01_prog\database\ 폴드 생성.
		파일명 : DF001.DBF01
		크기는 50M
		initial : 1024k
		next : 512k
		최대 증가 크기 maxextents : 128
		pctincrease  :0 
*/
create tablespace ts01
		datafile 'C:\a01_prog\database\DF001.DBF01' size 50M
		default storage(
			initial 1024k
			next 512k
			maxextents 128
			pctincrease 0
		);
/*
특정한 테이블 생성시, 지정된 테이블스페이스와 매핑..
create table 테이블이름(

) tablespace 지정된테이블스페이스명;

default 테이블 스페이스 지정..
alter database default tablespace 지정한테이블스페이스명;

*/		




/*	18. a18_role */
/*
role이란?
사용자에게 보다 효율적으로 권한을 부여할 수 있도록 여러 개의 권한을 묶어 놓은 것을 말한다. 사용자를 생성하면 바로 사용할 수 있는것이 아니라, 각종 권한을 부여해야 하는데 role을 통해서 손 쉽게
다양한 권한을 한번에 부여 할 수 있다..

롤의 종류
1. connect 롤
주로 사용자가 데이터베이스에 접속할 수 있도록 하는 기본적인 
데이터베이스의 권한이라고 할 수 있다.
ex) ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK,
CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, 
CREATE TABLE, CREATE VIEW
2. resource 롤
사용자가 객체(테이블, 뷰, 인덱 등)를 생성할 수 있도록 권한을 묶는
것을 말한다.
create cluster, create procedure, create equence, 
create table, create trigger
3. dba 롤
사용자가 데이터베이스 객체를 관리하고 사용자들을 작성하고 변경제거
할 수 있는 강력한 권한의 롤을 말한다.

롤의 활용 순서
1. 롤을 생성(데이터베이스 관리자)
	형식) create role 롤의 이름..
	ex) create role roleexp01;
2. 롤에 권한 부여
	형식) grant 권한1, 권한2, 권한3 to 롤의 이름
	ex) grant create session, create table, create view 
	    to  roleexp01;
3. ##사용자에 롤을 부여.
	형식) grant 롤이름  to 사용자
	ex) grant roleexp01 to scott01;
	
*/








