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
<!-- Zerif -->
<link rel="stylesheet" href="${context}/resources/zerif/css/bootstrap.min.css">
<link rel="stylesheet" href="${context}/resources/zerif/css/jquery.vegas.min.css">
<link rel="stylesheet" href="${context}/resources/zerif/css/animate.min.css">
<link rel="stylesheet" href="${context}/resources/zerif/css/style.css">
<link rel="stylesheet" href="${context}/resources/zerif/css/response.css">
<%-- <link rel="stylesheet" href="${context}/resources/zerif/css/owl.theme.css">
<link rel="stylesheet" href="${context}/resources/zerif/css/owl.carousel.css"> --%>

<link href="${context}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<!-- text fonts -->
<link rel="stylesheet" href="${context}/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<!--  owl.carousel -->
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.css">
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.css">
<!------------------------------------------------------------------------------------------------------------------------->
</head>
<body>
<header id="header">
	<jsp:include page="include/top-menu.jsp"></jsp:include>
</header>
<section id="works">
	<h1>정보수정</h1>
	<form action="#" method="post" onSubmit="return checkInfo()">
		id  		<input type="text" placeholder="id" value="${sessionScope.loginUser.id}@${sessionScope.loginUser.domain}"><br/><br/>
		비밀번호  		<input type="password" placeholder="password"><br/><br/>
		비밀번호확인  	<input type="password" placeholder="password"><br/><br/>
		전화번호 		<input type="tel"><br/>
					<input type="submit" value="완료"> 
	</form>
</section>
<footer id="footer">
	<jsp:include page="include/bottom.jsp"></jsp:include>
</footer>
</body>
</html>