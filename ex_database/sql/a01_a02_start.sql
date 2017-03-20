select * from emp order by empno;
-- 주석단축키
-- 안녕하세요
-- 주석문입니다.
-- select : 특정 테이블의 컬럼명을 선택하는 명령어.
-- 1) * : 전체 컬럼을 생성된 순서로 list 할때.
-- 2) 컬럼명 : 해당 데이터를 보기 위한 명령어
-- 3) from 테이블명 : 테이블을 list 하기 위하여.
select * from emp; -- emp의 테이블의 전체 컬럼 내용을 list 하세요.
select empno, job from emp; -- emp테이블의 컬럼 중에 empno, job을 list
select deptno, ename, sal from emp;
-- empno: emp number, ename: emp name, job: job title, mgr: manager's number, etc.
-- P1 print data of (empno, job and deptno)
select empno, job, deptno from emp; 

-- 산술 연산자.
-- 데이터베이스의 컬럼단위로 연산을 처리 할 수 있다.
-- 사칙연산을 지원하며 %연산은 포함하지 않는다.
select ename, sal, sal+100, sal-10, sal*10, sal/10 from emp;
-- 컬럼간의 연산처리 : 컬럼명1 + 컬럼명2
select empno, sal, deptno, sal + deptno from emp;

-- P1 연봉이 올해 전직원을 대상으로 10% 올랐다.
-- 사원명, 기존연봉, 인상분, 연상된 연봉총합을 출력하세요/
select ename, sal, sal/10 as inc  , sal+sal/10 as total from emp;

select * from emp;
-- P2 부서별로 연봉인상분을 다르게 책정.
-- 부서번호 10 ==> 10%, 20 ==> 20%, 30 ==> 30%
-- 이름, 부서번호, 연봉, 인상된 연봉
select ename, deptno, sal, sal*(deptno*0.01)+sal as sal_after from emp;

-- 문자열을 표현+?
-- database 문자열 연결처리는 '||'를 활용한다.
select '사원의 이름은'||ename||'이고, 부서번호는 '||deptno||' 입니다..' from emp;
select * from emp;
-- 확인 예제 사원번호가 @@@인 @@@@는 올해 연봉인 @@@@ 입니다.!! -- 출력 list처라
select '사원번호가 ' ||empno|| '인 ' ||ename||'은(는) 올해 연봉이 '||sal||'만원 입니다.' from emp;

-- nvl()
-- null : 데이터베이스에는 데이터가 없는 값을 null값이라고 한다. 공백('')도 아니며 0도 아닌
-- 말그대로 데이터가 입력되어 있지 않는 것을 말한다.
-- 프로그램에서 쓰이는 초기값과 구분해서 알고 있어야 한다.
-- 주의: 화면과 연동될 때는 null이 표시되거나, nullpointerException이라는 에러가 발생한다.
-- 또한, 데이터 칼럼간의 연산도 정상적으로 되지 않는다.

select sal, sal+null from emp;
-- 그래서 데이터베이스에서는 null에 대한 연산의 정상적인 처리를 위해 함수를 만들어서 활용한다.
-- nvl을 활용하면 null 값일 때, 초기값에 대한 정의를 해서 정상 처리가 가능하게 한다.
select ename, sal, nvl(comm, 0) from emp;

/*
과제
아래의 형식으로 데이터를 나타내세요..
1. ename은 현재 연봉이 @@@만원 인데, 최근데 5%인상된 금액이며, 작년 연봉은 @@만원이었습니다.
2. ename의 입사일은 hiredate 입니다.
3. 직책인 @@@인 @@@는 부서번호가 @@@입니다.
4. @@@님은 현재 연봉과 보너스(comm)의 합산액은 @@@입니다.
*/
-- 0. 기본 select 문
select * from emp;
-- 1. ename은 현재 연봉이 @@@만원 인데, 최근데 5%인상된 금액이며, 작년 연봉은 @@만원이었습니다.
select ename||'은 현재 연봉이'||(sal+sal*0.05)||'만원 인데, 최근에 5% 인상된 금액이며, 작년 연봉은 '||sal||'만원이었습니다.' from emp;
-- 2. ename의 입사일은 hiredate 입니다.
select ename||'의 입사일은 '||hiredate||' 입니다.' from emp;
-- 3. 직책인 @@@인 @@@는 부서번호가 @@@입니다.
select '직책이 '||job||'인 '||ename||'은(는) 부서번호가 '||empno||'입니다.' from emp;
-- 4. @@@님은 현재 연봉과 보너스(comm)의 합산액은 @@@입니다.
select ename||'님은 현재 연봉('||sal||')과 보너스('||nvl(comm,0)||')의 합산액은 '||(sal+nvl(comm,0))||'입니다.' from emp; 

