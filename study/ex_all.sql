select * from emp;
-- 주석 단축키 ctrl+/
-- 안녕하세요
-- 주석문입니다.
-- select : 특정테이블의 컬럼명을 선택하는 명령어.
-- 1) * : 전체 컬럼을 생성된 순서로 list 할때.
-- 2) 컬럼명 : 해당 데이터를 보기 위한 명령어..
-- 3) from 테이블명 : 테이블을 list하기 위하여..
select * from emp;
-- emp테이블의 전체 컬럼 내용을 list하세요..
select empno, job from emp;
-- emp테이블의 컬럼 중에 empno와 job 순으로 list
select deptno, ename, sal from emp;
-- 부서번호, 이름, 급여
--  실제 프로그램과 로딩 부분은 컬럼명이 중요함.
-- empno : 사원번호, ename:사원이름, job : 직책, mgr:관리자의사번,
-- hiredate : 입사일, sal : 연봉, comm : 보너스, deptno:부서번호.
-- 문제)  사원이름과 직책, 부서번호 순으로 데이터를 list 하세요..
select ename, job, deptno from emp;
-- 산술 연산자..
-- 	데이터베이스의 컬럼단위로 연산을 처리할 수 있다.. 기본적인 +,-,*,/
--  %(없음)-함수를 활용해야함.
select * from emp;
-- 현재 연봉에 +100을 더한 값을 출력하세요. (이름, 급여)
select ename, sal, sal+100, sal-10, sal*10, sal/10 from emp;
-- 컬럼간의 연산처리 : 컬럼명1+컬럼명2
select * from emp;
-- ex) 부서번호와 연봉을 합산한 내용을 출력하세요..
select ename, sal, deptno, sal + deptno from emp;
-- 문제1) 연봉이 올해 전직원을 대상으로 10%올랐다. sal * 10%(X)
--  사원명, 기존연봉, 인상분, 연상된연봉총합을 출력하세요..
select ename, sal, sal*0.1, sal+(sal*0.1) from emp;
select * from emp;
-- 문제2) 부서별로 연봉인상분을 다르게 책정.
-- 부서번호 10==> 10%, 20 ==> 20%, 30 ==> 30%로 인상
--  이름, 부서번호, 연봉, 인상된연봉
select ename, deptno, sal, (sal*(deptno*0.01)), sal+(sal*(deptno*0.01)) from emp;
-- 문자열을 표현 +?
-- database 문자열 연결처리는 '||'를 활용한다.
select '사원의 이름은 '||ename ||'이고, 부서번호는 '||deptno||' 입니다..' from emp;
select * from emp;
-- 확인 예제)  사원번호가 @@@ 인  @@@@(이름)는 올해 연봉인 @@@@ 만원 입니다!! --출력list처리..
select '사원번호가 ' || empno ||'인 ' || ename ||'는 올해 연봉이 '|| sal ||' 만원입니다!!' from emp;
/*
과제
아래의 형식으로 데이터를 나타내세요..  
1. ename은 현재 연봉인 @@@만원 인데, 최근에 5%인상된 금액이며, 작년 연봉은 @@@만원이었습니다.
2. ename의 입사일은 hiredate 입니다.
3. 직책인 @@@인 @@@는 부서번호가 @@@ 입니다.
4. @@@님은 현재 연봉과  보너스(comm)의 합산액은 @@@ 입니다.  
*/
-- nvl()
-- null : 데이터 베이스에는 데이터가 없는 값을 null값이라고 한다. 공백('')도 아니면 0아닌
-- 말그대로 데이터가 입력되어 있는 않는 것을 말한다.
-- 프로그램에서 쓰이는 초기값과 구분해서 알고 있어야 한다.
-- 주의 :화면과 연동될 때는 null가 표시되어거나, nullpointerException이라는 에러가 발생한다.
-- 또한 데이터 컬럼간의 연산도 정상적으로 되지 않는다..
select sal, sal+1,sal+0,sal+null from emp;
-- 그래서 데이터베이스에서는 null에 대한 연산의 정상적인 처리를 위해 함수를 만들어서 활용한다.
-- nvl을 활용하면 null값일 때, 초기값에 대한 정의를 해서 정상 처리가 가능하게 한다.
-- nvl(컬럼명, 데이터가 null일 때 처리할 데이터)
select * from emp;
select comm, comm+10, nvl(comm,0), nvl(comm,0)+10 from emp;

/*1페이지끝*/

-- 컬럼명에 이름(별명) 붙이기!!

select * from emp;
-- empno를 별칭으로 companyNo로 쓰기로 했다. 출력하세요..
-- 컬럼명 as 나타날 별칭컬럼명 alias
select empno as companyNo from emp;
-- 별칭은 프로그램 영역에서 중요한 의미를 가진다..
-- 대다수 프로그램은 별칭으로 간편하게 사용하는 경우가 많다.
-- ex) rs.getString("별칭/컬럼명")
--  as 대신에 공백(' ')으로 처리한다.
select '사번은'||empno || ' 입니다!' show from emp;
-- 실제 application에서는 rs.getString("show")로 처리된다.
select * from emp;
-- 다음의 내용을 변경된 컬럼으로 나타내세요..
-- 컬럼명        depandname   upgradeRatio   enterCompany  
-- 출력데이터  (부서번호)이름    연봉의 10%     입사년월일
select '( '||deptno||' ) '|| ename depandname, sal*0.1 upgradeRatio, 
		hiredate enterCompany from emp;
-- 	공백값을 별칭으로 처리하기..: " "사이 별칭명을 적어준다.
select ename "name intro" from emp;
-- 한글을 별칭으로 처리할 때도, " "사이에 처리
select deptno "부서번호" from emp;

