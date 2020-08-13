<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="./include/head.jsp" %>
<script type="text/babel">
$(function(){
	
});

//방의 목록을 가져온다 
function getList(){
	var check_in = $("input[name='check_in']");
	var check_out = $("input[name='check_out']");

	if(check_in.val().length == 0 || check_out.val().length == 0) {
		alert("예약 하실 날짜를 선택해 주세요");
		return;
	}

	//예약 요청 
	$.ajax({
		url:"/rest/room",
		type:"get",
		data:{
			check_in:$("input[name='check_in']").val(),
			check_out:$("input[name='check_in']").val()
		},
		success:function(result){
			//alert(result);
			showRoom(result);
		}
	});
}

//예약 가능한 방을 출력한다 
function showRoom(result){

	class RoomTable extends React.Component{
		render(){
			var row = [];

			//데이터 쌓기
			for(var i=0;i<result.length;i++){ 
				var subCategory = result[i];

				console.log(subCategory);

				row.push(
                   <div class="col-xl-3 col-lg-6 col-md-6">
                       <div class="single-room mb-50">
							<input type="radio" id="room_id" name="subcategory_id" value={subCategory.subcategory_id}/>
                           <div class="room-img">
                              <img src={"/resources/data/"+subCategory.room.filename} alt=""/>
                           </div>
                           <div class="room-caption">
                               <h3>{subCategory.topCategory.name}</h3>
                               <div class="per-night">
                                   <span><u>&#8361;</u>{subCategory.topCategory.price} <span>/ Max {subCategory.room.max_number}명</span></span>
                               </div>
                           </div>
                       </div>
				</div>
				)	
			}
			return(
           <div class="container">
               <div class="row justify-content-center">
                   <div class="col-xl-8">
                       
                       <div class="font-back-tittle mb-45">
                           <div class="archivment-front">
                               <h3>Result </h3>
                           </div>
                           <h3 class="archivment-back">Our Rooms</h3>
                       </div>
                   </div>
               </div>

               <div class="row" id="roomContainer">
					{row}
               </div>
			</div>
               )
		};			
	}

       ReactDOM.render( <RoomTable/>, $(".room-area")[0]);
}


// 예약요청 하기  
function reserve(){
	var room_id = $("input[name='subcategory_id']");
	var isCheck = null;
	for (var i=0; i<room_id.length; i++) {
		if (room_id[i].checked == true) {
			isCheck = room_id[i].value;
		}
	}

	if(room_id == undefined || isCheck == null) {
		alert("예약 하실 방을 선택해 주세요");
		return;
	}

	if(confirm("선택하신 방을 예약하시겠습니까?")){
        form1.action="/reserve";
		form1.method="post";
        form1.submit();
	}	

}
const getDetail=(room_id)=>()=> {
	
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

	<%@include file="./include/header.jsp" %>

    <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active dot-style">
            
                <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/resources/assets/img/hero/h1_hero.jpg" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">Hotel Califonia</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Hotel & Resourt</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/resources/assets/img/hero/h1_hero.jpg" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">top hotel in the city</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Hotel & Resourt</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/resources/assets/img/hero/h1_hero.jpg" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">top hotel in the city</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Hotel & Resourt</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                
            </div>
            
        </div>
        <!-- slider Area End-->

        <!-- Booking Room Start-->
		<form name="form1">
			<div class="booking-area">
			    <div class="container">
			       <div class="row">
			       <div class="col-12">
			        <div class="booking-wrap d-flex justify-content-between align-items-center">
			         
			            <!-- select in date -->
			            <div class="single-select-box mb-30">
			                <!-- select out date -->
			                <div class="boking-tittle">
			                    <span> Check In Date:</span>
			                </div>
			                <div class="boking-datepicker">
			                    <input id="datepicker1"  placeholder="2020/12/10" name="check_in" />
			                </div>					
			           </div>
			            <!-- Single Select Box -->
			            <div class="single-select-box mb-30">
			                <!-- select out date -->
			                <div class="boking-tittle">
			                    <span>Check OutDate:</span>
			                </div>
			                <div class="boking-datepicker">
			                    <input id="datepicker2"  placeholder="2020/12/12" name="check_out"  />
			                </div>
			           </div>
			            <!-- Single Select Box -->
			            <div class="single-select-box pt-45 mb-30">
			                <a href="javascript:getList()" class="btn select-btn">Search Now</a>
			           </div>
			       
			
			        </div>
			       </div>
			       </div>
			    </div>
			</div>
			<!-- Booking Room End-->
			
			<!-- Make customer Start-->
			
			<!-- Make customer End-->
			
			<!-- Room Start -->
			<section class="room-area">
			        
			
			</section>
		</form>
        <section>
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="javascript:reserve()" class="btn view-btn1">Reservation<i class="ti-angle-right"></i> </a>
                    </div>
                </div>
        </section>
		        


        <!-- Gallery img Start-->
        <div class="gallery-area fix">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="gallery-active owl-carousel">
                            <div class="gallery-img">
                                <a href="#"><img src="/resources/assets/img/gallery/gallery1.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="/resources/assets/img/gallery/gallery2.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="/resources/assets/img/gallery/gallery3.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery img End-->
    </main>

   <%@ include file="./include/footer.jsp"%>

    </body>
</html>