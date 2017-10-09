<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="main-container ace-save-state" id="main-container">
	<div id="sidebar"
		class="sidebar responsive ace-save-state sidebar-fixed"
		data-sidebar="true" data-sidebar-scroll="true"
		data-sidebar-hover="true">
		<!-- /.sidebar-shortcuts -->
		<div class="nav-wrap-up pos-rel">
			<div class="nav-wrap">
				<div style="position: relative; top: 0px; transition-property: top; transition-duration: 0.15s;">
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="ace-icon fa fa-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="ace-icon fa fa-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="ace-icon fa fa-users"></i>
							</button>

							<button class="btn btn-danger">
								<i class="ace-icon fa fa-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span> <span class="btn btn-info"></span>

							<span class="btn btn-warning"></span> <span
								class="btn btn-danger"></span>
						</div>
					</div>
					<ul class="nav nav-list">
						<li class="">
							<a class="" href="${context}/hello.do">
								<i class="menu-icon fa fa-home home-icon"></i>
								<span class="menu-text">HOME</span>
							</a>
						</li>
						<li class="">
							<a class="" href="${context }/company/search.do">
								<i class="menu-icon fa fa-building-o building-o-icon"></i>
								<span class="menu-text">기업검색</span>
							</a>
						</li>
<<<<<<< HEAD
						<li class="js_nav-item nav-item">
									<a class="dropdown-toggle" href="">
										<span>사용자포트폴리오</span>
										<b class="arrow fa fa-angle-down"></b>
									</a>
									<ul class="submenu" >
										<li class="">
											<a href="${context}/my/stock.do">
												<i class="menu-icon fa fa-caret-right"></i>
												보유주식
											</a>
											<b class="arrow"></b>
										</li>
										<li class="">
											<a href="${context}/my/favorite.do?userNo=${loginUser.no}">
												<i class="menu-icon fa fa-caret-right"></i>
												관심기업
											</a>
											<b class="arrow"></b>
										</li>
										<li class="">
											<a class="" href="${context }/my/analysis.do">
												<i class="menu-icon fa fa-caret-right"></i>
												나만의 분석 만들기
											</a>
											<b class="arrow"></b>
										</li>
									</ul>
								</li>
=======
						<li class="">
							<a class="" href="${context }/my/analysis.do">
								<i class="menu-icon fa fa-book book-icon"></i>
								<span class="menu-text">사용자포트폴리오</span>
							</a>
						</li>
>>>>>>> eca9b760a3f3487b4d03d083d84f2c2fb45345a3
						<li class="">
							<a	class="" href="#">
								<i class="menu-icon fa fa-globe globe-icon"></i>
								<span class="menu-text">증권거래소</span>
							</a>
						</li>
						<c:choose>
							<c:when test="${ empty sessionScope.loginUser}">
								<li class="">
									<a class="" href="${context}/login.do">
										<i class="menu-icon fa fa-hand-o-right"></i>
										<span class="menu-text">로그인</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="js_nav-item nav-item">
									<a class="dropdown-toggle" href="">
										<i class="menu-icon fa fa-user"></i>
										<span>${sessionScope.loginUser.id }</span>
										<b class="arrow fa fa-angle-down"></b>
									</a>
									<ul class="submenu" >
										<li class="">
											<a href="#" class="dropdown-toggle">
												<span>마이페이지</span>
												<b class="arrow fa fa-angle-down"></b>
											</a>
											<b class="arrow"></b>
											<ul class="submenu">
												<li class="">
													<a href="${context}/myPage/myStock.do">
														<i class="menu-icon fa fa-caret-right"></i>
														주식현황
													</a>
			
													<b class="arrow"></b>
												</li>
			
												<li class="">
													<a href="${context}/myPage/modifyCheck.do">
														<i class="menu-icon fa fa-caret-right"></i>
														정보수정
													</a>
			
													<b class="arrow"></b>
												</li>
			
												<li class="">
													<a href="#">
														<i class="menu-icon fa fa-caret-right"></i>
														회원탈퇴
													</a>
			
													<b class="arrow"></b>
												</li>
											</ul>
										</li>
										<li class="">
											<a href="${context}/logout.do">
												<i class="menu-icon fa fa-caret-right"></i>
												로그아웃
											</a>
											<b class="arrow"></b>
										</li>
									</ul>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="ace-scroll nav-scroll scroll-disabled">
				<div class="scroll-track" style="display: none;">
					<div class="scroll-bar"
						style="top: 0px; transition-property: top; transition-duration: 0.1s;"></div>
				</div>
				<div class="scroll-content" style="">
					<div></div>
				</div>
			</div>
		</div>
		<!-- /.nav-list -->
	</div>
