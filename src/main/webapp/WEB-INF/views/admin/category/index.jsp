<%@page import="com.hotel.app.domain.TopCategory"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/assets/css/admin.css"/>
<%@include file="../inc/head.jsp"%>
<style>
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
	background: #ffffee;
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

	$($("button")[2]).click(function(){//수정
		edit();
	});
	
	$($("button")[3]).click(function(){//삭제
		del();
	});
	
});

function regist() {
	$.ajax({
		url:"/category/regist",
		type:"post",
		data:{
			name:$($("input[name='name']")[0]).val(),
			price:$($("input[name='price']")[0]).val(),
			detail:$($("textarea[name='detail']")[0]).val()
		},
		success: function (result) {
			$($("input[name='name']")[0]).val();
			$($("input[name='price']")[0]).val();
			$($("textarea[name='detail']")[0]).val();
			getList();
		}
	});
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
			
			for(var i=0;i<this.props.records.length;i++){
				var category=this.props.records[i];
				
				row.push(
					<tr>						
						<td>{category.topcategory_id}</td>
						<td onClick={getDetail(category.topcategory_id)}>{category.name}</td>
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
	ReactDOM.render( <CategoryTable records={jsonArray}/>, $("#tableArea")[0]);
}
const getDetail=(topcategory_id)=>()=> {
	$.ajax({
		url:"/category/detail",
		type:"get",
		data:{
			topcategory_id:topcategory_id
		},
		success:function(result) {
			//alert("결과는 	"+result.name);
			$("input[name='topcategory_id']").val(topcategory_id);
			$($("input[name='name']")[1]).val(result.name);
			$($("input[name='price']")[1]).val(result.price);
			$($("textarea[name='detail']")[1]).val(result.detail);
		}
	});
}

function edit() {
	$.ajax({
		url:"/category/edit",
		type:"post",
		data:{
			topcategory_id:$("input[name='topcategory_id']").val(),
			name:$($("input[name='name']")[1]).val(),
			price:$($("input[name='price']")[1]).val(),
			detail:$($("textarea[name='detail']")[1]).val()
		},
		success:function(result) {
			alert("수정되었습니다");
			getList();
		}
	});
}

function del() {
	$.ajax({
		url:"/category/del",
		type:"get",
		data:{
			topcategory_id:$("input[name='topcategory_id']").val()
		},
		success:function(result) {
			alert("삭제되었습니다");
			$("input[name='topcategory_id']").val("");
			$($("input[name='name']")[1]).val("");
			$($("input[name='price']")[1]).val("");
			$($("textarea[name='detail']")[1]).val("");
			getList();
		}
	});
}
</script>
</head>
<body>

<%@include file="../inc/header.jsp"%>
<div class="container marginAll">
	<div class="row">
		<div class="col-lg-3" id="registArea">
			<form>
				<input type="text" name="name" placeholder="카테고리 입력"/>
				<br>
				<input type="text" name="price" placeholder="가격 입력"/>
				<br>
				<textarea rows="3" cols="25" name="detail" placeholder="설명 입력"></textarea>
				<br>
			</form>
			<button>등록</button>
			<button>목록</button>
		</div>
		<div class="col-lg-6" id="contentArea">
			<div id="tableArea"></div>
		</div>
		<div class="col-lg-3" id="infoArea">
			<input type="hidden" name="topcategory_id">
			<input type="text" name="name"/>
			<br>
			<input type="text" name="price"/>
			<br>
			<textarea rows="3" cols="25" name="detail"></textarea>
			<br>
			<button>수정</button>
			<button>삭제</button>
		</div>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>




