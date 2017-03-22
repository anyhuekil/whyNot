/*
	Question

00. 각 부분 명칭 ex)컬럼 테이블 등..
01. 같다 = 에서 (*)이 의미 하는것은?
02. 컬럼명은 대소문자 구분X, 데이터는 대소문자 구분. 그럼 연산자??등은?
03. sql은 대문자로 작성하는것이 좋은가??(경험적 지식에 대한 질문)
04. select * from EMP where EMP.HIREDATE between '81/12/01' and '81/12/31';
	위 명령이 먹는 이유는?? 날짜는 전에 81/12/01 이런식으로 되어있지 않았나? Q10참고.
05. LIKE연산자만 단독으로 쓸수 있는가?
06. DUAL은 한줄로만 출력되나?
07. INITCAP을 사용할때, 데이터안에 띄어쓰기를 포함하면 어떻게 되는가?
	ex) 'hello? my name is whyNOT' 자체가 데이터 한 칸일때.
08. '오라클 WhyNot'의 문자열 갯수는?
09. 아래에서 'a오A라B'출력?==> ,1,9?? // 'A라B'를 출력?==> ,4,6??
	SELECT SUBSTRB('a오A라BC클 WhyNot?!',1,1) "SUBSTRB" FROM DUAL;
10. substr(hiredate,1,length(hiredate)) 을 이용하면 컬럼자체를 불러낼수있다?!
11. SUBSTR(ENAME, -2, 3) 시작할 위치를 음수로 쓰면 뒤에서부터라는 뜻이된다!
12. TRIM은 왜 한글자만 되는가?
13. NEXT_DAY는 요일말고는 안되는가?
14. HIREDATE는 어떤 형태의 데이터인가?? 
15. LENGTH(to_char(8080,'99000000')) 몇인가??
17. demo와 emp의 차이는??
18. TO_NUMBER의 룰에대해..
		ex) 숫자형에는 ,를 붙이지 않아도 알아서 붙음.
			문자형에 ,가 없을땐, 숫자형에 ,표시하면 출력 안됨. 등등
		공부 더해봐야됨!!
19. TO_NUMBER로 했을때 왜 소수점 2번째 자리까지만 되는가?
	
	
	
*/






/* 0320
01.	왜 중간에 null값은 못넣는가?
	insert into dept01 values(99,,'여수');
02. 데이터 복사할때, 복사한 데이터는 어디에 보관되는가?? (집과 학원에서 연동가능한정도..)


*/
/* 그전 Q

4. ex) rs.getString("별칭/컬럼명") 이것이 가진 의미:var1:var2
7. distinct는 동일 데이터 처리 기능이다!!
19. emp.hiredate 뭔말임:var1:var2:var3
23. hiredate는 어떻게 구성되어있나:var1
select * from emp where job not like '%ER' and hiredate between 1981/01/01~ 1981/12/31 like '%81%';
뭐가 문제:var1
24. 정렬처리를 하지 않을때, 또는 데이터를 입력해 놓은 순서대로 출력하는 방법:var1:var2
ex)배열을 줘서 데이터에 다시 번호를 주는 방식:var1:var2(가능한가:var3)
26. 소문자 대문자를 서로 바꾸는 함수:var1 ex) Hello -> hELLO
28. instr을 사용할때 알파벳단위만 가능:var1:var2 단어 단위로는 어떻게 :var3:var4:var5
4. trim의 정확한 정의:var1 왜 1단어는 되는데 2자이상안되는가:var2:var3
*/


/* 0322
01. 서버쿼리? 서브쿼리? 다른거?
02. IS NOT NULL 은 데이터가 없는거라 평균작업에 포함안됨?
	EX) 전체 10명 NULL값 4명잇을때, 10명으로 평균? OR 6명으로 평균, 아님 오류남??

*/



	


	 
	
	
	
	
	