-- 이까지가 a01내용입니다 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 
-- 이까지가 a01내용입니다 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 
-- 이까지가 a01내용입니다 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 



-- empno를 별칭으로 companyNo로 쓰기로 했다. 출력하세요.
select empno as companyNo from emp;
-- 별칭은 프로그램 영역에서 중요한 의미를 가진다.
-- 대다수 프로그램은 별칭으로 간편하게 사용하는 경우가 많다.
-- ex) rs.getString("별칭/컬럼명")
-- as 대신에 공백(' ')으로 처리한다.
select '사번은'||empno||' 입니다.' show from emp;
-- 다음의 내용을 변경된 컬럼으로 나타내세요.
-- 컬럼명		depandname	upgradeRatio 	enterCompany
-- 출력데이터 	(부서번호)이름	연봉의 10%			입사년월일
select '('||deptno||')'||ename depandname, sal*0.1 upgradeRatio,
 hiredate enterCompany from emp;
-- 공백값을 별칭으로 처리하기..: " "사이에 별칭명을 적어준다.
select ename "name intro" from emp;
-- 한글을 별칭으로 처리할 때도,
select deptno "부서번호" from emp;
----
select * from emp;
-- 중복값 처리 : 데이터베이스에서는 동일한 값을 입력하는 것을 테이블 단위로
-- 입력하는 것을 꺼려한다.
-- 컬럼에 있는 모든 데이터가 동일해서는 안된다는 말이다.
-- 그런데, 한개 컬럼으로 조회할 때는 동일한 데이터가 나타날 수 있다.
select deptno from emp;
-- 일때, 하나 또는 다수의 컬럼의 데이터가 동일한 것을 filtering 해주는 처리가
-- 있는데 이를 distinct라고 한다.
-- 활용형식 select distinct 컬럼1, 컬럼2.. from테이블
select distinct deptno from emp;
select*from emp;
/* 확인예제
 1) -mgr을 동일값 없이 출력하세요.
 2) job과 mgr 컬럼이 동일값 없이 출력하세요.
 */
select distinct mgr from emp;
select distinct job from emp;
select distinct job, mgr from emp;
select mgr, job from emp;
select mgr from emp;
select job from emp;
/*
조건처리..
특정한 데이터 list내용에서 필요한 데이터한 행단위로 filtering하는 것을 말한다.
1. 범위처리
*/

/* 연봉이 3000이상이 ㄴ데이터를 list 처리
where 컬럼명> 조건 데이터 */
select * from emp
 where sal >= 3000;
-- 데이터베이스에서 쓰이는 비교연산자
-- = (*), >, <, >=, <=,     <>,!(다를때)
select*from emp;
-- 1) 부서번호 30인 데이터를 list하세요..
-- 2) 연봉이 1000미만인 데이터
-- 3) ename이 SMITH인 데이터
-- 4) COMM이 NULL인 데이터(*) - 지금까지 배운 함수활용
select*from emp where nvl(comm,0)=0;
select*from emp where comm is null;
select*from emp where comm is not null;
-- 5) MGR이 7698이 아닌 데이터
select * from emp where mgr != 7698;
-- 열과 행의 두가지 조건을 갖춘 데이터 list하기..
-- 행의 multi 조건에 대한 처리..
select*from emp;
-- 연봉이 3000이상인 사람의 이름과 연봉을 list
select ename, sal
from emp
where sal>=3000;
select * from emp;
-- 연봉이 2000 이하이고 직책이 SALESMAN인 사람의 이름 직책 연봉을 출력
select ename "이름", job "직책",sal "연봉"
from emp
where sal<=2000
and job='SALESMAN';

/*
 1 EMP중에 급여가 2000미만이 되는 사원 정보중에 사번과 급여를 출력하라.
 연봉과 보너스의 합산 금액이 1500미만인 사람의 이름, 연봉 보너스 합산액을 출력하세요.
 MGR이 NULL인 사람의 JOB과 이름 연봉을 출력하세요.
 JOB이 CLERK인 사람중에 DEPTNO가 30인 사람의 이름, 직책 부서번호를 출력하세요.
*/


























