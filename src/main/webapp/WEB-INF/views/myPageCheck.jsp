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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/jquery.vegas.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/animate.min.css">
<link href="${pageContext.request.contextPath }/resources/zerif/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/zerif/css/response.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<!-- text fonts -->
<link rel="stylesheet" href="${context}/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<!------------------------------------------------------------------------------------------------------------------------------------>
</head>
<body id="body">
<header>
	<jsp:include page="include/top-menu.jsp"></jsp:include>
</header>
<div class="works">
비밀번호를 입력해주세요<br/>
	<form name="myForm" action="myPage.do" method="post" onSubmit="return checkForm()">
		<input type="hidden" name="id" value="${sessionScope.loginUser.id}">
		<input type="hidden" name="domain" value="${sessionScope.loginUser.domain}">
		<input type="password" name="password" autofocus ><br/>
		<div id="writePassword"></div>
		<input type="submit" value="완료">
	</form>
</div>
<footer>
	<jsp:include page="include/bottom.jsp"></jsp:include>
</footer>
<script>
function isNull(obj, msg){
	if(obj.value == ""){
		$('#writePassword').text(msg).css({
			'color' : 'red'
		});
		obj.focus();
		return true;
	}
	return false;
}
checkForm = function(){
	var form = document.myForm;
	var password = form.password;
	
	if(isNull(password,"암호를 입력해주세요")){
		return false;
	}
	
	return true;
}
</script>
</body>
</html>