
/*
0316
1. 시간내장함수 SYSDATE 뒤에 시간 간단히 자르는 방법?
2. 형변환을 하고 나면, 그 형변환 전의 형태는 기억하지 못하는가?
	EX) SYSDATE에서 YY,MM,DY데이터를 각각 가져오고 YY/MM/DY라고 표현한 후 다시 날짜데이터로 변환이 가능한가?
3. ADD_MONTHS를 사용할때, 1월 31일에 +1하면 어떻게 되나??
4. trim의 정확한 정의? 왜 1단어는 되는데 2자이상안되는가??
5. 



*/
SELECT HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE-20, 0))+20 ,ADD_MONTHS(LAST_DAY(HIREDATE-20), 0)+20 FROM EMP;
SELECT HIREDATE-2 FROM EMP;
