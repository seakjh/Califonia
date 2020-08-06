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

function reserve(){
	//예약 요청 
	$.ajax({
		url:"/rest/room",
		type:"get",
		success:function(result){
			alert(result);
			showRoom();
		}
	});
}

//예약 가능한 방을 출력한다 
function showRoom(){
	class RoomTable extends React.Component{
		render(){
			var row = [];
               var roomImg = ["room1.jpg", "room2.jpg", "room3.jpg", "room4.jpg", "room5.jpg", "room6.jpg"];
			//데이터 쌓기
			for(var i=0;i<6;i++){ 
				row.push(
                   <div class="col-xl-4 col-lg-6 col-md-6">
                       <div class="single-room mb-50">
                           <div class="room-img">
                              <a href="rooms.html"><img src={"/resources/assets/img/rooms/"+roomImg[i]} alt=""/></a>
                           </div>
                           <div class="room-caption">
                               <h3><a href="rooms.html">Classic Double Bed</a></h3>
                               <div class="per-night">
                                   <span><u>$</u>150 <span>/ par night</span></span>
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
        <div class="booking-area">
            <div class="container">
               <div class="row ">
               <div class="col-12">
                <form action="">
                <div class="booking-wrap d-flex justify-content-between align-items-center">
                 
                    <!-- select in date -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span> Check In Date:</span>
                        </div>
                        <div class="boking-datepicker">
                            <input id="datepicker1"  placeholder="10/12/2020" />
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span>Check OutDate:</span>
                        </div>
                        <div class="boking-datepicker">
                            <input id="datepicker2"  placeholder="12/12/2020" />
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <div class="boking-tittle">
                            <span>Adults:</span>
                        </div>
                        <div class="select-this">
                            <form action="#">
                                <div class="select-itms">
                                    <select name="select" id="select1">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <div class="boking-tittle">
                            <span>Children:</span>
                        </div>
                        <div class="select-this">
                            <form action="#">
                                <div class="select-itms">
                                    <select name="select" id="select2">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <div class="boking-tittle">
                            <span>Rooms:</span>
                        </div>
                        <div class="select-this">
                            <form action="#">
                                <div class="select-itms">
                                    <select name="select" id="select3">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box pt-45 mb-30">
                        <a href="javascript:reserve()" class="btn select-btn">Book Now</a>
                   </div>
               

                </div>
            </form>
               </div>
               </div>
            </div>
        </div>
        <!-- Booking Room End-->

        <!-- Make customer Start-->

        <!-- Make customer End-->

        <!-- Room Start -->
        <section class="room-area">
				
                
<!--                 
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="#" class="btn view-btn1">View more  <i class="ti-angle-right"></i> </a>
                    </div>
                </div>
 -->                
            

        </section>
        <!-- Room End -->

        <!-- Dining Start -->
        
        <!-- Dining End -->

        <!-- Testimonial Start -->
        <!-- Testimonial End -->

        <!-- Blog Start -->
       
        <!-- Blog End -->

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