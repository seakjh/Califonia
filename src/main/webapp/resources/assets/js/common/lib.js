/*----------------------------------------------------------
 날짜처리시 한자리 수에는 0을 붙인다
 매개변수는 숫자를 받는다 
----------------------------------------------------------*/
function getDateStringWithNum(num){
	var str="";
	if(num<10){ //1자리수 임
		str="0"+num; 
	}else{
		str=num;
	}
	return str;
}

/*----------------------------------------------------------
 날짜처리시 한자리 수에는 0을 붙인다
 매개변수는 날짜형식의 문자열로 받는다  
 2020-08-15
 2020/08/15
 08/15/2020 
----------------------------------------------------------*/
function getDateStringWithDate(dateString){
	var d = new Date(dateString);
	var yy=d.getFullYear();
	var mm=getDateStringWithNum(d.getMonth()+1);
	var dd=getDateStringWithNum(d.getDate());

	return yy+"-"+mm+"-"+dd;
}

function getDiffDate(a , b){
	const date1 = new Date(a);
	const date2 = new Date(b);
	const diffTime = Math.abs(date2 - date1);
	//const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
	return diffTime;
}








