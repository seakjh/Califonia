<%@page import="com.hotel.app.domain.TopCategory"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	$($("button")[0]).click(function(){//등록
		regist();
	});
});

function regist() {
	location.href="/admin/room/registRoom";
}

//목록 가져와서 테이블에 출력!
function getList() {
    $.ajax({
        url:"/admin/room/getList",
        type:"get",
        success:function(result) {
            //alert(result.length);            
            printData(result);
        }
    });
}
function printData(jsonArray){
	class RoomTable extends React.Component{
		render(){
			var row=[];
			
			for(var i=0;i<jsonArray.length;i++){
				var sub=jsonArray[i];
				row.push(
					<tr onClick={getDetail(sub.room.room_id)}>						
						<td>{sub.room.room_id}</td>
						<td>{sub.topCategory.name}</td>
						<td>{sub.room.name}</td>
						<td>{sub.room.max_number}</td>
						<td>{sub.room.room_size}평</td>
						<td><img src={"/resources/data/"+sub.room.filename} alt="방의 이미지" width="100px" /></td>
					</tr>
				)
			}
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>카테고리</td>
						<td>이름</td>
						<td>최대 인원수</td>
						<td>방 크기</td>
						<td>이미지</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <RoomTable/>, $("#tableArea")[0]);
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
			<button>방 등록</button>
		</div>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>