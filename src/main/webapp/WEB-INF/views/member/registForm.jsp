<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* List<Product> productList=(List)request.getAttribute("productList"); */
%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Shop</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<%@ include file="../include/head.jsp" %>
<!--[if IE 6]><link href="/css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
<!--[if IE 7]><link href="/css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
<style>
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
  background-color: #fcb76a;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=button]:hover {
  background-color: #fc973a;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
}
th, td {
  text-align: left;
  padding: 16px;
}
tr:nth-child(even) {
  background-color: #f2f2f2;
}
#buyer{
	background-color: #fcf7ea;
	padding: 40px;
	display:inline-block;
	margin-top:20px;
	margin-bottom:50px;
}
</style>
<script>
function regist(){
	form1.method="post";
	form1.action="/member/regist";
	form1.submit();
}
function login(){
	location.href="/member/loginForm";
}
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

  <div class="container">
  	<div id="buyer">
  		<h3>회원가입</h3>
  		<form name="form1">
		    <input type="text" name="id" placeholder="아이디 입력">
		    <input type="password" name="password" placeholder="비밀번호 입력">
		    <input type="text" name="name" placeholder="이름 입력">
		    <input type="text" name="phone" placeholder="연락처 : - 빼고 입력해주세요">
		    <input type="text" name="email" placeholder="이메일">
	    </form>
	    <input type="button" value="회원등록" onClick="regist()"/>
	    <input type="button" value="로그인" onClick="login()"/>
    </div>
    
  </div>

  <%@ include file="../include/footer.jsp" %>

</body>
</html>