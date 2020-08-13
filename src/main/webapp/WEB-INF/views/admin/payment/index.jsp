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
		url:"/payment/regist",
		type:"post",
		data:{
			pay_method:$($("input[name='pay_method']")[0]).val()
		},
		success: function (result) {
			alert(result);
			getList();
		}
	});
}

//목록 가져와서 테이블에 출력!
function getList() {
    $.ajax({
        url:"/payment/list",
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
				var payment=this.props.records[i];
				
				row.push(
					<tr>						
						<td>{payment.payment_id}</td>
						<td onClick={getDetail(payment.payment_id)}>{payment.pay_method}</td>
					</tr>
				)
			}
				
			return (
				<table width="100%" border="1px">		
					<tr>
						<td>고유번호</td>
						<td>결제방법</td>
					</tr>
					{row}					
				</table>
			)	
		}
	}
	ReactDOM.render( <CategoryTable records={jsonArray}/>, $("#tableArea")[0]);
}
const getDetail=(payment_id)=>()=> {
	$.ajax({
		url:"/payment/detail",
		type:"get",
		data:{
			payment_id:payment_id
		},
		success:function(result) {
			$("input[name='payment_id']").val(payment_id);
			$($("input[name='pay_method']")[1]).val(result.pay_method);
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
				<input type="text" name="pay_method" placeholder="결제 방법 입력"/>
				<br>
			</form>
			<button>등록</button>
			<button>목록</button>
		</div>
		<div class="col-lg-6" id="contentArea">
			<div id="tableArea"></div>
		</div>
		<div class="col-lg-3" id="infoArea">
			<input type="hidden" name="payment_id">
			<input type="text" name="pay_method"/>
			<br>
			<button>수정</button>
			<button>삭제</button>
		</div>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
</body>
</html>




