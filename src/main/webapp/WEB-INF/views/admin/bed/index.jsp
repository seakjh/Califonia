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
		url:"/bed/regist",
		type:"post",
		data:{
			name:$($("input[name='name']")[0]).val(),
		},
		success: function (result) {
			alert(result);
			getList();
			$($("input[name='name']")[0]).val("");
		}
	});
}

//목록 가져와서 테이블에 출력!
function getList() {
    $.ajax({
        url:"/bed/list",
        type:"get",
        success:function(result) {
            //alert(result.length);            
            printData(result);
        }
    });
}
function printData(jsonArray){
	class BedTable extends React.Component{
		render(){
			var row=[];
			
			for(var i=0;i<this.props.records.length;i++){
				var bed =this.props.records[i];
				
				row.push(
					<tr>						
						<td>{bed.bed_option_id}</td>
						<td onClick={getDetail(bed.bed_option_id)}>{bed.name}</td>
					</tr>
				)
			}
				
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>이름</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <BedTable records={jsonArray}/>, $("#tableArea")[0]);
}
const getDetail=(bed_option_id)=>()=> {
	$.ajax({
		url:"/bed/detail",
		type:"get",
		data:{
			bed_option_id:bed_option_id
		},
		success:function(result) {
			//alert("결과는 	"+result.name);
			$("input[name='bed_option_id']").val(bed_option_id);
			$($("input[name='name']")[1]).val(result.name);
		}
	});
}

function del() {
	
}
</script>

</head>
<body>

<%@include file="../inc/header.jsp"%>
<div class="container marginAll">
	<div class="row">
		<div class="col-lg-3" id="registArea">
			<form>
				<input type="text" name="name" placeholder="방의 옵션 입력"/>
				<br>
			</form>
			<button>등록</button>
			<button>목록</button>
		</div>
		<div class="col-lg-6" id="contentArea">
			<div id="tableArea"></div>
		</div>
		<div class="col-lg-3" id="infoArea">
			<input type="hidden" name="serviceOption_id">
			<input type="text" name="name"/>
			<br>
			<button>수정</button>
			<button>삭제</button>
		</div>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>




