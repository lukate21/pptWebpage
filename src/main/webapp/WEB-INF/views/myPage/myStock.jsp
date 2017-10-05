<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PPT-제법 쓸만한 예측 툴</title>

<!-- Main import -->
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<!-- text fonts -->
<link rel="stylesheet" href="${context}/resources/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-rtl.min.css" />
<!-- ace settings handler -->
<script src="${context}/resources/assets/js/ace-extra.min.js"></script>
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
</head>
<body class="no-skin">
<jsp:include page="../include/top-menu.jsp"></jsp:include>
<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context}/hello.do">Home</a></li>
					<li>마이페이지</li>
					<li class="active">주식현황</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="page-header">
					<h1>
						보유 주식 현황
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							${sessionScope.loginUser.name}님의 보유 주식
						</small>
					</h1>
				</div><!-- /.page-header -->
			</div>
		</div>
	</div>
</div>
<footer id="footer">
	<jsp:include page="../include/bottom.jsp"></jsp:include>
</footer>
</body>
</html>