/*
	제약조건명을 사용자 정의하기.
	1. 테이블로 생성시, 설정.
		create table 테이블명
			제약조건선언할컬럼 데이터type, ex) empno number
			constraint 제약조건명(테이블명_컬럼명_제약조건유형축약)
				ex) contraint emp_empno_pk primary key, 

	2. 제약조건을 따로 지정하여 설정하는 방법.
			1) 테이블생성.
			2) alter table 테이블명
				add constraint 제약조건명 제약조건유형(컬럼명)
				modify 컬럼명 constraint 제약조건명 제약조건유형
				drop 제약조건명

	3. 제약조건 추가하기.
		alter table 테이블명
		add contraint 테이블명_컬럼명_제약조건단축 제약조건유형(컬럼명);
			cf) 제약조건 not null( x ), unique( o )
	
	4. 수정(modify)
		제약의 유형에따라 add와 modify 를쓰는경우가 있다..
		not null의 경우에는 add로 제약조건을 등록할수 없다. >> 이 경우에는 modify 활용.	
			alter table 테이블명
			modify 컬럼명 constraint 바꿀제약조건명 바꿀제약조건유형( -not null )
	
*/
CREATE TABLE ADDRESS
(
   STATE        VARCHAR2 (50) unique,
   CITY         VARCHAR2 (50),
   AREA         VARCHAR2 (50),
   ADNUMBER     NUMBER,
   HOST         VARCHAR2 (50) not null,
   RISDNUMBER   NUMBER
);

	select * from address;

	drop table address;	
	
	select * from user_constraints ;
	insert into address values(1,1,1,1,1,1);
	insert into address values(1,2,1,1,1,1);
	insert into address values(1,1,2,1,1,1);
	insert into address values(1,1,1,2,1,1);
	insert into address values(1,1,1,1,2,1);
	insert into address values(1,1,1,1,1,2);
	insert into address values(1,1,1,1,1,1);   /*	??? 이건 왜 받아들여지는지 이해가안가네..?  varchar라서 그릉가..? */

/*
	제약조건 추가, 삭제, 수정연습.
		1. address테이블에 host컬럼에 unique 제약조건을 추가.
			ex) alter table 테이블명 
				add contraint 테이블명_컬럼명_단축제약조건 제약조건명(컬럼);	
		2. data dictionary에서 확인.
			ex) select * from user_constraints
				where table_name= '대문자테이블명'
	
		3. host컬럼의 제약조건을 삭제.
			ex) alter table 테이블명 
				drop constraint 테이블명_컬럼명_단축제약조건;
	
		4. address 테이블에 host컬럼에 not null 제약조건으로 변경.
			ex) alter table 테이블명
				modify 컬럼명 contraint 테이블명_컬럼명_단축제약조건 제약조건유형(컬럼);
	
		5. data dictionary에서 또 확인.
			ex) alter table 

*/
--1
	alter table address 
	add constraint address_host_uq unique(host); 
--2
	select * from user_constraints
	where table_name = 'ADDRESS';
--3
	alter table address 
	drop constraint address_host_uq;
--4
	alter table address
	modify host constraint address_host_nn unique;
--5 
	select * from user_constraints
	where table_name = 'ADDRESS';

/*
	확인예제
		1. EMP테이블의 복사테이블 emp07을 만들고
		2. ename컬럼에 unique 제약조건을 설정후
		3. 위 제약조건을 삭제하고
		4. ename컬럼의 제약조건을 not null로 변경.

*/
	create table emp07
	as select * from emp;
	
	alter table emp07 
	add constraint emp07_ename_uq unique(ename);
	
	alter table emp07
	drop constraint emp07_ename_uq;
	
	alter table emp07
	modify ename constraint emp07_ename_nn not null;
	
	select * from user_constraints
	where table_name = 'EMP07';
	
	
	
	