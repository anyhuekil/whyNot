$(document).ready(function(){
	
});

<<<<<<< HEAD:schedule/js/schedule_exe.js
// 변수 설정 .. 전체 날짜, 년,월,일,요일
var whyDateVal; 
var whyYear; //숫자형태
var whyMonth = []; //[숫자형(1~12)] 
var whyDate = []; //[숫자형,] 
var whyDay = []; //[숫자형(0~6),x요일] 

// Lpad함수 생성
if(!String.prototype.whyLpad){
	String.prototype.whyLpad = function whyLpad(n, str) { 
		return Array(n - String(this).length + 1).join(str || '0') + this;
	}
}

// 시작시 날짜 전송위한 함수
(function(){
	setDate();
}());
=======
// 4��, ����:�����, ���޾ƴ�.

// ��¥ �Է� : whyDateSelect (type=date)
>>>>>>> 0bdfa0adcd82c15966feef89383c2ff8c64cd3bf:made/schedule/js/schedule_exe.js

//시작 or 받는 날짜에 따라 데이터 셋팅
function setDate(val){
	console.log(val);
	this.inputDate = (val == null) ? new Date() : new Date(val) ;
	whyYear = inputDate.getFullYear();
	var yearVal = (whyYear+"").whyLpad(4,"0");
	whyMonth[0] = (inputDate.getMonth()+1);
	console.log(whyMonth[0]);
	var monthVal = (whyMonth[0]+"").whyLpad(2,"0");
	whyDate[0] = inputDate.getDate();
	var dateVal = (whyDate[0]+"").whyLpad(2,"0");
	whyDateVal = yearVal+"-"+monthVal+"-"+dateVal;
	console.log(whyDateVal);
	$('#whyDateSelect').val(whyDateVal);
	whyDay[0] = inputDate.getDay();  //요일을 Num형태 숫자로 받음
	whyDay[1] = (function(){				   
		switch (whyDay[0]) {
		    case 0:
		        whyDay[0] = "Sunday";
		        break;
		    case 1:
		    	whyDay[0] = "Monday";
		        break;
		    case 2:
		    	whyDay[0] = "Tuesday";
		        break;
		    case 3:
		    	whyDay[0] = "Wednesday";
		        break;
		    case 4:
		    	whyDay[0] = "Thursday";
		        break;
		    case 5:
		    	whyDay[0] = "Friday";
		        break;
		    case 6:
		    	whyDay[0] = "Saturday";
		}return whyDay[0];
	}());
	$('#whyDateshow').html(whyDateVal+" ["+whyDay[1]+"]");
}
// 클릭 버튼을 누를때, input date에서 입력한 내용을 위로 부른다. // 나중에 이것 기반으로 스케줄러 달력 소환할예정.
$('#whySetCalendar').click (function(){
	setDate($('#whyDateSelect').val());
});

//달력에 각각 날짜를 배열로 선언함.

여기서부터 하면된다!!

var calendarDayArray = [];
$('.calendarDay').each(function (idx,item){
	calendarDayArray[idx] = $(item).text();
});

console.log(calendarDayArray.length);
console.log(calendarDayArray[1]);

// whyDay[0] = 0 이면, calendarDayArray[0]부터 채운다.
// whyDay[0] = 1 이면, calendarDayArray[1]부터 채운다.
//
//
//
// whyDay[0] = 6 이면, calendarDayArray[6]부터 채운다.

// whyDay[0] + 








