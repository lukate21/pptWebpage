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

				<script>
					var comList = [];
					$.ajax({
						url : '${context}/company/selectCompanyList.json',
						async : false,
						success : function(data) {
							comList = JSON.parse(data);
						}
					});
					var i = 0;
					myFunction();
					var test = setInterval(myFunction, 5000);
					function myFunction() {
						comName = comList[i].comName;
						$.ajax({
							url : '${context}/company/rtStock.json?name='+comName+'&timeFrame=1_DAY',
							success : function(data){
								var obj = JSON.parse(data)[0];
								var chartData = obj.price;
								var start = chartData[0].value;
								var now = chartData[chartData.length-1].value;
								if(start<now){
									$('#sidebar-shortcuts-large').html('<h5>'+comName+'</h5>'+'<span class="text-danger"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-danger">'
													+'<br/><i class="fa fa-caret-up"></i>&nbsp;'+(now-start)
													+'&nbsp;&nbsp;&nbsp;+'+((now-start)/start*100).toFixed(2)+'%</small></h3></span>');
								}else if(start>now){
									$('#sidebar-shortcuts-large').html('<h5>'+comName+'</h5>'+'<span class="text-primary"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-primary">'
											+'<br/><i class="fa fa-caret-down"></i>&nbsp;'+(start-now)
											+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
								}else{
									$('#sidebar-shortcuts-large').html('<h5>'+comName+'</h5>'+'<span><h3 style="margin-top:0"><b>'+now+'</b><small>'
											+'<br/>-'+(start-now)
											+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
								}
							}
						});
						i++;
						if(comList[i] == null){
							i = 0;
						}
					}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

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
						<li class="js_nav-item nav-item">
									<a class="dropdown-toggle" href="">
										<i class="menu-icon fa fa-book book-icon"></i>
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
											<a href="${context}/my/favorite.do">
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
										<li class="">
											<a class="" href="${context }/my/list.do">
												<i class="menu-icon fa fa-caret-right"></i>
												나만의 분석 보기
											</a>
											<b class="arrow"></b>
										</li>
									</ul>
								</li>
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
													<a href="#" id="id-btn-signOut">
														<i class="menu-icon fa fa-caret-right"></i>
														회원탈퇴
													</a>
			
													<b class="arrow"></b>
												</li>
											</ul>
										</li>
										<li class="">
											<a href="${context}/logout.do" id="id-btn-signOut">
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
				<div id="dialog-signOut" class="hide">
					<div class="alert alert-info bigger-110">
						탈퇴하실 경우, 등록 하신 주식 정보 등은 삭제되지 않고 30일 이후에 삭제됩니다.
					</div>
		
					<div class="space-6"></div>
					<p class="bigger-110 bolder center grey">
						<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i>
						탈퇴 하시겠습니까?
					</p>
				</div><!-- #dialog-confirm -->
		</div>
		</div>
		

