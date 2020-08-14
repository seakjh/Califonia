<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/head.jsp" %>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
* {
	box-sizing: border-box;
}
/* style the container */
#container {
	position: relative;
	border-radius: 5px;
	background-color: #fcf7ea;
	padding: 20px 0 30px 0;
}
/* style inputs and link buttons */
input, .btn {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 4px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 20px;
	text-decoration: none; /* remove underline from anchors */
}
input:hover, .btn:hover {
	opacity: 1;
}
/* style the submit button */
input[type=button] {
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}
input[type=button]:hover {
	background-color: #45a049;
}

</style>
<script>
$(function() {
	$("#bt_login").on("click", function() {
		$.ajax({
			"url":"/member/login",
			"type":"post",
			"data":{
				"id":$("input[name='id']").val(),
				"password":$("input[name='password']").val()
			},
			success:function(result) {
				console.log(result.code);
				//성공한경우
				if(result.code == undefined) {
					alert(result.name+"님 안녕하세요!");
					location.href="/"; //메인을 요청					
				}
				else {
					alert("로그인 실패");
				}
			}
		});
	});
});
</script>
</head>
<body>
	
	<%@ include file="../include/header.jsp"%>
	
	<div id="body">
		<div id="container" class="container">
			<form>
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-6">
						<input type="text" name="id" placeholder="UserID" required>
						<input type="password" name="password" placeholder="Password" required>
						<input type="button" value="Login" id="bt_login">
					</div>
					<div class="col-lg-3"></div>
				</div>
			</form>
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
					<a href="/member/registForm" style="color: white" class="btn">Sign up</a>
				</div>
<!-- 				<div class="col">
					<a href="#" style="color: white" class="btn">Forgot password?</a>
				</div> -->
				<div class="col-lg-3"></div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>