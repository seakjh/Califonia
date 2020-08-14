<%@page import="com.hotel.app.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@include file="../inc/head.jsp"%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

*{
	box-sizing: border-box;
}

input[type=text], input[type=password], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script>
$(function(){	
	
	//탈퇴처리
	$($("button")[0]).click(function(){
		del();
	});
	
	//목록
	$($("button")[1]).click(function(){
		location.href="/admin/member";
	});
	
});

//회원탈퇴
function del(){
	if(confirm("이 회원을 탈퇴시키겠습니까?")){
		$("form").attr({
			"action":"/member/delete",
			"method":"get"
		});
		$("form").submit();
	}
}
</script>
</head>
<body>
<%@include file="../inc/header.jsp"%>

	<div class="container">
		<form name="form1">
			<input type="hidden" 	name="member_id" value="<%=member.getMember_id()%>"> 
			<input type="text" 	name="id" value="<%=member.getId()%>" readonly> 
			<input type="password" 	name="password" value="<%=member.getPassword()%>" readonly>
			<input type="text" 	name="name" value="<%=member.getName()%>" readonly> 
			<input type="text" 	name="phone" value="<%=member.getPhone()%>" readonly> 
			<input type="text" name="email" value="<%=member.getEmail()%>" readonly> 
			<input type="text" name="regdate" value="<%=member.getRegdate()%>" readonly> 
		</form>
		<br>
		<button class="btn btn-warning">회원 탈퇴 처리</button>
		<button class="btn btn-warning">목록</button>
		<p> </p>
	</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>