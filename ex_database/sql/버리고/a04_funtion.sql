





select substr('Welcome2 to Oracle world!!', 4,5) from dual;











select 625.21111, round(625.2000,2) from dual;
/*
4. frunc함수 : 특정 자리수 이하로 절삭처리..
	frunc(데이터, 자리수처리)
*/
select trunc(24.2433, 2), trunc(24.243, -1) from dual;
select * from emp;

select mod(27,2), mod(27,3), mod(27,4) from dual;

