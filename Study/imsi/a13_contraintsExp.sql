/*

	 not null  제약조건.
	 해당 컬럼의 값이 반드시 입력되어야 처리되게 설정.
	 ex) a01_nullExp 테이블에 
	 	empno, ename에 not null 설정한 테이블.
		a02_nullExp 테이블에 
		empno, enmae null 허용 테이블.
		
*/
	create table a01_not_nullExp(
		empno number not null, -- 제약조건을 not null 설정
		ename varchar2(20) not null, -- 제약조건을 not null 설정
		job varchar2(20)
	);
	create table a02_nullExp(
		empno number, -- 제약조건을 not null 설정
		ename varchar2(20), -- 제약조건을 not null 설정
		job varchar2(20)
	);
/*
	테이블을 만들고 데이터를 입력, 수정할떄 어떤영향이 있는지 확인.

*/

	select * from a01_not_nullExp;
	select * from a02_nullExp;
	alter table a01_not_nullExp modify (ename varchar(50), job varchar2(50));
	alter table a02_nullExp modify (ename varchar(50), job varchar2(50));
	
---	1) 데이터를 입력시, 묵시적null값 입력.
	insert into a01_not_nullExp(job) values('프로그래머'); 
		/* 에러발생: not null인 제약조건아래에서 job에만 값을 넣게되면 
		다른칸에 null이 자동삽입되지만... not null 제약조건 때문에 에러발생...*/
	insert into a01_not_nullExp values(1328, 'qowogus','프로그래머');  
	insert into a01_not_nullExp(ename, empno) values('배재배재', 1238);
	
	insert into a02_nullExp(job) values('프로게이머');
	
	
---	2) 데이터 입력시 , 명시적 null값 입력.	
	select * from a01_not_nullExp;
	select * from a02_nullExp;
	





