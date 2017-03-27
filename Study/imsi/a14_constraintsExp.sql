/*
	
*/

	select * from a01_not_nullExp;
	select * from a02_nullExp;
	---묵시적 null값 입력 . 제약조건때문에 에러.
	insert into a01_not_nullExp(job) values('프로그래머');
	
	--명시적 null값 입력.
	--테이블명(컬럼명시X) ==> 전체 컬럼에 대한 입력을 처리함.

	--- values(전체 컬럼에 들어갈 데이터를 명시.)
	
	insert into a02_nullExp values(null, null, '프로그래머');
	insert into a02_nullExp values(null, '홍길령', '프로그래머1');
	insert into a01_not_nullExp values(null, '신길동', '프로그래머3');
	--- 명시적으로 null값에 호출하더라도 제약조건이 하나라도 있으면입력이 되지않는다.
	
	/*
		data dictionary 를 통해 contraints 확인가능.
	
	*/

/*
	contraints_type 
		제약조건의 유형에 대한 내용을 선언하는 부분.
	P: primary key : ## - not null && unique를 설정한다.
							보통 메인테이블에서 key로 정의 하는 컬럼설정.
	R: Foreign key(외래키) : 해당컬럼에 데이터나 참조한 다른테이블에 데이터가 반드시 있어야 처리되는 경우.
								ex) dept에 deptno경우, 부서번호에 대한 정보.
								부서정보key deptno가 등록되어잇어야지 
								emp테이블에서 deptno에 데이터입력할수 있게끔 처리해야 
								무결성을 유지할수있다.
	U:unique: 유일키 설정) 해당 컬럼의 데이터가 다른 컬럼의 데이터와 비교해 반드시 하나의 유일한 데이터가 되게할떄 설정.
			ex) dept테이블에 deptno가 다른데이터와 비교해 같은 deptno로 다른 dname 이 입력되게 되면 데이터 무결성에 문제가 발생하기에 
			이를 입력 당시 사전에 에러를 발생시켜 무결성을 확보하기위해서 처리한다.
			20 회계감사
			20 총무 =>> 무결성에 문제를 발생시킴.			
	C:check 특정한 컬럼에 특정한 데이터만 들어오게 처리하는 제약조건.
		ex) emp컬럼으로 gender를 설정할떄 F, M외에는 방지. 

*/

/*
	unique: 유일키 설정처리.
	1. 연습테이블만들기. emp03
	2.컬럼에 유일키 설정하기. unique
	3. 데이터 입력 test. - 데이터를 동일할때, 어떤 에러가 발생하는지 확인.
	4. data dictionary에서 해당제약사항 확인하기.
	

*/
	select * from emp03;
	drop table emp03;
	create table emp03(
		empno number unique,  -- empno가 중복이 되지않게 제약조건으로 설정.
		ename varchar2(30), 
		job varchar2(30)
	);
	insert into emp03 values(1000, 'ALLEN', 'SALESMAN');
	insert into emp03 values(1001, 'JONNY', 'CLERK');
	insert into emp03 values(1000, 'PARTY', 'BUSINESSMAN');  /* error : unique violated.*/
	
select * from user_contraints
where table_name = 'EMP03' ; /*???  주의:!!! 테이블명으로 저장되는게 대문자라서 table_name도 비교구문도 대문자여야한다!!!!!< 짤막팁 저장*/

/*
	확인예제 - 테이블생성시 drop부터 하고, 새로생성.
		student라는 학생테이블을 만들고 컬럼으로  학번 이름 학과를 설정후에.
		제약조건으로 학번에 unique설정해서 생성.
		데이터 입력으로 해당내용이 처리되는지 확인.
		data dictionary를 통해 제약조건이 등록되어잇는지 확인.
*/
drop table student;
create table student(
	studentId number(7,0) unique,
	studentName varchar(20),
	major varchar(50)
);
select * from student;
insert into student values(0100230, '김느우', '컴싸');
insert into student values(0100230, '김느아', '수학');  /*error: violate uniqueness*/
insert into student values(0100231, '김므아', '화학생물');
select CONTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
from USER_CONTRAINTS
where table_name = 'student';

