<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 주문 결제 목록</title>
<link rel="stylesheet" href="/resources/assets/css/admin.css"/>
<%@include file="../inc/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
select{
	width:200px;
	height:150px;
	display: block !important;
}
button {
	background: #dca73a;
	border: 1px solid #fff;
	color: #fff;
	border-radius: 5px;
	font-weight: 400;
	cursor: pointer;
}
button:hover {
	background: #f1b233;
}
.marginAll{
	margin-top: 60px;
	margin-bottom: 60px;
}

.listArea{

}
</style>
<script type="text/babel">
$(function(){
	getList();
	
});

//목록 가져와서 테이블에 출력!
function getList() {
    $.ajax({
        url:"/admin/reserve/list",
        type:"get",
        success:function(result) {
            //alert(result.length);            
            printData(result);
        }
    });
}
function printData(jsonArray){
	class ReserveTable extends React.Component{
		render(){
			var row=[];
			
			for(var i=0;i<jsonArray.length;i++){
				var reservation=jsonArray[i];
				row.push(
					<tr onClick={getDetail(reservation.reservation_id)}>						
						<td>{reservation.reservation_id}</td>
						<td>{reservation.member.name}</td>
						<td>{reservation.room.name}</td>
						<td>{reservation.total_pay}원</td>
						<td>{reservation.reserve_date}</td>
						<td>{reservation.check_in}</td>
						<td>{reservation.check_out}</td>
					</tr>
				)
			}
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>예약자</td>
						<td>예약룸</td>
						<td>총 결제액</td>
						<td>예약일</td>
						<td>체크인</td>
						<td>체크아웃</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <ReserveTable/>, $("#tableArea")[0]);
}
function getDetail(room_id) {
	$.ajax({
		url:"/category/detail",
		type:"post",
		data:{
			room_id:room_id
		},
		success:function(result) {
		}
	});
}
</script>
</head>
<body>

<%@include file="../inc/header.jsp"%>
<div class="container marginAll">
	<div class="row">
		<div class="col-lg-12" id="contentArea">
			<div id="tableArea"></div>
			<br>
			<!-- <button>결제 취소</button> -->
		</div>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>