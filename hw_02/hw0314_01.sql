/*		03월14일 과제		*/

/* 과제 1 */
select*from emp;

--1. ename은 현재 연봉이 @@@만원 인데, 최근에 5%인상된 금액이며, 작년 연봉은 @@만원이었습니다.
select ename||'은 현재 연봉이 '||(sal+(sal*0.05))||'만원인데,
 최근에 5%인상된 금액이며, 작년 연봉은 '||sal||'만원이었습니다.' "연봉 공지" from emp;

--2. ename의 입사일은 hiredate 입니다.
select ename||'의 입사일은 '||hiredate||' 입니다.' "입사일" from emp;

--3. 직책인 @@@인 @@@는 부서번호가 @@@입니다.
select '직책이 '||job||'인 '||ename||'는 부서번호가 '||empno||'입니다.' "Job Nunber" from emp;

--4. @@@님은 현재 연봉(?)과 보너스(comm)의 합산액은 @@@입니다.
select ename||'님은 현재 연봉('||sal||')과 보너스('||comm||')의 합산액은 '||(sal+comm)||'입니다.' "연봉총액" from emp;


 
/* 연습예제 */
select*from emp;

-- 1. EMP중에 급여가 2000미만이 되는 사원 정보 중에 사번과 급여를 출력하라.
select empno "사번", sal"급여(연봉)" from emp where sal < 2000;

-- 2. 연봉과 보너스의 합산 금액이 1500미만인 사람의 이름, 연봉, 보너스, 합산액을 출력하세요.
select ename "이름", sal"연봉", nvl(comm,0)"보너스", (sal+nvl(comm,0))"합산액" from emp where (sal+nvl(comm,0))<1500; 

-- 3. MGR이 NULL인 사람 JOB, 이름, 연봉을 출력하세요.
select job JOB, ename "이름", sal "연봉" from emp where mgr is null;

-- 4. JOB이 CLERK인 사람중 DEPTNO가 30인 사람의 이름, 직책, 
select ename "이름", job "직책" from emp where job='CLERK' and deptno = 30;

-- 5. 연봉이 2000에서 3000 사이에 있는 사람의 부서번호, 이름, 연봉을 출력하세요.
select deptno "부서번호", ename "이름", sal "연봉" from emp where sal > 2000 and sal <3000;
