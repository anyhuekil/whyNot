select * from emp;
--
/*
or연산자 : 조회 조건에 있어서, 하나의 조건만 만족하더라도, 해당 데이터가 출력 처리되는것
select 컬럼
from 테이블명
where 컬럼1 = 조건1 or 컬럼2 = 조건2
컬럼1=조건1이 만족하거나, 컬럼2=조건2가 하나만이라도 만족할때
데이터를 list한다
ex) 부서번호가 30이거나 사원명 'SMITH'인 데이터 list
*/
select * from emp where deptno=30 or ename='SMITH';
-- 확인예제) 보너스가 있거나 직책이 'SALESMAN'인 데이터 list
select * from emp where comm is not null or job='SALESMAN';
/*
not 연산자
해당 연산자의 참이면 거짓, 거짓이면 참으로 처리되어 나타낼 필요가 있을때 사용
일반적으로 조건 이외에 데이터를 리스트할 때

부서번호가 10이 아닌 데이터를 list
*/
select * from emp
where not deptno=10;
-- deptno <>10, deptno !=10 (동일한 효과)
-- 확인예제) 연봉이 2000~3000이 아닌 것을 keyword를 활용해서 list
select * from emp
where not (sal>=2000 and sal<=3000);
-- 확인예제) 직책이 SALESMAN이 아니고, 연봉이 2000이상인 사원을 list
select * from emp
where not job='SALESMAN' and sal >= 2000;
/*
between and 연산자
데이터의 범위가 특정 조건 사이에 있을 때, 활용되는 키워드
where 컬럼명 between A and B
해당 데이터중 컬럼명에 범위가 A와 B사이에 있는 것을 말한다
연봉이 2000에서 3000사이에 있는 데이터를 list
*/
select * from emp
where sal between 2000 and 3000;
-- 확인예제) 사번이 7400~7500 사이에 있으며, 연봉이 2000미만이거나 3000초과하는 데이터list
select * from emp
where empno between 7400 and 7500 and not (sal between 2000 and 3000);
/*
날짜에 대한 처리
입사일이 1981/01/01 에서 1981/12/31 사이에 있는 데이터를 list
*/
select * from emp
where emp.HIREDATE BETWEEN '1981/01/01' and '1981/12/31';
-- 입사일이 1981년 12월에 입사한 사람의 이름과 부서번호를 list
select ename, deptno from emp where hiredate between '1981/12/01' and '1981/12/31';
-- sysdate : 현재 날짜를 출력하는 내용
select ename, hiredate, sysdate
from emp;
/*
in 연산자
해당 데이터에 대한 조건을 처리할 때, 여러 데이터에 대한 조회를 하고자 할 때 활용
or연산자와 동일한 내용
형식) 컬럼명 in(해당데이터1,해당데이터2,해당데이터3)
*/
select * from emp;
-- 관리자 번호가 7902, 7566, 7839인것을 list
select * from emp
where mgr in (7902,7566,7839);
-- 확인예제) 사원이름이 'SMITH', 'WARD', 'JONES' 인 사람 중, 연봉이 1000미만인 데이터를 이름과 연봉list
select ename, sal from emp
where ename in('SMITH', 'WARD', 'JONES') and sal<=1000;
/*
like연산자와 와일드카드(%,_)활용하기
특정데이터에 대한 문자열 전체 내용을 정확하게 알지 못할 때, 검색가능한 것은 like연산자와 와일드카드를 활용
형식) 검색컬럼명 like '%검색할데이터%';

ex) 사원명에 K가 포함된 데이터를 list 
*/
select * from emp
where ename like '%K%';
-- 만약 K로 시작하는 데이터를 list하려면?
select * from emp
where ename like 'K%';
select * from emp;
-- 직책중, MAN으로 끝나는 데이터를 list
select * from emp
where job like '%MAN';
-- 확인예제) 직책중 S로 시작하는 데이터에서 보너스가 300이거나 400,700인 데이터를 직책,사원명, 보너스를 list
select job, ename, comm from emp
where job like 'S%' and comm in(300, 400, 700);
select * from emp;
/*
와일드 카드(_) 사용하기
_글자수를 제한해서 해당내용을 검색하고자 할 때, 활용
ex) 두번째 글자가 'A'인 사원을 list
*/
select * from emp
where ename like '_A%';
-- 두번째 글자가 A로 된 내용 전체 출력
-- 확인예제) 사원명이 3번째 글짜가 A인 데이터중 급여가 2000이상인 데이터 list
select * from emp
where ename like '__A%' and sal >= 2000;
/*
not like '와일드카드(%,_)'해당 조건이 아닌 것을 출력
*/
select * from emp
where ename not like '%A%';
-- 확인예제) 직책이 ER로 끝나지 않는 데이터 중, 1981년도에 입사한 사람을 list
select * from emp
where job not like '%ER' and hiredate between '1981/01/01' and '1981/12/31';
/*
정렬처리
데이터는 일정한 범위내에서 오름차순, 내림차순으로 정렬할 수 있다
이에 대한 기준되는 컬럼을 정해야 하며, 오름차순인지 내림차순인지를 표현
형식) order by 기준컬럼1 asc/desc
asc : 오름차순을 말하며 일반적으로 설정하지 않으면 default값
desc : 내림차순을 말한다
ex) 급여기준으로 오름차순으로 출력 
*/
select * from emp
order by sal asc;
select * from emp
order by sal desc;
-- ex) 직책이 MANAGER인 데이터를 입사일 기준으로 오름차순 list
select * from emp
where job = 'MANAGER'
order by hiredate;
-- 확인예제) 보너스가 있는 데이터를 기준으로 내림차순으로 사원명, 급여, 보너스를 list
select ename, sal, comm from emp
where comm is not null
order by comm desc;
-- 정렬기준이 이중 내지 3중으로 되어 있다면 어떻게 할까?
select ename, sal, comm from emp
order by comm desc;
-- comm이 동일할 때는 sal기준으로 내림차순 처리
select ename, sal, comm from emp
order by comm desc, sal desc;
/*
확인예제
1) 입사일을 오름차순으로 정렬하되 사원번호, 사원명, 직급, 입사일을 출력
2) 사원번호를 기준으로 내림차순으로 정렬하여 사원번호와 사원명 출력
3) 부서 번호가 빠른 사원부터 출력하되 같은 부서내 사원은 최근 입사한 사원부터 출력
	사원번호, 입사일, 사원명, 급여순으로
*/
select empno, ename, job, hiredate from emp
order by hiredate;
select empno, ename from emp
order by empno desc;
select empno, hiredate, ename, sal from emp
order by deptno asc, hiredate desc;
select * from dual;
/*
dual : 데이터를 테스트하기 위한 용도의 oracle 내장 객체, 한 행으로 출력된다
주로 연산, 함수적용내용 확인
*/
select 10+10 plus, sysdate, 10||'+'||10||'='||(10+10) calcu from dual;
select * from emp;
