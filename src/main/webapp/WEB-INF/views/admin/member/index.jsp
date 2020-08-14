<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록</title>
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
        url:"/member/list",
        type:"get",
        success:function(result) {
            //alert(result.length);            
            printData(result);
        }
    });
}
function printData(jsonArray){
	class MemberTable extends React.Component{
		render(){
			var row=[];
			
			for(var i=0;i<jsonArray.length;i++){
				var member=jsonArray[i];
				row.push(
					<tr>						
						<td>{member.member_id}</td>
						<td>{member.id}</td>
						<td><a href={"/admin/member/detail?member_id="+member.member_id}>{member.name}</a></td>
						<td>{member.phone}</td>
						<td>{member.email}</td>
						<td>{member.regdate}</td>
					</tr>
				)
			}
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>연락처</td>
						<td>이메일</td>
						<td>가입일</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <MemberTable/>, $("#tableArea")[0]);
}
const getDetail=(member_id)=>()=> {
/*	//alert(member_id);
	$("form").attr({
		"action":"/admin/member/detail?member_id="+member_id,
		"enctype":"multipart/form-data",
		"method":"get"
	});
	$("form").submit();*/
}
</script>
</head>
<body>

<%@include file="../inc/header.jsp"%>
<div class="container marginAll">
	<form>
		<div class="row">
			<div class="col-lg-12" id="contentArea">
				<div id="tableArea"></div>
			</div>
		</div>
	</form>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>