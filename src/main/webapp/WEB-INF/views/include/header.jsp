<%@page import="com.hotel.app.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<style type="text/css">
html {
    scroll-behavior: smooth;
}
</style>
    <header>
        <!-- Header Start -->
       <div class="header-area header-sticky">
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                               <a href="/"><img src="/resources/assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                       <!--  <li><a href="/">소개</a></li>
                                        <li><a href="/reserve/reserveTable.jsp">객실정보</a></li> -->
                                        <li><a href="#reserve">예약하기</a></li>
                                        <li><a href="#contactMap">찾아오시는 길</a></li>
                                        <!-- <li><a href="#reserve">문의하기</a></li> -->
                                        <li><a href="#">MyPage</a></a>
                                            <ul class="submenu">
		                                        <li><a href="/member/info">내 정보</a></li>
		                                        <li><a href="/member/reserve">예약정보</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        <div class="col-xl-2 col-lg-2">
                            <!-- header-btn -->
                            <div class="header-btn">
								<%if (member == null) {%>
								<a href="/member/loginForm" class="btn btn1 d-none d-lg-block ">Login</a>
								<%} else { %>
								<a href="/member/logout" class="btn btn1 d-none d-lg-block ">Logout</a>
								<%} %>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>