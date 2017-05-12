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






	
	
	
	