select * from emp;
-- 중복값 처리 : 데이터베이스에서는 동일한 값을 입력하는 것을 테이블단위로
-- 입력하는 것을 꺼려한다. 
-- 컬럼에 있는 모든 데이터가 동일해서는 안된다는 말이다.
-- 그런데, 한개 컬럼으로 조회할 때는 동일한 데이터가 나타날 수 있다.
select deptno from emp;
-- 일때, 하나 또는 다수의 컬럼의 데이터가 동일한 것을 filtering 해주는 처리가
-- 있는데 이를 distinct라고 한다.
-- 활용형식 select distinct 컬럼1, 컬럼2.. from 테이블
select distinct deptno from emp;
select * from emp;
-- 확인예제1) -mgr을 동일값 없이 출력하세요..
-- 확인예제2) job과 mgr 컬럼이 동일값 없이 출력하세요.
select distinct mgr from emp;
select distinct job, mgr from emp;
/*
조건처리..
특정한 데이터 list내용에서 필요한 데이터한 행단위로 filtering하는 것을
말한다.
1. 범위 처리..
*/
select * from emp;
-- 연봉이 3000이상인 데이터를 list 처리..
-- where 컬럼명 > 조건데이터
select * from emp
where sal>=3000;
-- 데이터베이스서 쓰이는 비교연산자
-- = (*), >, <, >=, <=,   <>,!=(다를때)
select * from emp;
-- 1) 부서번호 30인 데이터를 list 하세요..
select * from emp
where deptno=30;
-- 2) 연봉이 1000미만인 데이터
select * from emp
where sal<1000;
-- 3) ename이 SMITH인 데이터
select * from emp where ename='SMITH';
-- 4) COMM이 NULL인 데이터(*) - 지금까지 배운 함수활용
select * from emp where nvl(comm,0)=0;
-- 	null값을 나타내는 keyword is null
select * from emp where comm is null; 
--null값 아닐 때, is not null
select * from emp where comm is not null;
-- 5) MGR이 7698이 아닌 데이터
select * from emp where mgr != 7698;
-- 열과 행의 두가지 조건을 갖춘 데이터 list하기..
-- 행의 multi 조건에 대한 처리..
select * from emp;
-- 연봉이 3000이상인 사람의 이름과 연봉을 list
select ename, sal 
from emp
where sal>=3000;
select * from emp;
-- 연봉이 2000이하이고 직책이 SALESMAN인 사람의
-- 이름, 직책, 연봉을 출력..
select ename "이름", job "직책", sal "연봉"
from emp
where sal<=2000
and job='SALESMAN';
-- 컬럼명은 대소문자 구분하지 않지만, 데이터는 대소문자 구분한다.
-- 연습예제
-- 1. EMP중에 급여가 2000미만이 되는 사원 정보 중에 사번과 급여를 출력하라.
select ename, sal from emp where sal<2000;
-- 2. 연봉과 보너스의 합산 금액이 1500미만인 사람의 이름, 연봉, 보너스, 
--    합산액을 출력하세요.
select ename, sal, comm from emp where sal+nvl(comm,0)<1500;
-- 3. MGR이 NULL인 사람 JOB, 이름, 연봉을 출력하세요.
select job, ename, sal from emp where mgr is null;
-- 4. JOB이 CLERK인 사람중 DEPTNO가 30인 사람의 이름, 직책, 
--    부서번호를 출력하세요
select ename, job, deptno from emp where job = 'CLERK';
-- 5. 연봉이 2000에서 3000 사이에 있는 사람의 부서번호, 
--    이름, 연봉을 출력하세요.
select deptno, ename, sal
from emp where sal>=2000 and sal<=3000;
select * from emp;


/*2페이지 끝*/

select * from emp;
--
/*
or 연산자 : 조회 조건에 있어서, 하나의 조건만 만족하더라도,
해당 데이터가 출력 처리되는 것을 말한다.
select 컬럼
from 테이블명
where 컬럼1 = 조건1 or 컬럼2 = 조건2
위에서와 같이 컬럼1=조건1이 만족하거나, 컬럼2=조건2가 만족할 때 
데이터가 나타나는 것으로 해당 데이터를 전부 list한다.
ex) 부서번호가 30이거나 사원명이 'SMITH'인 데이터를 list하세요.
*/
select * from EMP 
where deptno=30 or ename='SMITH';
-- 확인예제) 보너스가 있거나 직책이 'SALESMAN'인 것을 출력하세요.
select * from emp
where comm is not null or job = 'SALESMAN';
/*
NOT 연산자
해당 연산자의 참이면 거짓, 거짓이면 참으로 처리되어 나타날 필요가 있을 때,
활용한다.
일반적으로, 조건 이외에 데이터를 리스트하고자 할 때 활용된다.

부서번호가 10이 아닌 데이터를 리스트하세요 
*/
SELECT * FROM EMP 
WHERE not deptno = 10;
-- deptno <> 10, deptno !=10 (동일한 효과)
select * from emp;
--  확인예제) 연봉이 2000~3000이 아닌(2000미만 이거나 3000초과)인 것을 not
-- keyword를 활용해서 list 하세요.
select * from emp
where not (sal>=2000 and sal<=3000);
-- 확인예제) 직책이 SALESMAN이 아니고, 연봉이 2000이상인 사원을 LIST하세요
select * from emp
where not job ='SALESMAN'
and sal>=2000;
/*
between and연산자 
데이터의 범위가 특정 조건 사이에 있을 때, 활용되는 키워드이다.
where 컬럼명 between A and B
해당 데이터중 컬럼명에 범위가 A와 B사이에 있는 것을 말한다.
ex) 연봉이 2000에서 3000사이에 있는 데이터를 list하세요..
*/
select * from emp
where sal between 2000 and 3000;
-- 확인예제 사번이 7400~7500 사이에 있으며 연봉이 2000미만이거나 3000초과하는
--         데이터를 list 하세요..
select * from emp
where empno between 7400 and 7500
and not (sal between 2000 and 3000);
/*
날짜에 대한 처리..
입사일이 1981/01/01 에서 1981/12/31 사이에 있는 데이터를 list하세요..
*/
--확인예제) 입사일이 1981년 12월에 입사한 사람의 이름과 부서번호를 출력하세요.
select * from EMP 
where EMP.HIREDATE between '1981/12/01' and '1981/12/31';
-- sysdate : 현재 날짜를 출력주는 내용
select ename, hiredate, sysdate
from emp;
/*
IN 연산자
	해당 데이터에 대한 조건을 처리할 때, 여러 데이터에 대한 조회를 하고자 할때 활용된다.
	or연산자와 동일한 내용
	형식) 컬럼명 IN (해당데이터1, 해당데이터2, 해당데이터3)
*/
select * from EMP;
-- 관리자번호가 7902, 7566, 7839인것을 LIST하세요..
SELECT * FROM emp
where mgr in (7902,7566,7839);
-- 확인예제) 사원이름이 'SMITH', 'WARD', 'JONES' 인 사람 중, 연봉이 1000미만인 데이터를
--         이름과 연봉을 출력하세요.
select * from emp
where ename in('SMITH', 'WARD', 'JONES') AND SAL<1000;
/*
like연산자와 와일드카드(%,_)활용하기.
특정데이터에 대한 문자열 전체 내용을 정확하게 알지 못할 때, 검색가능한 것은 like연사자와
와일드카드를 활용하는 방법이다..
형식) 검색컬럼명 like '%검색할데이터%';

ex) 사원명이 K가 포함한 데이터를 list하세요
*/
select * from emp
where ename like '%K%';
-- 만역 K로 시작하는 데이터를 list할려면?
select * from emp
where ename like 'K%';
select * from emp;
-- 직책중, MAN으로 끝나는 데이터를 list하세요..
select * from emp
where job like '%MAN';
SELECT * FROM EMP;
-- 확인예제) 직책중, S로 시작하는 데이터에서 보너스가 300이거나 400이거나, 700인 데이터를
--       직책, 사원명, 보너스를 list하세요..
select job, ename, comm
from emp
where job like 'S%'
and comm in(300,400,700);
select * from emp;
/*
와일드카드(_) 사용하기
_글자수를 제한해서 해당내용을 검색하고자 할때, 활용한다..

ex) 두번째 글자가 'A'인 사원을 list 
*/
select * from emp
where ename like '_A%';
--두번째 글자가 A로된 내용 전체 출력
-- 확인예제) 사원명이 3번째 글자가 A인 데이터중에  급여가 2000이상인 것을 list하세요.
select * from emp
where ename like '__A%' and sal > 2000;
/*
NOT LIKE '와이드카드(%,_)'해당 조건이 아닌 것을 출력
ex) 이름에 'A'문자가 포함되지 않는 사람만 검색.
*/
select * from emp
where ename not like '%A%';
select * from emp;
-- 확인예제) 직책이 ER로 끝나지 않는 데이터 중, 1981년도에 입사한 사람을 list하세요..
select * from emp
where job not like '%ER'
AND hiredate between '1981/01/01' and '1981/12/31';
/*
정렬처리..
데이터는 일정한 범위내에서 오름차순, 내림차순으로 정렬처리할 수 있다.
그럼, 이에 대한 기준되는 컬럼을 정해야 하며, 오른 차순인지 내림차순인지를 표현해야 한다.
형식) order by 기준컬럼1 asc/desc
asc : 오름차순을 말하면 일반적으로 설정하지 않으면 오른차순으로 출력된다. default
desc : 내림차순을 말한다.
ex) 급여기준으로 오름차순/내림차순 으로 출력하세요..
*/
select * from emp
order by sal asc;
select * from emp
order by sal desc;
-- ex) 직책인 MANAGER인 데이터를 입사일 기준으로 오름차순으로 LIST
SELECT * FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY HIREDATE;
SELECT * FROM EMP;
-- 확인예제) 보너스가 있는 데이터를 기준으로 내림차순으로 사원명, 급여, 보너스를 출력하세요
SELECT ename, sal, comm FROM EMP
WHERE COMM IS NOT NULL
order by comm desc;
-- 정렬기준이 이중 내지 3중으로 되어 있다면 어떻게 할까?
SELECT ename, sal, comm FROM EMP
order by comm desc;
--  comm이 동일할 때는 sal기준으로 내림차순 처리한다.
SELECT ename, sal, comm FROM EMP
order by comm desc, sal desc;
-- 확인예제
-- 1) 입사일을 오름차순으로 정렬하되, 사원번호, 사원명, 직급, 입사일을 출력
select empno, ename, job, hiredate
from emp
order by hiredate;
-- 2) 사원번호를 기준으로 내림차순으로 정렬하여 사원번호와 사원명 출력
select empno, ename
from emp
order by empno desc;
-- 3) 부서 번호가 빠른 사원부터 출력하되 같은 부서내 사원은 최근 입사한 사원부터 출력
-- 	사원번호, 입사일, 사원명, 급여순으로 출력
select deptno, hiredate, ename, sal
from emp
order by deptno asc, hiredate desc;
select * from dual;
/*
dual : 데이터를 테스트하기 위한 용도의 oracle 내장 객체, 한 행으로 출력된다. 
주로, 연산, 함수적용내용 확인하는데 활용
*/
select 10+10 plus, sysdate, 10||'+'||10||'='||(10+10) calcu from dual;
select * from emp;


