select * from emp;




/*
select 컬럼
from 테이블명
where 컬럼1 = 조건1 or 컬럼 2 = 조건2
위에서와 같이 컬럼1=조건1이 만족하거나, 컬럼2=조건2가 만족할 때
데이터가 나타나는 것으로 해당 데이터를 전부 list한다.
ex)부서 번호가 30이거나 사원명이 'SMITH'인 데이터를 list하세요
*/
select * from emp where deptno=30 or ename='SMITH';

SELECT * from emp;
-- 확인예제) 연봉이 2000~3000이 아닌 (2000미만이거나 3000초과)인 것을 not키워드를 활용해서 list하세요.
-- 확인예제) 직책이 SALESMAN이 아니고, 연봉이 2000이상인 사원을 LIST하세요
select * from emp where not sal between 2000 and 3000;
select ename "사원이름" from emp where job !='SALESMAN';

/*
between and 연산자
데이터 범위가 특정 조건 사이에 있을떄, 활용되는 키워드 이다.,
where 컬럼명 between A and B
해당 대이터 중 컬럼명에 범위가 A와 B사이에 있는 것을 말한다. 
ex)연봉이 2000에서 3000사이에 있는 데이터를 list하세요
*/
select * from emp where sal between 2000 and 3000;

-- 확인예제 사번이 7400~7500사이에 있으며 연봉이 2000미만이거나 3000초과하는 데이터를 list하세요
/*
날짜에 대한 처리
입사일이 1987/01/01에서 1987/12/31 사이에 있는 데이터를 list하세요.
*/
select * from EMP
where emp.hiredate between '1981/01/01' and '1981/12/31';

--확인예제) 입사일이 1981년 12월에 입사한 사람의 이름과 부서번호를 출력하세요
select * from emp
where emp.hiredate between '1981/12/01' and '1981/12/31';

-- sysdate : 현재 날짜를 출력 주는 내용
select ename, hiredate, sysdate
from emp;

/* in 연산자
 해당 데이터에 대한 조건을 처리 할 때, 여러 데이터에 대한 조회를 하고자 할 때 활용된다.
 or연산자와 동일한 내용
 형식) 컬럼명 in (해당데이터1, 해당데이터2, 해당데이터3)
 */
 
 select * from emp;
 --관리자 번호가 7902, 7566인것을 list하세요
 SELECT * FROM emp
 WHERE mgr IN (7902, 7566, 7839);
--  확인예제 사원 이름이 SMITH, WARD, JONES인 사람중,
--  연봉이 1000미만인 데이터를 이름과 연봉을 출력하세요
SELECT ename, sal from emp where ename IN ('SMITH','WARD','JONES') AND SAL<1000;

/*LIKE연산자와 와일드 카드 (%_)활용하기.
특정데이터에 대한 문자열 전체 내용을 정확하게 알지 못할때,
 검색가능한 것은 like연산자와 와일드카드 활용하는 방법이다..
 형식) 검색컬럼명 like '%검색할데이터%'
 
 ex)사원명 K가 포함된 데이터를 list하세요.
 */
 
 select*from EMP
 where ename like '%K%';
  select*from EMP
 where ename like 'K%';
 
 select job, ename, comm from emp where job like 'S%' and comm in(300,400,700);
 select * from em;
 
