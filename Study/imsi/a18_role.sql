/*
	role
		사용자에게 보다 효율적으로 권한을 부여할수 있도록 여러개의 권한을 묶어놓은것.
		사용자를 생성하면 바로 사용할수 있는것이 아니라.. 
		각종 권한을 부여해야하는데 role을 통해 손쉽게 다양한 권한을 한번에 부여할수 있다.
		
	롤의 종류
	1. connect 롤.
		주로 사용자가 DB에 접속할수 있도록 하는 기본적인DB의 권한이라고 할수 있다.
			ex) alter session, create cluster, create database link,
				create sequence, create session, create synonym,
				create table, create view 
	2. resource 롤
		사용자가 객체(테이블, 뷰, 인덱 등)를 생성할수 있도록 권한을 묶는것을 말한다.
			ex) create cluster, create procedure, create sequence, create table, create trigger
	3. dba 롤 - 모든권한
		사용자가 DB객체를 관리하고 사용자들을 작성하고 변경제거..
		할수 있는 강력한 권한의 롤을 말한다..
		
	롤의 활용순서..
	1. 롤생성 (DB관리자.)
		형식) create role 롤의이름
			create role roleExp01;
	2. 롤에 권한부여
		형식) grant 권한1, 권한2, 권한3 to 롤의이름
			grant create session, create table, create view to roleExp01;
	3. ##사용자에 롤을부여.
		형식) grant 롤이름 to 사용자	
			grant roleExp01 to scott01;
	
	####
	확인예제: 
	1.신규 사용자 계정만들기 scott05
	2. role만들기 roleexp02, 권한부여 resource접근 권한.
	3. scott05에 role권한 부여 및 접근확인.
*/

	create user scott05 identified by tiger;
	create role roleExp02;
	grant create session, resource to roleExp02;  /* session과 resource라는 권한을 roleExp02패키지에 집어넣음.	*/  
				/* session권한은 모두 기본적으로 줘야 접근이 가능. 안줄수도있지만 접근불가함.*/
	grant roleExp02 to scott05;
	