/*
	제약조건명을 사용자 정의하기.
	1. 테이블로 생성시, 설정.
		형식: 
			create table 테이블명
				제약조건선언할컬럼 데이터type, ex) empno number
				constraint 제약조건명(테이블명_컬럼명_제약조건유형축약)
					ex) contraint emp_empno_pk primary key, 
	

*/
drop table emp05;
create table emp05(
	empno number constraint emp_empno_pk primary key,
	ename varchar2(20) 
	
);
select * from user_constraints
where table_name = 'EMP05';
	/* 결과값 owner: system, contraint name : emp_empno_pk, contraint_type: primary key.. 	
		나왓어야햇는데 안나옴..ㅜㅜ*/

/*
	확인예제...
		professor 테이블을 생성하되..
		proid, name ==> 둘다 constraint를 설정하는데 not null, unique로 이름을 지정해서 설정.
		major
		user_constraints에서 지정된 제약조건이름 검색해서 확인.

*/
	create table professor(
		proid number constraint prof_proid_nn not null,
		name varchar2(20) constraint prof_proname_uniq unique,
		major varchar2(20) 
	);
	select * from professor;
	select * from user_constraints
	where table_name = 'PROFESSOR';  /* ???? */


/*
	하나의 컬럼이 아니라, 두개의 컬럼으로 제약조건을 선언하는경우..
		ex) 학생테이블을 key 컬럼을 신규로 생성하는게 아니라. 
			grade(학년) part반 no번호 이름
		형식
			create table 테이블명(
				컬럼명1 데이터type,
				컬럼명2 데이터type,
				컬럼명3 데이터type
				constraint 제약조건명(테이블_컬럼복합_제약단축) 제약조건(컬럼1, 컬럼2...)				
			
			);
		한꺼번에 다중의 컬럼으로 제약조건을 처리함으로 해당내용에 대한 key컬럼을 신규작성할 필요가 없을떄 활용됨.
		단, 위 제약작성은 해당내용에 한꺼번에 처리하지않으면 에러가 발생한다.....
		
*/
	create table highschool(
		grade number, 
		part number,
		no number,
		constraint highschool_dist_pk primary key(grade, part, no)
	);	
		---high school 테이블에 primary key를 3개의 컬럼으로 잡는데, grade , part, no
		--- grade, part, no를 동시에 조합에서 동일한 데이터가 안나오게 처리..
	select constraint_name, constraint_type from user_constraints where table_name= 'HIGHSCHOOL';
	
	
	/*
		확인예제
			address 라는테이블에 
			state도/광역시 city시/구/군 dong동 num번지 householder세대주 주거인원
			을 설정하여 데이터를 확인하는 테이블에서
			primary key 를 잡아서 처리하고자한다.
			테이블을 설정하고 데이터를 입력해서 정상적으로 다중 primeay key 가잡혀 있는지 확인...
	
	*/
		create table address(
			state varchar2(20),
			city varchar2(20),
			dong varchar2(20),
			num varchar2(20),
			householder varchar2(20),
			numppl number,
			constraint address_dist_pk primary key(state, city, dong, num, householder, numppl)
		
		);
	
	select * from user_constraints ;
	insert into address values(1,1,1,1,1,1);
	insert into address values(1,2,1,1,1,1);
	insert into address values(1,1,2,1,1,1);
	insert into address values(1,1,1,2,1,1);
	insert into address values(1,1,1,1,2,1);
	insert into address values(1,1,1,1,1,2);
	insert into address values(1,1,1,1,1,1); /* violated. */
	

/*
	2. 제약조건을 따로 지정하여 설정하는 방법.
		1) 테이블생성.
		2) alter table 테이블명
			add constraint 제약조건명 제약조건 유형(컬럼명)
			modify 컬럼명 constraint 제약조건명 제약조건유형
			drop 제약조건명

*/






