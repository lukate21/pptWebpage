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
								<i class="menu-icon fa fa-tachometer"></i>
								<span class="menu-text">HOME</span>
							</a>
						</li>
						<li class="">
							<a class="" href="${context }/company/search.do">기업검색</a>
						</li>
						<li class="">
							<a class="" href="${context }/my/analysis.do">사용자포트폴리오</a>
						</li>
						<li class="">
							<a	class="" href="#">증권거래소</a>
						</li>
						<c:choose>
							<c:when test="${ empty sessionScope.loginUser}">
								<li class="">
									<a class="" href="${context}/login.do">로그인</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="js_nav-item nav-item">
									<a class="dropdown-toggle" href="">
										<span>${sessionScope.loginUser.id }</span>
										<b class="arrow fa fa-angle-down"></b>
									</a>
									<ul class="submenu" >
										<li class="">
											<a href="${context}/myPage.do">
												<i class="menu-icon fa fa-caret-right"></i>
												마이페이지
											</a>
											<b class="arrow"></b>
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