/*3페이지 끝*/

select * from emp;
/*
숫자함수 : 숫자를 처리하는 함수. 절대값, 수학함수(sin, cos, tan...)
		 올림(ceil),반올림(round),내림(trunc, floor), 나머지(mod)를 처리함.

1. abs :절대값-부호에 관계 없이, 양수로 처리하는 함수를 말한다.		 
*/
select 25, -25, abs(25), abs(-25) from dual;
/*
2. floor() : 소숫점 아래를 버리는 함수.
*/
select 25.75, floor(25.75) from dual;
/*
3. round() : 반올림 처리 함수
	round(데이터, 반올림할 자리수)
		반올림한 자리수 : 양수 - 소숫점 이하의 자리수 처리
					   음수 - 십단위(1), 백단위(2) 식으로 해당 단위 만큼 반올림처리.
					   
*/
select 25.278888, round(25.278888,2) from dual;
select 625.2999, round(625.2999,-2) from dual; -- 백자리로 반올림처리 됨.
select * from emp;
-- 숙제)
-- sal를 연봉이라고 할 때, 이달 급여분(1/13)을 처리하시오, 단 이달은 보너스가 있는 달입니다.
-- 출력내용 : 사번, 연봉, 이달급여, 보너스, 총급여액(급여와, 
--   총급여액은  10단위로 반올림 처리한다.)
select empno, sal, round(sal/13,-1) monthpay, nvl(comm,0) bonus,
       round((sal/13)+nvl(comm,0),-1) totMonthpay
from emp;	   
/*
4. trunc함수 : 특정 자리수 이하로 절삭처리..
	trunc(데이터, 자리수처리)
*/
select trunc(24.2433, 2), trunc(24.243, -1) from dual;
select * from emp;
select trunc(29.9949,1) from dual;
/*
숙제 sal를 기준으로 
1000미만        - 10% 보너스
1000~2000미만 - 20% 보너스
2000~3000미만 - 30% 보너스
3000~4000미만 - 40% 보너스
4000~5000미만 - 50% 보너스
5000~이상      - 60% 보너스를
지급하기로 했다.. 함수를 활용해서. 아래 내용을 처리하시오.
사번 이름 연봉 보너스(%)  보너스
*/
select deptno, ename, sal, (floor(sal/1000)+1)*10||'%' per,
sal*(floor(sal/1000)+1)*0.1 bonus
from emp;
/*
5. mod함수 : 나머지 함수처리..
형식 : mod(데이터, 나눌수) :해당데이터를 나눌 수로 나눈 후, 나머지 내용에 대한 처리.
*/
select mod(27,2), mod(27,3), mod(27,4) from dual;
select * from emp;
-- 사원번호과 홀수인 사람을 검색하세요..
select * from EMP 
where mod(empno,2)=1;
select * from emp;
/*
숙제
사원을 부서기준으로 1팀과 2팀으로 나누어서 체육대회를 하기로 했다.
부서번호가 10, 30 ==> 1팀
부서번호가 20, 40 ==> 2팀
으로 나누고 다음과 같이 출력하세요.
부서번호  사원번호 이름     팀명
*/
select deptno, empno, ename, mod((deptno/10)+1,2)+1||'팀' teamName
from emp;
/*
문자 처리 함수.
1. upper 모든 데이터를 대문자로 전환처리
	upper(데이터)
	일반적으로 운영데이터가 소문자나 대문자가 섞여 입력되어 있는 경우,
	해당 데이터를 입력문자(대소문자 구분없이)로 해당 데이터를 검색할 경우 많이 쓰인다.
*/
select upper('hi! Good days!!') from dual;
select * from emp;
-- 직책을 대소문자 구분 없이 조회할려고 한다. 아래 salesman 이라고 입력되어도 검색하려면..
select * from emp
where job = upper('salesman');
/*
2. 소문자를 변환하는 lower함수..
	lower(데이터)
*/
select lower('Good night!!! This is the Best day!!') from dual;
select empno, lower(ename), lower(job) from emp;
/*
3. initcap함수 : 첫문자만 대문자, 나머지는 소문자 처리..
	initcap(데이터)
*/
select initcap(ename), initcap(job) from emp;
/* Smith is a Clerk!!  형식 출력..*/
select initcap(ename) ||' is a '||initcap(job)||'!!!' introJob from emp;
select * from emp;
/*
4. 문자길이를 처리하는 length
형식 length(데이터) : 한글과 영문상관없이 문자열의 갯수를 나타나게 함.
*/
select length('himan'), length('오라클') from dual;

