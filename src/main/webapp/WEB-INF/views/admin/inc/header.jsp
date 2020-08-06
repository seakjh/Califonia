<%@page import="com.hotel.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)session.getAttribute("admin");
%>

<header>
    <!-- Header Start -->
	<div class="header-area header-sticky">
		<div class="main-header ">
			<div class="container">
				<div class="row align-items-center">
					<!-- logo -->
					<div class="col-xl-2 col-lg-2">
						<div class="logo">
							<a href="/"><img src="/assets/img/logo/logo.png" alt=""></a>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8">
						<!-- main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="/admin/category/index.jsp">카테고리 관리</a></li>
									<li><a href="/member/myinfo.jsp">예약주문정보</a></li>
									<li><a href="/contact/contact.jsp">방관리</a></li>
									<li><a href="/reserve/reserveTable.jsp">서비스관리</a></li>
									<li><a href="/admin/member/list">회원정보</a></li>
									<li><a href="/member/myinfo.jsp">고객센터</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2">
						<!-- header-btn -->
						<div class="header-btn">
							<a href="/admin/login.jsp" class="btn btn1 d-none d-lg-block ">Login</a>
							<!--<a><%//=admin.getName() %>님 로그인 중</a>-->
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