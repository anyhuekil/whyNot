$(document).ready(function(){
	
});

var whyDateVal;
var whyYear;
var whyMonth;
var whyDate;
var whyDay;

if(!String.prototype.whyLpad){
	String.prototype.whyLpad = function whyLpad(n, str) { 
		alert("엘패드작동");
		return Array(n - String(this).length + 1).join(str || '0') + this;
	}
}
(function(){
	var nowDate = new Date();
	alert("작동");
	whyYear = nowDate.getFullYear()
	whyYear = whyYear.whyLpad(4,"0");
	whyMonth = nowDate.getMonth().whyLpad(2,"0");
	whyDay = nowDate.getDay().whyLpad(2,"0");
	whyDateVal = whyYear.whyPad("0",4)+"-"+whyMonth.whyPad("0",2)+"-"+whyDate.whyPpad("0",2);
	alert(whyDateVal);
	document.getElementById("whyDateshow").innerHTML = whyDateVal;
}());

//function whySetCalendar(){

//}

startCalendar = function(){

}








// whyDateVal = document.getElementById('whyDateSelect').value;



// 4월, 시작:토요일, 윤달아님.

// 날짜 입력 : whyDateSelect (type=date)

/*
function whySetCalendar(){
	whyDateVal = document.getElementById('whyDateSelect').value;
	whyYear = whyDateVal.getFullYear();
	whyMonth = whyDateVal.getFullYear();
	whyDay = whyDateVal.getDay();
}

*/
/*
this.whyLpad = function whyLpad(num,filler){
	alert(this);
	var x = this;
//	var filler = 0;
	if (!this||!filler||this.length >= num) {
		alert(this);
		return this;		
	}else if(this.length < num){
		var idx;
		for(idx=0;idx<this.length-num;idx++){
			alert(this);
			x = x + filler;
		}
	}else{
		alert("whyLpad함수 오류");
	}
	alert("whyLpad함수 끝");
}
*/
/*function whyPad(filler,size){}
whyMonth = new Date().getMonth();
whyDate = new Date().getDate();
whyDay = new Date().getDay();
whyDateVal = whyYear.whyPad("0",4)+"-"+whyMonth.whyPad("0",2)+"-"+whyDate.whyPpad("0",2);
alert(whyDateVal);
document.getElementById("whyDateshow").innerHTML = whyDateVal;
document.getElementById('whyDateSelect').value = whyDateVal;
}
*/


//lpad