select * from emp;
-- 직책이 5자 이하인 데이터를 출력하세요..
select * from emp where length(job) <=5;
/*
5. lengthb(): byte의 크기를 출력 - 영문(1자당 1byte), 한글(1자당 2bytes)
*/
select lengthb('himan'), lengthb('홍길동') from dual;
/*
6. substr(), substrb(): 특정 문자열의 일부를 추출하는 함수.
	substr(데이터, 1부터count하여 시작할 위치지정, 추출한 문자열의 갯수)
*/
select substr('Welcome to Oracle world!!', 4,5) from dual;
select * from emp;
/* ex) job을 기준으로 5개의 문자열을 추출하여, 이름과 직책을 출력*/
select ename, substr(job,1,5) from emp;
/* 확인예제 
	아래의 형식을 데이터를 화면에 list하세요..
	사번   이름   직책(이름의 문자열수 만큼만표시)
	7499 ALLEN SALES
*/
SELECT empno, ename, substr(job, 1, length(ename)) from emp;
-- hiredate 경우, 데이터 type이 날짜형식이지만, 자동 형변환이  되어
--   문자열 처리 함수를 문자열을 추출하여 처리할 수 있다.
select * from emp;
select substr(hiredate,1,length(hiredate))  from emp;
-- 1980년 데이터를 나타내세요..
select * from emp
where substr(hiredate,1,2) = '80';
select * from emp;
-- 1982년도 12월01월 ~ 1982년 12월31일 입사일인 사람을  이름과 입사일로 출력하세요.
select ename, hiredate  from emp
where substr(hiredate,1,5)='82/12';
-- 과제) 함수를 이용하여 다음 내용을 출력하세요..
-- @@@님  입사일  @@년 @@월 @@일 이면, 현재 연봉은 @@@ 만원 받고 있습니다. 
-- column명  empinfo
select ename||'님 입사일 19'|| substr(hiredate,1,2)||'년 '|| 
	substr(hiredate,4,2)||'월 '|| substr(hiredate,7,2)||'일 이며, '||
	'현재 연봉은 '||sal ||'만원 받고 있습니다' empinfo
from emp;
-- 과제)substr을 활용 하여 JOB이 MAN으로 끝나는 데이터를 출력하세요!!
select *
from emp
where substr(job, length(job)-2, length(job) )='MAN';
select *
from emp
where substr(job, -3 ) ='MAN';

/*
7. 특정 문자의 위치를 구한 instr
	instr(데이터, '검색할 문자') :처음부터 시작해서 1번째 검색할 데이터가 나타나 위치
*/
select instr('hi!! good man', 'man') from dual;
/*
	instr(데이터,'검색할 문자', 시작위치, 검색된 횟수) 
	instr('oh! hi!! my girl!! hi!! feel so good!', 'o',3,2);
*/
select instr('oh! hi!! my girl!! hi!! feel so good!', 'o',3,2) from dual;
select * from emp;
/* 입사일이 12월인 데이터를 이름과 입사일을 출력하세요 instr()를 활용 */

select ename, hiredate
from emp
where instr(substr(hiredate,4,2),'12')>0;


/* 4페이지끝 */

/*
LPAD/RPAD 함수.
특정 문자열에 해당한는 문자열로 채우는 처리를 하는 것을 말한다.
LPAD : 왼쪽에 문자로 채우세요  
	LPAD(데이터, 문자크기수,'반복할 문자열')

*/
-- # himan이라는 문자열 왼쪽에 '#'로 20크기만큼 채워서 출력..
--  전체크기를 만들고, 해당 크기가 되지 않으면 문자로 채움..\
-- 실무 migration varchar :가변문자형, char:고정문자형
-- 가변문자형의 데이터를 고정문자형으로 전환하여 이동시킬때 활용
select lpad('himan', 7, '#') from dual;
/*
RPAD : 오늘쪽에 해당 크기가 될 때까지 특정문자로 채움..
ex) good job에서 문자가 20개가 될 때까지 @로 오른쪽에 채움.
*/
select rpad('good job', 20, '@') from dual;
select * from emp;
-- 확인예제 ename과 job을 크기와 지정된 문자열만큼 오른쪽과 왼쪽에 해당 문자열을 아래 형식으로
-- 넣으세요..
-- 1. ENAME과 JOB에서 데이터 크기를 확인한다.
-- 2. 데이터 중에 가장 큰 데이터의 크기를 확인해서.
-- 3. ENAME에는 오른쪽에 @, JOB에는 왼쪽에 ^를 추가해서 나타나게 한다.
-- 4. 다음과 같은 순서로 출력
--    사원번호  이름(@) 직책(^)  입사일
SELECT MAX(LENGTH(ENAME)), MAX(LENGTH(JOB)) FROM EMP;
SELECT RPAD(ENAME,6,'@') ENAME, LPAD(JOB,9,'^') JOB, HIREDATE FROM EMP;
SELECT * FROM EMP;
/*
LTRIM(), RTRIM() 
공백의 문자를 삭제하는 함수.
LTRIM : 왼쪽에 공백문자를 삭제하는 처리
RTRIM : 오른쪽에 공백문자를 삭제하는 처리
ex) [공백]This is your best day!!  왼쪽에 공백문자를 제거 처리..!!
*/
select ltrim('    this is your best day!!!') showData, 
 	length('    this is your best day!!!') beforeLen,
	length(ltrim('    this is your best day!!!')) afterLen
 from dual;
--  오른쪽에 공백문자열을 제거하는 처리
select rtrim('what we dwell on is who we become!   ') showdata,
       length('what we dwell on is who we become!   ') beforeLen,
	   length(rtrim('what we dwell on is who we become!   ')) afterLen
from dual;
select * from emp;
/*
TRIM
	오늘쪽, 왼쪽에 있는 공백을 비롯해서 특정 문자열을 삭제 처리하는 함수.
	TRIM('삭제할문자열' FROM 데이터)
	ex) 'aaaaaaaGood morning!!aaaaaaaa'에서 오른쪽과 왼쪽에 a문자열을 삭제처리
*/
select trim('a' from 'aaaaaaaGood morning!!aaaaaaaa' ) showdata from dual;
select * from emp;
-- 확인예제 job에 'N'이나 'R' 'T'가 있으면 삭제된 내용으로 다음과 같이 출력하세요.
-- 이름  직책
SELECT ename, job, 
      trim('T' from trim('R' from trim('N' FROM job))) chjob
