/*
	sequence 
	오라클에서 중복된값을 넣지않기위해 기본키 primary키를 테이블에 하나의 컬럼에 설정한다.
	이 컬럼에 중복되지않는 값을 넣기위해서 오라클에서는 ㅇsequence라는 객체를 지원하고잇다.
	시퀀스는 테이블내의 유일한 숫자를 자동으로 생성하여 자동으로 번호를 입력할수 있게 해줘서 
	사용자의 유일키 생성에 대한 부담을 줄여준다.
		ex) 학생 테이블에 번호를 입력한다.
			no 이름....
			no 컬럼에 1, 2, 3, 4, 5... 로 자동입력해야할떄.
			
			empno ename 
			1000부터 시작 1001, 1002, 1003, 1004....
			
			학번입력
			studId name
			C020001 시작 C020002, C020003....
			[단과코드][sequence] : 합성번호..
		
		ex) 입력시, 자동으로 numbering처리.
			insert into 테이블 values(sequence명.nextval,  ....)
			insert into 테이블 values( 'C0' || sequence명.nextval, ....)
			 ->>문자와 조합된 sequence처리.
			 ***** 주의: 당연한거지만,,, 문자조합으로된 numbering처리는 반드시 class 속성값이 varchar여야한다..

	형식:
		create sequence 시퀀스명
			start with N  --> 시작하는 번호를 지정... ex) 1, 1001, 20001
			increment by N  --> 증감단위 ex) 1, 2(2 step 단위로 증가.) -1( 1step단위로 감소.)
			maxvalue N  --> 증가했을때, 최고범위 ex) 99999   // 1~99999까지 데이터를 numbering하게된다.
			
			
			
	데이터 입력이나 활용시.
		시퀀스명.nextval: 시퀀스를 증가시키며 현재값을 출력...
		시퀀스명.currval: 시퀀스의 현재값을 출력.
		
	ex) ##(primary key ) 시작값이 1이고 1씩증가하고, 최대값이 99999인 시퀀스 exp01_seq 작성.
*/
	create sequence exp01_seq
		start with 1
			increment by 1
			maxvalue 99999;
	/* object explorer에서 확인가능. */
	select exp01_seq.nextval from dual;   /*	시작번호가 1개 생성및 numbering출력.	*/
	select exp01_seq.currval from dual;   /*	현재numbering출력.*/
/*
		학생테이블( student_seq_exp)에..
		no 이름
*/
	create table student_seq_exp(
		no number primary key,
		name varchar2(50)
	);
--- 테이블에 seq를 넣어주고 데이터입력.
	
	create sequence student_seq
		start with 1
			increment by 1
			maxvalue 99999;
	/* object explorer에서 확인가능. */
	insert into student_seq_exp values( student_seq.nextval, '이름입력');
	--- 3번이상 실행후, commit처리.
	select * from student_seq_exp;
	
	
/*
	확인예제
		emp_seq_exp 테이블생성후( empno enmae)
		emp_seq10 시퀀스 생성,
			1000부터 시작. 1001 1002.... 입력처리.
		
		college 테이블생성 (studentId, studentName)
		college_seq 시퀀스생성.
			2000부터 시작, 2001 2002...
		학번입력...
			studentId name....
			C020001 시작해서 C020002 ....
			[단과코드][sequence] : 합성번호..
			

*/	
	create table emp_seq_exp(
		empno number primary key,
		ename varchar2(50)
	);

	create sequence emp_seq10
		start with 1000
		increment by 1
		maxvalue 1999 ;
	insert into emp_seq_exp values( emp_seq10.nextval, '이지선');
	select * from emp_seq_exp;
	
	
	create table college(
		studentId varchar2(20) primary key,
		studentName varchar2(50)
	);
	create sequence college_seq
		start with 2000
		increment by 1
		maxvalue 2999;
		
		
	select college_seq.nextval from dual;
	
	insert into college values( 'C0'|| college_seq.nextval , '홍길동');
	select * from college;
	
	
	
	
	







