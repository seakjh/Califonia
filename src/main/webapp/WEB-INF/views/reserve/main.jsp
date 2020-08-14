<%@page import="com.hotel.app.domain.Reservation"%>
<%@page import="com.hotel.app.domain.TopCategory"%>
<%@page import="com.hotel.app.domain.Room"%>
<%@page import="com.hotel.app.domain.SubCategory"%>
<%@page import="com.hotel.app.domain.Payment"%>
<%@page import="com.hotel.app.domain.ServiceOption"%>
<%@page import="com.hotel.app.domain.BedOption"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Reservation reservation = (Reservation)request.getAttribute("reservation");
	SubCategory subCategory = (SubCategory)request.getAttribute("subCategory");
	Room room = subCategory.getRoom();
	TopCategory topCategory = subCategory.getTopCategory();
	List<BedOption> bedList = (List)request.getAttribute("bedList");
	List<ServiceOption> serviceList = (List)request.getAttribute("serviceList");
	List<Payment> payList = (List)request.getAttribute("payList");
%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/head.jsp" %>
<style type="text/css">
.paint{
	background: #fcf7ea;
	margin-bottom: 50px;
	padding: 20px;
}
.paint li, .paint p, .paint th {
	color: #666;
	font-weight: normal;
}
table, th, td {
	border: 1px solid #333;
	border-collapse: collapse;
}
.pay p{
	font-size: 20pt;
	font-family: sans-serif;
	font-weight: bold;
	color: #333;
}
</style>
<script src="/resources/assets/js/common/lib.js"></script>
<script type="text/javascript">
var servicePrice=0;
var useDate = getDiffDate(<%=reservation.getCheck_in() %>, <%=reservation.getCheck_out() %>);//체류기간
var roomPrice = <%=topCategory.getPrice()%>; //방의 단가

$(function () {
	
	$($("button")[0]).click(function(){
		payment();
	});
	
	//최초의 계산 
	$("input[name='total_pay']").val(priceCalculation(roomPrice*useDate , 0));
	
});

//결제 요청 
function payment() {
 	var bed_option_id = $("input[name='bedOption.bed_option_id']");
 	
	var checkCount=0;
	
	//alert(bed_option_id.length);
	
	for (var i=0; i<bed_option_id.length; i++) {
		if (bed_option_id[i].checked == true) {
			checkCount++;
		}
	}
	
	if (checkCount<1) {
		alert("침대 옵션을 선택해 주세요");
		return;
	}
	
	if ($("#payment_id").val() == 0) {
		alert("결제 옵션을 선택해주세요");
		return;
	}
		
	$("form").attr({
		"action":"/reserve/payment",
		"enctype":"multipart/form-data",
		"method":"post"
	});
	$("form").submit();	
}

/*------------------------------------------------------
 계산 공식 
 지불할 금액 = 총 구매금액(a) +  서비스 옵션가격(b)
 ------------------------------------------------------*/
function priceCalculation(totalBuy, servicePrice) {
	return totalBuy +  servicePrice;
}

