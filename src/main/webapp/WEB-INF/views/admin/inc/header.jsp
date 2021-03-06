<%@page import="com.hotel.app.domain.Admin"%>
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
							<a href="/"><img src="/resources/assets/img/logo/logo.png" alt=""></a>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8">
						<!-- main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="/admin/category">카테고리 관리</a></li>
									<li><a href="/admin/room">방관리</a></li>
									<li> <a href="#">옵션</a>
										<ul class="submenu">
											<li><a href="/admin/bed">침대옵션관리</a></li>
											<li><a href="/admin/service">서비스관리</a></li>											
										</ul>
									</li>
									<li><a href="#">예약주문관리</a>
										<ul class="submenu">
											<li><a href="/admin/reserve">예약주문정보</a></li>
											<li><a href="/admin/payment">결제옵션관리</a></li>											
										</ul>
									</li>
									<li><a href="/admin/member">회원정보</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2">
						<!-- header-btn -->
						<div class="header-btn">
							<%if (admin == null) {%>
							<a href="/admin/signin" class="btn btn1 d-none d-lg-block ">Login</a>
							<%} else { %>
							<a href="/admin/logout" class="btn btn1 d-none d-lg-block ">Logout</a>
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