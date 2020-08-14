<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* style the container */
.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 5px;
  background-color: #fcf7ea;
  padding: 20px 0 30px 0;
} 

/* style inputs and link buttons */
input,
.btn {
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

input:hover,
.btn:hover {
  opacity: 1;
}

/* style the submit button */
input[type=button] {
  background-color: #fcb76a;
  color: white;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #fc973a;
}

/* Two-column layout */
.col {
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 100%;
    margin-top: 0;
  }
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	//로그인 버튼 누르면...
	$("input[type='button']").click(function(){
		$("form").attr({
			"action":"/admin/login",
			"method":"post"
		});
		$("form").submit();
	});
});

</script>
</head>
<body>
<div class="container">
	<form>
		<div class="row">
			<h2 style="text-align:center">관리자 로그인</h2>
			<div class="col">
				<input type="text" 		name="id" 			placeholder="UserID" required>
				<input type="password" name="password" 	placeholder="Password" required>
				<input type="button" value="Login">
			</div>
		</div>
	</form>
</div>
</body>
</html>
