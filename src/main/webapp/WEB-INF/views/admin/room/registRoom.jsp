<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace("detail");		

});
</script>
</head>
<body>

	<h3>Contact Form</h3>

	<div class="container">
		<form name="form1">
			<input type="hidden" 	name="room_id" value=""> 
			<select id="sub_category">
				<option></option>
			</select>
			<input type="text" 	name="name" placeholder="방이름"> 
			<input type="text" name="max_number" placeholder="최대 인원수"> 
			<input type="text" name="room_size" placeholder="방 크기"> 
			<input type="file" name="filename">
			<select id="bed_option"></select>
			<select id="category_option"></select>
			<input type="button" value="등록">
			<input type="button" value="목록">
		</form>
	</div>

</body>
</html>