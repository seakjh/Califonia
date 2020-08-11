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
	
	$($("button")[1]).click(function(){//목록
		getList();
	});
});

function regist() {
	location.href="/room/registRoom";
}

//목록 가져와서 테이블에 출력!
function getList() {
    $.ajax({
        url:"/category/list",
        type:"get",
        success:function(result) {
            //alert(result.length);            
            printData(result);
        }
    });
}
function printData(jsonArray){
	class CategoryTable extends React.Component{
		render(){
			var row=[];
			
			for(var i=0;i<jsonArray.length;i++){
				var category=jsonArray[i];
				row.push(
					<tr onClick={getDetail(category.topCategory_id)}>						
						<td>{category.topCategory_id}</td>
						<td>{category.name}</td>
						<td>{category.price}</td>
						<td>{category.detail}</td>
					</tr>
				)
			}
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>이름</td>
						<td>가격</td>
						<td>설명</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <CategoryTable/>, $("#tableArea")[0]);
}
function getDetail(topCategory_id) {
	$.ajax({
		url:"/category/detail",
		type:"post",
		data:{
			topCategory_id:topCategory_id
		},
		success:function(result) {
			$("input[name='topCategory_id']").val(result[0].topCategory_id);
			$($("input[name='name']")[1]).val(result[0].name);
			$($("input[name='price']")[1]).val(result[0].price);
			$($("textarea[name='detail']")[1]).val(result[0].detail);
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