from emp;
select * from emp;
/*
날짜 함수..
sysdate : 오라클 내장된 현재 날짜와 시간을 출력하는 객체..
*/
select sysdate from dual;
select sysdate+1 from dual;
select sysdate-1 from dual;
select sysdate today, sysdate-1 yesterday, sysdate+1 tomorrow from dual;
select ename, hiredate, sysdate, floor(sysdate - hiredate) from emp;
/*
months_between : 두개의 날짜 데이터 사이의 개월 수를 구하는 내용..
	months_between(비교날짜데이터1, 비교날짜데이터2)
ex) 각 직원들의 근무한 개월 수를 구하세요..
*/
select ename, hiredate, trunc(months_between(sysdate, hiredate)) workingMonth
from emp;
select * from emp;
/*
add_months : 미래시점을 나타내는 함수로 개월 수를 더해서 해당날짜가 나타나게 한다.
	add_months(기준데이터, 이후개월수 )
 ex) 입사 날짜에서 6개월을 추가한 날짜를 출력하세요.	
*/
select ename, hiredate, add_months(hiredate,6) after6Months from emp;
select * from emp;
/*
숙제1)
6개월의 인턴기간에는 급여의 70%만 지급하기로 했다.
사원의 인턴기간만료시점을 출력하고, 6개월간의 급여의 총합을 계산하세요..
월급여 - sal/13 
인턴기간 - 월급여의 70%
인턴기간월급여총액 - 인턴기간6개월간 급여 총액을 10단위 절삭해서 출력
사원번호  사원명 입사일  인턴기간만료시점  인턴기간월급여총액(10단위절삭)
*/
/*
next_day : 주간단위로 가장 가까운 날짜를 산출할 때, 활용..
   next_day(날짜데이터, '요일') : 해당 요일에 가장 가까운 날짜 출력..
*/
select sysdate, next_day(sysdate, '수요일') from dual;
/*
확인예제) 사원들의 입사후, 첫번째 토요일을 출력하세요..
*/
select ename, hiredate, next_day(hiredate,'토요일') firstHoliday from emp;
select * from emp;
/*
last_day 함수
	해당 당의 마지막 날짜를 반환처리.
*/
select last_day(sysdate) thisLastDate, 
	last_day(sysdate)+1 nextFirstDate from dual;
-- 다음달 첫날
--
select * from emp;
-- 급여 계산.. 3단계 급여일을 나누어서 출력하세요.
-- 1단계 당월 20일
-- 2단계 당월 마지막날
-- 3단계 다음달 10일
-- 사원 입사일 첫월급1 첫월급2 첫월급3
select ename, hiredate, 
	last_day(hiredate) grade02
	 from emp;
/*
형변환 함수
오라클에서 데이터간 형변환을 해서, 필요한 형식이나 type으로 나타내야 한다.
이 때, 활용하는 것이 형변환 함수이다.
to_char() : 날짜나 숫자형을 문자형으로 변환
to_date() : 문자형을 날짜형으로 변환
to_number() : 문자형을 숫자형으로 변환

to_char()
1) 날짜형을 문자형으로 변환하기.
	to_char(날짜데이터, '표현할 문자형태' )
	날짜표현하는 문자 형태의 종류
	YYYY : 년도 표시, YY :년도 2자리표시
	MM : 월 표시, MON:월 영문으로 표시 ex)JAN
	DAY : 요일 표시, DY:요일 약어표시.
	DD : 날짜 표시
	
ex) 입사일을 년도-월-일  로 표현하시오..
*/
select ename, to_char(hiredate, 'YYYY-MM-DD') hiredate1,
to_char(hiredate, 'YY/MM/DD') hiredate2,
to_char(hiredate, 'YYYY"년" MM"월" DD"일"') hiredate2
from emp;
select * from emp;
-- 확인예제
-- 아래형식으로 출력하세요.
-- [사원이름]은  @@년 @@월 @@일에 급여를 @@@ 만원 받기로 하고 입사했습니다.
select ename||'은 '||to_char(hiredate,'YY"년" MM"월" DD"일" DAY')
        ||'에 급여를 '|| sal ||'만원 받기로 하고 입사했습니다.' show
from emp;
select * from emp;
/*
2) 시간출력형식 to_char(날짜데이터, '날짜출력형식  시간출력형식')
	AM 또는 PM  : 오전오후 표시
	AM. 또는 PM. : 오전. 오후. 표시
	HH 또는 HH12 : 12시간 표시(1~12)
	HH24 : 24시간 표시(0~23)
	MI :minutes 분표시
	SS : seconds 초표시
ex)	현재시간을 날짜와 시간 형식에 의해 표시
	YYYY/MM/DD  HH24:MI:SS
*/
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') today from dual;
/*
숙제
	근무개월수에 따른 차등 보너스 지급
	가장 오래된 개월~가장 최근에 입사한 개월수
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (연봉기준)
	사원, 입사일, 현재날짜(@@/@@/@@ AM @@시 @@분 @@ 초), 근무개월수, 보너스
25/3 ==>8.33  410~434 

*/
select 25/3 from emp;
select ename, hiredate, 
	to_char(sysdate,'YY/MM/DD AM HH24"시" MM"분" SS"초"') today,
 floor(months_between(sysdate,hiredate )) workMonth,
  floor(months_between(sysdate,hiredate ))-410 bonusKey,
  (floor((floor(months_between(sysdate,hiredate ))-410)/8.33)+1)*10||'%' bonusKey2,
  round(sal*((floor((floor(months_between(sysdate,hiredate ))-410)/8.33)+1)/100)) bonus
 from emp;
select * from emp;
/*
숫자형을 문자형 처리..
to_char(데이터, '형식')
출력형식
0 : 자릿수가 맞지 않은 경우, 지정된 자리수가 실제 데이터의 자리수 보다 큰경우
    에 0으로 채워진다.
9 : 자리수 상관 없이 해당 데이터 나타남. 채워지지 않는다.
L : 지역별 현금단위 표시
. : 소숫점 표시
, : 천단위 표시
*/
select to_char(1000,'000000') from dual;
-- 해당 자리수 보다 클때 0으로 채워짐.
select to_char(1000,'999999') from dual;
-- 채워지는 처리하지 않음.
select to_char(1000,'999') from dual;
-- 자리수가 적으면 ##로 표시됨.
select to_char(24333, 'L999999') from dual;
-- 원단위 표시
select to_char(23433, 'L999,999') from dual;
--천단위(,) 표시.
select to_char(24333.2422, '999,999.999') from dual;
--소수점(.) 표시
select * from emp;
-- 확인) 이름과 급여을 표시하되
--      급여는 소숫점이하는 표시되지 않고, 자리수는 7자리로 표시하되 나타나지 않는
--      자리는 '0'으로 표시하시고
select ename, to_char(sal,'0000000') sal from emp;
/*
to_date(): 문자 ==> 날짜.
 입력한 날짜형의 문자를 입력할 때, 날짜 데이터를 조회 처리..
 검색을 할려면 문자를 날짜로 변환하여 처리..
 문자는 날짜형태로 어떻게 인식하는가?
 1980/12/12 --> to_date()에서 어떤 형식으로 입력할 것인지 지정.!!!
 to_date(입력데이터, '형식을 지정')
 ex) to_date('19811020', 'YYYYMMDD')
*/
-- select * from emp
-- where hiredate='12/17/1980'; (x)
select * from emp;
--ex)  입사일이 1980/12/17 인 데이터를 검색
select * from emp
where hiredate=to_date('1980/12/17','YYYY/MM/DD');
--
-- 문자열 ==> 입력형식 지정 ==> to_date() 처리..
/*
확인예제) 입력값이 '1981-02-20'이며, 이 데이터로 검색되는 입사일에 해당하는
		사원명  입사일(1981년02월20일) 을 출력하려고 한다. 
*/
select ename, to_char(hiredate,'YYYY"년"MM"월"DD"일"') "입사일" 
from emp
where hiredate=to_date('1981-02-20','YYYY-MM-DD');
select * from emp;
/*
숙제
조회값이 '1981년01월01일' 부터 '1982년12월12일' 사이의 데이터 중,
	부서가 30인 데이터를 조회하여,
list형식 
	사원명(10자리-앞에 #기호처리)
	직책(10자리-나머지뒤에 '-'처리)
	입사일(@@년 @@월 @@일 @요일 24시 @@분 @@초 )
	연봉( ####1,600.0 표시)  로 나타내세요..
*/
select lpad(ename,10,'#') "사원명",
	   rpad(job,10,'-') "직책",
	   to_char(hiredate,'YY"년" MM"월" DD"일" DAY HH24"시" MI"분" SS"초"') "입사일",
	   lpad(ltrim(to_char(sal,'9,999.9')),12,'#') "연봉", deptno
