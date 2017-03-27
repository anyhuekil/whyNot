/*
서브 쿼리를 이용한 데이터 추가.
insert 구문을 select와 혼합해서, 데이터를 입력 처리가 가능.
형식 : INSERT INTO 테이블명
       SELECT * FROM 입력할테이블; 해당 SQL로 여러 라인의 데이터
	   를 한번에 입력할 수 있다..
	   주의할 점) 입력할 테이블의 컬럼과 SELECT [선택컬럼명]의
	   컬럼 갯수와 TYPE이 동일하여야 한다.
	   
*/
select * from emp_structor;
-- EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
INSERT INTO emp_structor
SELECT * FROM EMP
WHERE SAL>=3000;
SELECT * FROM emp_structor;
-- 컬럼 지정 및 변경
/*
	insert into 테이블명(컬럼1, 컬럼2, 컬럼3)
				select 컬럼1, 컬럼1+컬럼2, 함수(컬럼3)
				from 테이블명
				where 조건..
*/

INSERT INTO emp_structor(empno, sal, ename)
	select empno, sal+comm, rpad(ename,7,'^^') from emp;
select * from emp_structor;
select * from emp;
select * from dept;

create table dept_sub
as select deptno, dname, loc, '     ' kname, 0 membercnt 
   from dept
   where 1=0;
select * from dept_sub;  
	select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 40, '운영','없음') kname, 
	    0 membercnt 
	   from dept;
	insert into dept_sub
	select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 
		  			40, '운영','없음') kname, 
	      (select count(*) from emp where deptno=a.deptno ) membercnt 
	   from dept a;
select count(*) from emp where deptno=30;	
select a.*,
      decode(deptno, 10,'회계',
                     20,'감사',
		     30,'영업', 
	  	     40,'운영',
		     '없음') kname 
from dept a;
	select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 
		  			40, '운영','없음') kname, 
	      (select count(*) from emp 
		  where deptno=a.deptno ) membercnt 
	   from dept a;	
select count(*) 
         from emp 
	 where deptno=20;	    
/*
수정 서버쿼리:
	수정하는 main sql에서도 subquery로 해당 내용의 결과를
	처리하는 것을 말한다..
update 테이블명
  set 컬럼명 = 데이터(데이터부분을 subquery로 처리 
                    select 컬럼명
                    from 테이블 where 조건
					)
 where 조건
 ex) empno가 7369인 사람의 보너스(comm), 
        전체 보너스의 평균을 할당 할려고 한다. 
*/
-- 1. subquery
select avg(comm)
 from emp;
-- 2. mainquery
update emp
   set comm=( select avg(comm)
 			 from emp  )
 where empno=7369;
 select * from emp;
--  확인예제.
-- 1. emp_sub77 이라는 emp의 복사테이블을 생성.
-- 2. emp_sub77에서 comm이 null값인 데이터에 sal의 최저값으로 수정하세요.
create table emp_sub77
as select * from emp;
update emp_sub77
  set comm=(select min(sal) from emp_sub77)
  where comm is null;  
select * from emp_sub77;  
 




	 
 



