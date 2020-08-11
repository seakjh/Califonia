<%@ page contentType="text/html; charset=UTF-8"%>
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

input[type=text], select, textarea {
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
	
	getCategoryList();//카테고리 목록 가져오기
	
	//등록
	$($("button")[0]).click(function(){
		regist();
	});
	
	//목록
	$($("button")[1]).click(function(){
		location.href="/admin/room";
	});
	
});

function getCategoryList(){
	$.ajax({
		"url":"/category/list",
		"type":"get",
		success:function(result){
			$("#topCategory_id").empty(); 
			$("#topCategory_id").append("<option value='0'>카테고리 선택</option>");
			for(var i=0;i<result.length;i++){
				var obj=result[i];
				$("#topCategory_id").append("<option value='"+obj.topCategory_id+"'>"+obj.name+"</option>");
			}
		}
	});	
}

//파일 업로드 요청 (동기방식)
function regist(){
	$("form").attr({
		"action":"/admin/room/regist",
		"enctype":"multipart/form-data",
		"method":"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
<%@include file="../inc/header.jsp"%>

	<div class="container">
		<form name="form1">
			<select id="topCategory_id" class="form-control" style="display: block;">
				<option value="0">카테고리 선택</option>
			</select>
			<input type="text" 	name="name" placeholder="방이름"> 
			<input type="text" name="max_number" placeholder="최대 인원수"> 
			<input type="text" name="room_size" placeholder="방 크기"> 
			<input type="file" name="myFile">
		</form>
		<br>
		<button class="btn btn-warning">등록</button>
		<button class="btn btn-warning">목록</button>
		<p> </p>
	</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>