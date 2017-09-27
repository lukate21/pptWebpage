<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<header class="header navbar-fixed-top">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="menu-container js_nav-item">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="toggle-icon"></span>
					</button>

					<!-- Logo -->
					<div class="logo">
						<a class="logo-wrap" href="${context}/hello.do"> <img class="logo-img"
							src="${context}/assets/acecv/img/logo.png" alt="Asentus Logo">
						</a>
					</div>
					<!-- End Logo -->
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container">
						<ul class="nav navbar-nav navbar-nav-right">
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="${context}/hello.do">HOME</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">기업검색</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">사용자포트폴리오</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">증권거래소</a>
							</li>
							<c:choose>
							<c:when test="${ empty sessionScope.loginUser}">
								<li class="js_nav-item nav-item">
									<a class="nav-item-child nav-item-hover" href="${context}/login.do">로그인</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="js_nav-item nav-item">
									<a class="nav-item-child nav-item-hover dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true" style="cursor:pointer">${sessionScope.loginUser.id }</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">마이페이지</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="${context}/logout.do">로그아웃</a></li>
									</ul>
								</li>
							</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
</header>