from emp
where hiredate between 
		to_date('1981년01월01일','YYYY"년"MM"월"DD"일"') AND
		to_date('1982년12월12일','YYYY"년"MM"월"DD"일"')
	AND DEPTNO = 30;
/*
숫자형 문자열이 입력되었을 때, 처리할 to_number() 함수
입력되는 문자열의 형식을 지정, to_number로 데이터 입력 처리..
to_number(입력할 데이터, '형식지정')
*/
-- select '20,000' - '30,000' from dual;
select to_number('20,000','99,999') -to_number('30,000','99,999') calcu 
from dual;
select * from emp;
-- 확인)연봉을 검색할려고 한다.   '3,000'이라는 입력값을 통해 3000이하의 연봉을
-- 가진 사람의 이름과 연봉을 W(원) 3,000로 출력하세요
select ename, to_char(sal,'L99,999') money
from emp
where sal < to_number('3,000','9,999');
select * from emp;
/*
연봉과 보너스를 합산한 금액을  이름과 총액으로 표시할려고 한다.
nvl : 해당 데이터가 null일때, 표현할 default 데이터를 지정하여,
     값이 없을 때에도 정상적으로 데이터를 처리하기 위한 것이다.
	 숫자 nvl(데이터,0)    숫자일 때는 0
	 문자 nvl(데이터,' ')  문자일 때는 ' '공백으로 처리..
*/
select ename, sal, comm,  sal+nvl(comm,0) tot
from emp;
select * from emp;
-- 숙제
--  이름  관리자번호    보너스
-- ==> 데이터가 없을 때는  관리자번호경우 '최고레벨',
--  보너스는 '0'표시
select ename, nvl(to_char(mgr),'최고레벨') mgr,
 nvl(comm,'0') comm from emp;


/* 5페이지 끝 */

/*
DECODE () :조건 처리를 위한 함수
	DECODE(데이터, 데이터1, 조건1데이터,
	                  데이터2, 조건2데이터,
				  그외에데이터)
ex)gender이라는 컬럼에 0이면 남자, 1이면 여자, 그외 중성				  
*/
select decode(0,0,'남자',1,'여자','중성') gender01,
		decode(1,0,'남자',1,'여자','중성') gender02,
		decode(2,0,'남자',1,'여자','중성') gender03,
		decode(3,0,'남자',1,'여자','중성') gender04
from dual;		
-- 부서번호가 10 회계, 20 감사, 30 영업, 40 운영, 그외는 '미정'
select ename, 
		decode(deptno,  10, '회계',
						20, '감사',
						30, '영업',
						40, '운영',
						'미정') selDept
 from emp;
 /*
직책을 한글로 풀이해서 출력처리
 CLERK :점원, SALESMAN : 영업맨, MANAGER :관리자.....
 사원번호, 직책(한글), 급여
 */
select ename, 
DECODE(JOB, 'CLERK','점원',
			'SALESMAN','영업맨',
			'MANAGER','관리자',
			'ANALYST','분석가',
			'PRESIDENT','대표',
			'기타') "직책(한글)"
 from emp;
/* 숙제 
연봉에 따른 등급체계를 나눌려고 한다.
decode를 활용해서,
	 1000 미만 F등급         성과급 3%
	 1000 ~ 2000미만 E등급   성과급 5%
	 2000 ~ 3000 미만 D등급  성과급 7%
	 3000 ~ 4000 미만 C등급  성과급 4%
	 4000 ~ 5000 미만 B등급  성과급 3%
	 5000 ~ 6000 미만 A등급  성과급 2%
이름  부서  연봉  연봉등급  성과급  총액(연봉+성과급)
*/
SELECT ename, deptno, sal, 
	decode(trunc(sal/1000),0,'F등급',
	                       1,'E등급',
						   2,'D등급',
						   3,'C등급',
						   4,'B등급',
						   5,'A등급',
						   '기타등급') "연봉등급",
	decode(trunc(sal/1000),0,round(sal*0.03)||'(3%)',
	                       1,round(sal*0.05)||'(5%)',
						   2,round(sal*0.07)||'(7%)',
						   3,round(sal*0.04)||'(4%)',
						   4,round(sal*0.03)||'(3%)',
						   5,round(sal*0.02)||'(2%)',
						   '기타등급') "성과급"	,
	decode(trunc(sal/1000),0,sal+round(sal*0.03),
	                       1,sal+round(sal*0.05),
						   2,sal+round(sal*0.07),
						   3,sal+round(sal*0.04),
						   4,sal+round(sal*0.03),
						   5,sal+round(sal*0.02),
						   '기타등급') "총액(연봉+성과급)"							   					    
from emp;
/*
case 함수 :조건에 따라 서로 다른 처리가 가능
CASE WHEN 조건1(비교연산자) THEN 처리할데이터
     WHEN 조건2(비교연산자) THEN 처리할데이터
	 WHEN 조건3(비교연산자) THEN 처리할데이터
     ELSE 위조건에 해당하지 않을 때 처리할 데이터..
END
EX) 점수에 따른 학점계산 방법 처리.. 	 
*/
SELECT CASE WHEN 80>=90 THEN 'A'
			WHEN 80>=80 THEN 'B'
			WHEN 80>=70 THEN 'C'
			WHEN 80>=60 THEN 'D'
		ELSE 'F'
	  END GRADE
FROM DUAL;	
SELECT * FROM EMP;
-- 	부서번호를 기준으로 신규부서 재배치처리 한다.
SELECT empno, ename,
	case when deptno=10 then '부서이동'
		 when deptno=20 then '인원감축'
		 when deptno=30 then '전원승진'
	     else '현부서배정'
	end  result
FROM EMP;	
/*
숙제) 입사 분기 기준 표시(1/4,2/4,3/4,4/4) 입사 분기를 표기
 사원번호, 이름, 입사(년/월), 입사분기

*/		
SELECT empno, ename, to_char(hiredate,'YY/MM') "입사", 
	trunc(to_number(to_char(hiredate,'MM'))/4)+1||'/4' "입사분기"
  FROM EMP;
select * from emp;

/* 6페이지 끝 */

select * from emp;
/*
그룹함수: 데이터를 그룹별로 통계치를 처리할 때 활용된다.
sum() : 총합산.
avg() : 평균
count() : 갯수
max() :최대값
min() :최소값

*/
select sum(sal) tot, avg(sal) avg01, count(sal) cnt,
       max(sal) max01, avg(sal) min01
from emp;	   