function serviceCalculation(obj) {
	$("input[name='serviceOption.service_option_id']"); //체크박스 배열


	if(obj.value==2){ //2이면 와인 50000
		if(obj.checked){
			servicePrice=servicePrice+parseInt($($("input[name='serviceOption.price']")[0]).val());	
		}else{
			servicePrice=servicePrice-parseInt($($("input[name='serviceOption.price']")[0]).val());
		}
		
	}else if(obj.value==1){//1이면 조식 10000
		if(obj.checked){
			servicePrice=servicePrice+parseInt($($("input[name='serviceOption.price']")[1]).val());	
		}else{
			servicePrice=servicePrice-parseInt($($("input[name='serviceOption.price']")[1]).val());
		} 
	}
	
	//alert("당신이 선택한 옵션 가격은 "+servicePrice);
	
	var totalPay=priceCalculation(roomPrice*useDate, servicePrice); //총 지불할 금액 
	$("input[name='total_pay']").val(totalPay);
	
	/*
	var serviceArray = $("input[name='serviceOption.service_option_id']");
	var priceArray = $("input[name='serviceOption.price']");
	var total_pay = $("input[name='total_pay']");
	var count = 0;
	
 	for (var i=0; i<serviceArray.length; i++) {
		if(serviceArray[i].checked == true) {			
			//alert(total_pay.val());
			//alert(priceArray[i].value);
			//alert(total_pay.val()+priceArray[i].value);
			total_pay.val() = total_pay.val()+priceArray[i].val();
			count++;
		}
		else {
			if (count > 0) {
				//total_pay.val() = total_pay.val()-priceArray[i].val();				
			}
		}
	}
 	*/
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
		<div class="container paint">
			<form>
				<input type="hidden" name="member.member_id" value="<%=member.getMember_id()%>"> 
				<input type="hidden" name="room.room_id" value="<%=room.getRoom_id()%>"> 
				<div class="row">
					<div class="col-lg-6">
						<h3>[<%=topCategory.getName() %>]예약 기간</h3>
						<div style="margin-bottom: 10px;">
							<span>체크 인 :</span><input type="text" style="width: 150px;" name="check_in" value="<%=reservation.getCheck_in() %>" readonly>
							<span>체크 아웃 :</span><input type="text" style="width: 150px;" name="check_out" value="<%=reservation.getCheck_out() %>" readonly>
						</div>
						<h3>침대 옵션 선택</h3>
							<%for (int i=0; i<bedList.size(); i++) {%>
							<%BedOption bedOption = bedList.get(i); %>
							<div class="radio">
								<label>
									<input type="radio" name="bedOption.bed_option_id" value="<%=bedOption.getBed_option_id() %>">
									<%=bedOption.getName() %>
								</label>
							</div>
							<%} %>
						
						<h3>서비스 옵션 선택</h3>
							<%for (int i=0; i<serviceList.size(); i++) {%>
							<%ServiceOption serviceOption = serviceList.get(i); %>
							<div class="checkbox">
								<label>
									<input type="checkbox"  name="serviceOption.service_option_id" value="<%=serviceOption.getService_option_id()%>" onclick="serviceCalculation(this)">
									<%=serviceOption.getName() %> &nbsp;
									<input type="text" style="width: 70px" name="serviceOption.price" value="<%=serviceOption.getPrice() %>" readonly>원
								</label>
							</div>
							<%} %>
						<table summary="In Room,In Hotel,Room Service로 구성된 테이블 입니다.">
							<colgroup>
								<col width="20%" class="col1">
								<col width="*" class="col2">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">객실이용</th>
									<td>
										<div>
											<ul>
												<li class="first">55인치 스마트 TV(위성 TV 48개 채널)</li>
												<li>50~100Mbps 초고속 유·무선(wifi) 인터넷 무료</li>
												<li>220V, 110V 전압 사용 가능</li>
												<li>커피·차 티백 무료 제공</li>
												<li>엑스트라 베드 1개 추가 36,300원/1박</li>
												<li class="last">베이비 크립(무료)</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">부대시설</th>
									<td>
										<div class="introList">
											<ul>
												<li class="first">피트니스 클럽 이용 안내<br> - 체육관(Gym) 무료
													이용(만 16세 이상 입장 가능)<br> - 실내 수영장 무료 이용(만 13세 이상 입장 가능)<br>
													&nbsp;&nbsp;&nbsp;(단, 주말 및 공휴일에는 성인 보호자의 보호 하에<br>
													&nbsp;&nbsp;&nbsp;만 13세 미만인 고객이 이용 가능하며,<br>
													&nbsp;&nbsp;&nbsp;신장 140cm 미만인 고객은 성인 보호자의 보호 하에<br>
													&nbsp;&nbsp;&nbsp;구명조끼 착용 시 이용 가능)<br> - 사우나 이용 시 유료(만
													13세 이상 입장 가능)<br>- 피트니스 클럽은 매월 세 번째 수요일 정기휴일입니다.
												</li>
												<li>투숙 기간 내 무료 주차 가능</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">룸서비스</th>
									<td>
										<div class="introList">
											<ul>
												<li class="first">객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.
												</li>
												<li>식사 및 음료 : 24시간 서비스</li>
												<li>중식, 일식 : 점심 12:00~14:00, 저녁 18:00~21:30</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-lg-6">
						<div class="conTitle2">
							<h6 class="tit">Hotel Info.</h6>
						</div>
						<div class="introLeft">
							<p class="tit">조식&nbsp;레스토랑 안내</p>
							<div class="useIntro">
								<p>
									- 더 파크뷰<br> &nbsp;&nbsp;06:00~10:00<br>
									&nbsp;&nbsp;(주중/주말/공휴일)
								</p>
							</div>
						</div>
						<div class="introRight">
							<p class="tit">체크인/체크아웃 시간</p>
							<div class="useIntro">
								<p>- 체크인 : 오후 3시 이후</p>
								<p>- 체크아웃 : 낮 12시</p>
							</div>
						</div>
						<div class="introBtm">
							<p class="tit">취소/변경 및 노쇼(No-show) 안내</p>
							<div class="useIntro">
								<p>숙박 예정일 1일 전 18시까지는 위약금 없음</p>
								<p>숙박 예정일 1일 전 18시 이후 취소/변경/노쇼 발생 시</p>
								<p>
									- 성수기 (5월~10월, 12월 24일~31일) :<br> &nbsp; 최초 1일 숙박 요금의
									80%가 위약금으로 부과
								</p>
								<p>
									- 비수기 (성수기 외 기간) :<br> &nbsp; 최초 1일 숙박 요금의 10%가 위약금으로
									부과
								</p>
							</div>
						</div>
						<h3>결제 옵션 선택</h3>
						<select class="form-control" name="payment.payment_id" id="payment_id">
							<option value="0">결제 방법 선택</option>
							<%for (int i=0; i<payList.size(); i++) {%>
							<%Payment payment = payList.get(i); %>
							<option value="<%=payment.getPayment_id()%>"><%=payment.getPay_method() %></option>
							<%} %>
						</select>
						<div class="pay">
							<p>총 결제 금액 : <input type="text" name="total_pay" style="width: 120px" value="" readonly> 원</p>
						</div>	
						<div style="margin-top: 20px; text-align: right;">
							<button type="button" class="btn btn-default">결제</button>
						</div>			 
					</div>
				</div>
			</form>				
		</div>
    </main>
	
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>