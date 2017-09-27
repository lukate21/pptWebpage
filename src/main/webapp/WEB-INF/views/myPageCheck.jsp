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
<!------------------------------------------------------------------------------------------------------------------------------------>
</head>
<body class="no-skin">
<jsp:include page="include/top-menu.jsp"></jsp:include>
	<jsp:include page="include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			비밀번호를 입력해주세요<br/>
		<form name="myForm" action="myPage.do" method="post" onSubmit="return checkForm()">
			<input type="hidden" name="id" value="${sessionScope.loginUser.id}">
			<input type="hidden" name="domain" value="${sessionScope.loginUser.domain}">
			<input type="password" name="password" autofocus ><br/>
			<div id="writePassword"></div>
			<input type="submit" value="완료">
		</form>
		</div>
	</div>
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