/*
1. DML : Data Maniplulation Language
1) select : 조회시 사용.
2) insert : 데이터 입력시 사용.
   insert into 테이블명 values(데이터1, 테이터2, 테이터3);
   
*/
select * from dept;
/*
테이블 복사하기..
create table 새로운테이블명
as select * from 복사할테이블명;
*/
create table dept01
as select * from dept;
select * from dept01;
/*
데이터 입력1)
ex) insert into dept01 values(50,'총무부','서울');
*/
insert into dept01 values(50,'총무부','서울');
select * from dept01;
commit; -- 확정처리, 재접속하거나 다른 사용자도 변경된 데이터를 볼 수 있게.
/*
데이터 입력2
insert into 테이블명(변경할컬럼명1, 변경할 컬럼명2) 
           values(첫번째입력할데이터,두번째입력할 데이터);
ex) dept01테이블에서 deptno만 60을 입력한다.
    dept01테이블에서 deptno와 loc만 입력한다.
*/
insert into dept01(deptno) values(60);
select * from dept01;
insert into dept01(deptno, loc) values(70,'인천');
/*
3) update : 입력되어 있는 데이터 내용중, 변경이 필요한 부분을
	수정처리한다.
	update 테이블명
	  set 변경하고자하는컬럼명1=변경할데이터,
	  	  변경하고자하는컬럼명2=변경할데이터
	 where 변경하고자하는 조건(컬럼명=조건데이터);
*/
select * from dept01;
-- dept01에 deptno가 60을 조건으로 하는 데이터를 dname 인사, loc 대전으로
-- 변경처리.
update dept01
  set dname='인사',
      loc='대전'
where deptno=60;
select * from dept01;	  
-- 확인예제..
-- select * from emp;
-- emp01이라는 복사 테이블을 만들고
-- 1) empno가 가장 많은 번호보다 +1해서, ename과 job, sal를 입력하세요
-- 2) 그외에 컬럼 mrg, hirdate(sysdate-현재날짜로수정), deptno는 40으로 수정처리하세요
select * from emp;
create table emp01
as select * from emp;
select max(empno)+1 from emp01;
-- 7935
insert into emp01(empno, ename, job, sal) 
          values(7935, '홍길동','SUPERMAN',5000);
commit;		  
SELECT * FROM emp01 where empno=7935;
update emp01
   set mgr=7777,
       hiredate=sysdate,
	   deptno=40
where empno=7935;
/* 숙제
emp03 복사테이블 생성
1. 입력  empno의 가장 작은수보다 -1, mgr:cleark의 mgr입력, sal:평균연봉, 
   comm:전체comm의 합계
2. 수정 ename:'신길동', job은 SUPERMAN, hirdate는 최근에 입사일+1
*/
select * from  emp;
/*
4. delete : 특정 조건의 데이터를 삭제처리하는 구문
	delete [없음] from 테이블명
	where 조건[컬럼명 = 조건데이터]
*/
-- DNAME이 'SALES'인 데이터를 DEPT01에서 삭제하시오..
DELETE FROM dept01
where DNAME='SALES';
-- 확인예제 deptno가 50이상인 데이터를 모두 삭제하시오..
select * from dept01;
delete from dept01
where deptno>=50;
-- emp01테이블 comm이 null이고, deptno가 20인 데이터를 삭제하세요.
delete from emp01
where comm is null
and deptno=20;
/*
Transaction(트랜잭션) : 데이터베이스에서 처리의 한 단위를 의미하며, 
여러개의 sql문의 하나의 논리적 작업 단위를 처리하는데 이를 의미하기도 한다.
TCL(Trasaction Control Language) : 이러한 트랜잭션을 제어를 위한 명령어..
 commit : 데이터의 dml을 통해 수정,삭제, 입력된 내용을 확정처리..
 rollback : 데이터를 commit하기전에 수정 삭제 입력된 내용을 원복처리..
 savepoint : 데이터를 특정시점으로 원복처리하고자 할때, 시점을 save하는 것을 말한다.
*/
select * from dept01;
-- 1) dept01테이블에 deptno 30 '총무' '강남'을 입력한 뒤, rollback처리를 해본다.
-- 2) dept01테이블에 deptno 40 '인사' '대전'을 입력한뒤,
--        commit하고  재접속한 경우와 commit하지 않고 재접속한 경우 데이터의 변경 내용을
--        확인한다.
insert into dept01 values(30,'총무','강남');
rollback;   -- 데이터가 입력되기 전으로 돌아가는 것을 확인할 수 있다.
 insert into dept01 values(50,'인사1','대전1');
-- db접속을 끊는다.
-- 외부에서 comit하기 전에는 데이터가 변경 원복이 된다.
-- tool에 따라 autocommit이 발생하는 경우가 있다..
select * from emp01;

/*
DDL :data definition language
테이블 구조 생성, 변경 및 삭제하는 것을 말한다.
크게..
1. 테이블 구조를 신규로 생성하는 create table
2. 테이블 구조를 변경하는 alter table
3. 테이블 구조를 삭제 drop table
4. 기타  -  truncate, rename 테이블명
*/
/*
1. create table(테이블생성)
	create table 테이블명(컬럼명 datatype 기타제약조건,
	                       ...      );
	1) datatype
		char(size) : 고정형 문자열, 문자열의 크기가 고정된 것으로
				큰데이터가 들어올 수 없지만, 작은데이터는 지정된 크기로 저장된다.
		varchar2(size) : 가변형 문자열, 데이터의 최대 크기를 지정하면,
				그 데이터 이하의 크기가 가변적으로 저장될 수 있다.
		number(전체자리수, 소수점이하자리수) : 숫자를 저장하는 data type,
				number(숫자), number( 숫자, 0) : 정수형 data type 저장.
				소수점이하자리수를 정해주면 실수형 데이터를 저장할 수 있다.
		date : 날짜를 저장하는 데이터 type (날짜+시분초)
		long : 4000byte이상의 문자열을 저장 할때 활용되는 데이터타입.최고치 2gb
		lob : 2g이하 바이너리(모든 파일저장가능) 데이터 저장
			

	1) 테이블 생성하기.
		create table 테이블명(컬럼명 데이터type)
		ex) emp10라는 테이블에 컬럼명 empno 정수형, ename 가변문자형, sal 실수형으로
			만들고자 한다.			
*/
	create table emp10( empno number(4), ename varchar2(20), sal number(7,2) );
