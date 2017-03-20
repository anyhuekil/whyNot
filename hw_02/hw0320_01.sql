/*
	hw0320
*/

/* 확인예제1
	emp01이라는 복사테이블 만들고
	1) empno가 가장 많은 번호보다 +1해서, ename과 job, sal를 입력하세요.
	2) 그외에 컬럼 mrg, hiredate(sysdate-현재날짜로 수정), daptno는 40으로 수정처리하세요.
*/
select * from emp;

create table emp01 as select * from emp;
select * from emp01;

select max(empno)+1 from emp01;
-- 7935
insert into emp01(empno, ename, job, sal) values (7935,'레몬녹차','청소부',44444); 
select * from emp01;

/* 과제1
	emp03복사 생성
	1. 입력 empno의 가장 작은 수보다 -1, mgr:cleark의 mgr입력, sal:평균연봉, comm:전체comm의 합계
	2. 수정 ename:'신길동', job은 SUPERMAN, hiredate는 최근에 입사일 +1
*/



/* 확인예제
	dept01테이블 deptno가 50이상인 데이터를 모두 삭제하세요..
	emp01테이블 comm이 null이고, deptno가 20인 데이터를 삭제하세요.


*/

/* 확인예제
	dept01을 dept10Exp라는 테이블명으로 변경하고, 컬럼명 loc를 location으로 변경하시오. 크기는 13-25로
*/


select*from emp;


/* 과제2
참조키 관계이 있는 테이블 구성하기
메인테이블 student_main(id, pass, name) : 아이디, 패스워드, 이름
서브테이블 student_point(id, subject); 아이디, 과목, 점수
	student_main과 student_point id로 foreign key 관계를 설정하고,
	student_main에 데이터가 있어야만 student_point를 입력할 수 있게끔 처리

*/



















