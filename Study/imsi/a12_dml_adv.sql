/*
	여러가지 고급 DML쿼리!!!
	1. 다중 테이블에 다중행 입력하기...
		insert 구문을 여러번 써서 데이터를 입력하는 경우가 많은 데이터를 입력할떄 번거러운 경우가있는데..
		한번은 subquery를 통해서 여러동일한 구조의 테이블에 입력할떄,
		insert all 구문을 활용하면 손쉽게 처리가 가능하다.
		
		1) 형식: 
		insert all 
		into 테이블1명 values(컬럼1, 컬럼2, 컬럼3)
		into 테이블2명 values(컬럼1, 컬럼2, 컬럼4)
		select 컬럼1, 컬럼2, 컬럼3, 컬럼4 from 테이블명
		where 조건.
		
		ex) emp 테이블에서 구조복사 테이블생성.
			emp_hir(empno, ename, hiredate)
			emp_mgr(empno, ename, mgr)
			원본 emp테이블에서 부서번호가 20인 데이터를 해당테이블에 데이터입력처리.
			1) 구조복사.
*/
	create table emp_hir
	as select empno, ename, hiredate, deptno
	from emp
	where 1=0;
	select * from emp_hir;
	
	
	create table emp_mgr
	as select empno, ename, mgr, deptno
	from emp
	where 1=  0;
	select * from emp_mgr;
	
	drop table emp_hir;
	drop table emp_mgr;

	insert all
	into emp_hir values(empno, ename, hiredate)
	into emp_mgr values(empno, ename, mgr)
	select empno, ename, hiredate, mgr
	from emp
	where deptno = 10;

	/*
		서버쿼리를 이용한 데이터 수정하기..
		update 테이블명
		set (변경할컬럼1, 변경할컬럼2) = (select 컬럼1, 컬럼2 from 테이블명)
		where 조건.
		
		ex) 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기위해서 서버쿼리를 이용하자.
			
	*/
	
	create table dept01 
	as select * from dept;
	select * from dept01;
	select * from dept;
	
	update dept01 
	set (dname, loc ) = (select dname, loc 
					from dept 
					where deptno = 40	
					)
	where deptno = 20;

/*
	확인예제:
		emp테이블의 복사본 emp11을 만들고..
		job이 president에 있는 sal과 deptno를
		job이 clerk에 있는 데이터로 update하세요.

*/
	create table emp11
	as select * from emp;
	
	update emp11
	set (sal, deptno) = (select sal, deptno 
							from emp
							where job = 'PRESIDENT')
	where job = 'CLERK';
	select * from emp11;


/*
	merge 처리..
	DATA migration(데이터이관처리) 할때, 많이 활용된다.
	테이블 A, 테이블 B로 데이터를 이관처리할때...
	부서가 달라 입력되어있는 데이터도 있고.
	신규로 입력해야될 데이터도 있으며
	입력되어잇는 데이터는 특정컬럼을 수정처리해야될 경우.. 많이 이용된다.

	형식 ex)  테이블 A에 있지만 테이블B에는 없는 데이터는 insert처리.
				테이블A에 있고 , 테이블 B에 있으나 특정한 컬럼을 수정하는것을 update처리.
				>>merge는 두가지 일을 한번에 처리.

*/

/*
	merge into 통합테이블명 
		using  이전/참조할테이블.
		on (조건처리- 일반적으로 두 테이블의 key값(공통컬럼)을 조건으로 처리한다.)
					ex) on (테이블A.컬럼01 = 테이블B.컬럼01)   ###!!! 괄호주의.
		when matched then  --- 두개의 테이블key 데이터가 공통으로 있을때, 업데이트 관련처리.
				업데이트관련 처리: 	ex) 테이블A의 컬럼01과 테이블B의 컬럼01 가 동일할 경우.
				update set
				통합할테이블.변경할컬럼 = 이전/참조할테이블.컬럼
					ex)  테이블B.변경컬럼 = 테이블A.컬럼.

		when not matched then -- 한쪽 테이블에 데이터가 없는경우..
				입력관리처리: ex) 테이블A에는 잇으나, 테이블B에는 없을경우.
				insert [테이블명X] values(이전및참조할테이블.컬럼...)
					ex) insert values(테이블B.컬럼명...)
*/

/*
	emp01, emp02 데이터를 로딩해서...  emp01에 데이터 머지처리..
	1.emp01복사테이블 만들기.
	2. emp02복사테이블 만들기 + emp에 job= 'manager' 만.
		emp02 job을 test 로 update하기.  // (empno는 동일, job이 다른데이터.)
		emp02 입력 7935 '홍길동', 'SUPERMAN' 7839 sysdate 4000 100 40
			(empno가 emp01에 없는데이터!!)
*/
drop table emp01;
drop table emp02;

	create table emp01 
	as select * from emp;
	create table emp02
	as select * from emp 
		where job = 'MANAGER';
select * from emp01;
select * from emp02;   --- creat emp01, emp02완성

	update emp02 set job = 'test';  --- emp2의 job을 test로 변경.

	insert into emp02 values(7935, '홍길동', 'SUPERMAN', 7839, sysdate, 4000, 100, 40);
		--emp02 입력 7935 '홍길동', 'SUPERMAN' 7839 sysdate 4000 100 40
	
merge into emp01 -- 최종 데이터는 emp01에 처리.
	using emp02		-- emp02 데이터를 사용합니다.
	on (emp01.empno = emp02.empno)  -- 해당 key값이 empno가 있는지 여부에따라 update 또는 insert.
	when matched then  -- 테이블의 컬럼들이 일치한다면 // job =>> test 업데이트
		update set emp01.job = emp02.job   --업데이트 emp02.job  -- test데이터를 emp01.job에 update..
	when not matched then -- 동일한 empno값이 emp01에 없을경우. // 7935홍길동 얘기.
		insert values(emp02.empno, emp02.ename, emp02.job, emp02.mgr, emp02.hiredate, emp02.sal, emp02.comm, emp02.deptno);
select * from emp01;

	/*
		확인예제.
			emp의 복사테이블 emp03
			emp 에서 deptno가 30인 데이터를 emp04로 복사테이블 만들기..
				emp04의 hiredate를 sysdate로 update처리.
			emp04에 7370 '원더걸' 'superman' 7839 sysdate 6000 400 40 데이터입력
			두 테이블의 머지처리.
	
	*/
	drop table emp04;
	create table emp03
	as select * from emp;

	create table emp04
	as select * from emp
	where deptno =30;
	update emp04 set hiredate = sysdate;
	select * from emp04;
	insert into emp04 values(7370, '원더걸', 'superman', 7839, sysdate, 6000, 400, 40);
	
	merge into emp03
		using emp04   -- 참고테이블
		on (emp03.empno = emp04.empno) -- prime references
	when matched then 
		update set emp03.hiredate = emp04.hiredate  -- update.
	when not matched then
		insert values(emp04.empno, emp04.ename, emp04.job, emp04.mgr, emp04.hiredate, emp04.sal, emp04.comm, emp04.deptno );
			-- 안맞는경우 하나하나 다 옮겨줘야함...
	select * from emp04;

	
	
	
	
	