/*
과제 login인 하는 화면을 만들고 id와 password을 체크하고, 다음 화면에서
	id@@@ 님 환영합니다. 남은 point는 @@@ 입니다. 라는 내용이 나타난다고 한다.
	이에 필요로 하는 테이블과 테이블 구조를 만드세요..
*/
/*테이블 구조 변경하기.
1. 테이블의 새로운 컬럼을 추가 할 때 - add column
2. 테이블에 컬럼을 수정할 때 - modify column
3. 테이블에 컬럼을 삭제할 때 - drop column

## 기본 형식..
alter table 테이블이름 add(컬럼명 데이터type)
ex) emp01에 job이라는 이름으로 가변형문자9가 들어가는 컬럼을 추가한다..
*/
select * from emp10;
alter table emp10 add(job varchar2(9));
-- 확인 emp10 날짜형데이터 createDate, 실수형데이터7,3 추가할려고 한다. 
alter table emp10 add(createDate date, sal2 number(7,3));
/*
테이블 컬럼 수정
alter table 테이블명
modify(변경할컬럼명 변경할데이터type);

ex) emp10테이블의 sal2 를 문자형으로 변경하고자 한다.

*/
alter table emp10
modify(sal2 varchar2(10));
/*
테이블에서 data type변경의 한계
1. 데이터 있는 경우
	1) 다른 data type으로 변경이 불가능..
	2) 같은 data type이라도 현재 보다 작은 데이터 type변경은 불가능.
2. 데이터 없는 경우
	type과 크기변경이 자유롭다.. 
*/
/*
테이블의 컬럼 삭제..
alter table 테이블명
drop column  컬럼명;

ex) emp10에서 sal2 컬럼을 삭제 처리한다..
*/
alter table emp10
drop column sal2;
select * from emp10;
/*
테이블명 변경
alter table 기존테이블명 rename to 새로운테이블명.
ex) emp10테이블명을 empexp10으로 테이블명을 변경한다.
*/
select * from empexp10;
alter table emp10 rename to empexp10;
/*
컬럼명 변경
alter table 테이블명 rename column 기존컬럼명 to 새로운컬럼명

ex) empexp10에서 createdate컬럼을 hiredate로 변경처리..
*/
alter table empexp10 rename column createdate to hiredate;
select * from empexp10;
/* 확인예제
	dept01 테이블을  dept10Exp라는 테이블명으로 변경하고,
	컬럼명 loc를 location으로 변경하시오. 크기는 13--> 25로.
	
*/
alter table dept01 rename to dept10Exp;
select * from dept10Exp;
alter table dept10Exp rename column loc to location; 
alter table dept10Exp modify location varchar(25);

/*
ddl로 데이터의 모든 내용 삭제 처리..
truncate table 테이블명..
 ex) dept10Exp에 있는 모든 데이터를 ddl로 삭제 처리..
*/
truncate table dept10Exp;
select * from dept10Exp;
/*
테이블 구조 삭제

*/


/*
데이터 무결성 제약 조건?
데이터의 신뢰성의 확보하기 위하여, 테이블 생성시, 컬럼 속성값으로
지정하는 것을 말한다.
#제약조건 5가지..
1) not null : null 허용하지 않는다.
2) unique : 동일값의 입력을 허용하지 않는다.
3) primary key : not null과 unqique를 처리해야 하는 것..
4) foreign key : 참조되는 테이블의 컬럼값이 존재해야 입력이 가능
5) check : 저장 가능한 데이터값의 범위나 조건을 지정..

1. not null
	사원 테이블에 사원의 정보를 저장할 때, 반드시 사원번호와 사원이름이 저장되어야 입력되도록
	처리하고자 할때..
	create table 테이블명(컬럼명 컬럼type not null, ..., ...);

*/
create table emp02(
	empno number(4) not null,
	ename VARCHAR2(10) not null,
	job varchar2(9),
	deptno number(4)
);
-- 제약조건에 합당해야지 데이터가 입력이 가능하게 처리 됨..
insert into emp02 values(1000,'홍길동','대리',30);
select * from emp02;
/*
unique 제약조건 : 데이터 입력에 있어서, 동일한 데이터 입력을 허용하지 않는 것을 말한다.
emp03 테이블에  empno에 unique제약조건으로 동일한 사번을 입력하지 못하게 처리하세요..
*/
create table emp03(
	empno number(4) unique,
	ename varchar(25),
	mgr number(4)
);
insert into emp03 values(1000,'himan',null);
insert into emp03 values(1001,'himan2',7788);
insert into emp03 values(1002,null,null);
insert into emp03 values(1003,'himan3',8888);
select * from emp03;
/*
primary key : not null(반드시 데이터 입력해야), unique(반드시 유일한 데이터)
	의 내용을 둘다 처리할 때, 쓰인다. 주로 메인테이블의 key값을 설정할 때 활용된다.
	ex) memeber테이블에 memberid값을  primary key로 설정하세요..
*/
create table memeber(
	memberid varchar(20) primary key,
	pass varchar(20),
	name varchar(50),
	loc varchar(100)
);
insert into memeber values('1111','7777','홍길동','서울강남');
insert into memeber values('1112','7777','홍길동','서울강남');
insert into memeber values(null,'7777','홍길동','서울강남');
/*
foreign key : 참조되는 테이블이 반드시 값을 입력해야 하는 경우를 말한다.

*/
select * from emp;
select * from dept;
drop table DEPT_REF;
CREATE TABLE DEPT_REF
(
   DEPTNO   NUMBER (2) primary key,
   DNAME    VARCHAR2 (14),
   LOC      VARCHAR2 (13)
);

CREATE TABLE EMP_REF
(
   EMPNO      NUMBER (4) primary key,
   ENAME      VARCHAR2 (10),
   JOB        VARCHAR2 (9),
   MGR        NUMBER (4),
   HIREDATE   DATE,
   SAL        NUMBER (7, 2),
   COMM       NUMBER (7, 2),
   DEPTNO     NUMBER (2) REFERENCES DEPT_REF(DEPTNO)
);
--  컬럼 컬럼TYPE references 참조할테이블명(참조할컬럼명)
insert into DEPT_REF values(20, '총무','경기');
select * from DEPT_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1000,'홍길동',10); 
select * from EMP_REF;
insert into EMP_REF(EMPNO, ENAME, DEPTNO) values(1002,'마길동',20); 
/* 숙제
참조키 관계에 있는 테이블 구성하기 
메인테이블  student_main(id, pass, name) :아이디, 패스워드, 이름
서브테이블  student_point(id, subject, point); 아이디, 과목, 점수
  student_main 과 student_point  id로  foreign key 관계를 설정하고,
  student_main에 데이터가 있어야만 student_point를 입력할 수 있게끔 처리
*/
/*
check 제약 조건
입력된는 값을 체크하여 설정된 값 이외의 값이 들어오지 못하게 조건을 설정하는 것을 말한다.
ex) 사원테이블에 gender라는 컬럼을 두고, 여기에 'M', 'F' 두개의 값 외에는 입력 되지 
못하게 처리하자.
*/
create table emp04(
 empno number(4),
 ename varchar2(10),
 gender varchar2(1) check(gender in('M','F'))
);
insert into emp04 values(9998,'신길동','D');
select * from emp04;

/*
데이터 사전(데이터 dictionary)
관리자에서 데이터베이스와 관련된 정보를 제공하는 것을 말한다.

DBA_XXX : 관리자만 접근가능한 객체(테이블 등)의 정보 조회.
ALL_XXX : 자신 계정 소유 또는 권한을 부여 받은 객체(테이블)의 정보조회
USER_XXX : 자신의 계정이 소유한 객체 등에 관련 정보 조회.
*/
select * from user_tables
where table_name like '%EMP%'; -- 사용자 테이블 관련 정보..
/*
제약조건 확인하기..
user_constraints에서 각 테이블의 무결성 제약조건에 관련된 내용을 데이터
딕셔너리를 통해서 확인할 수 잇다.
## contraint_type
P : primary_key
R : foreign_key
U : unique
C : check, not null

** 데이터 사전을 통해서 생성된 테이블의 목록, 테이블의 구조, 제약조건을 
확인할 수 있다..
*/
select * from user_constraints
where table_name like '%DEPT%';
