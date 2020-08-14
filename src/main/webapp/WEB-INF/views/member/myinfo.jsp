<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/head.jsp" %>
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
<script>
$(function(){	
	
	//탈퇴처리
	$($("button")[0]).click(function(){
		del();
	});

});

//회원탈퇴
function del(){
	if(confirm("정말로 탈퇴 하시겠습니까?")){
		$("form").attr({
			"action":"/member/secession",
			"method":"get"
		});
		$("form").submit();
	}
}
</script>
</head>
<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>Hotel</b>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

	<%@include file="../include/header.jsp" %>

    <main>
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
			<button type="button" class="btn btn-warning">탈퇴하기</button>
			<p> </p>
		</div>

    </main>

	<%@include file="../include/footer.jsp" %>

    </body>
</html>