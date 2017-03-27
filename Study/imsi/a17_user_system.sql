/*
	데이터베이스 보안을 위한 권한설정.. role
		시작버튼 - oracle 11g - sql cmd line.


	사용자 생성하기...
	create user 사용자명
	indentified by 패스워드;

		ex) scott01이란 계정에 비밀번호가 tiger로 설정생성하겟다.
		문제는 system// 1111로 접속해야 권한이 생기는듯하다..

*/

	create user scott01 identified by tiger;
	
/*
	권한부여.
	1. session: 접속 관련된 권한부여.
		형식: 
			grant 권한종류
			to 사용자계정
		계정이 생성된 것으로 해당 계정을 접속해서 사용할수 있는것이 아니라, 
		접속권한을 설정해야 접속이된다.
			ex) scott01 계정에 접속권한을 설정해준뒤에 접속을 해보자.
				( system 관리자 계정으로 접속한뒤.. )
			grant create session
			to scott01;   -- 접속할 session권한을 scott01에게 준다.


*/
	grant create session
		to scott01; 
		
	
	/*
		테이블 스페이스
		DB생성시, 각종오브젝트(테이블, 인덱스, 뷰.. 등등)
		실제 데이터 파일에 저장되는 물리적 공간이고,
		사용자와 매핑해서 테이블 스페이스, 즉, 물리적 공간 파일을 매핑할수 있다.
		
		1. 생성 형식...
			## create tablespace  테이블스페이스명.
				datafile '물리적파일이 있는 위치' size 크기설정   // 크기설정ex)  10M
				default storage( -- 물리적 크기에 설정초기면 block단위별 증가 크기. )
					initial 크기: 초기의 크기설정...
					next 크기: 증가의 크기설정.
					maxextents: 최대 증가의 크기. 생성할 extends의 최대값.
					pctincrease: extents의 증가율, default = 50... 
				);
				### 실제 admin이나 pct나 extends같은건 자습해야할것이다.
			ex) 테이블 스페이스 이름을 ts01로 하고..
			
			c:\a01_prog\database\  폴드생성..
			파일명 : DF001.DBF01
			initial : 1024k;
			next: 512k;
			최대증가크기 maxextends : 128
			pctincrease: 0;
			cf) 구글검색으로 oracle extends -> memory usage에 관련한 글들이 많이 있다.

	*/
			

	create tablespace ts01
		datafile 'c:\a01_prog\database\DF001.DBF01' size 50M
		default storage(
			initial 1024k
			next 512k
			maxextents 128
			pctincrease 0
		);	
	
	/*
		특정한 테이블 생성시, 지정도니 테이블스페이스와 매핑.
		create table 테이블이름(
			
		) tablespace 지정된테이블스페이스명;
		
		default 테이블 스페이스 지정...
		
		alter table default tablespace 지정한테이블스페이스명;
		
	*/
	select * from user_tables   --- 현재사용자 테이블의 정보설정부분.!!
	where table_name like '%EMP%';
	
	create table TSEXP(
		no number primary key
	) tablespace ts01;
	select * from user_tables --
	where table_name like '%EMP%';

	
	
	