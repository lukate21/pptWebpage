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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/owl.carousel.css"> --%>
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
	<jsp:include page="include/top-menu.jsp"></jsp:include>
	<br/><br/><br/>
	<div class="works">
		<div class="row">
			<div class="col-sm-12">
					<div align="center">
						<h1>.PPT</h1>
					</div>
			</div>
		</div>
		<div class="row margin-b-5">
			<div class ="col-sm-4 col-sm-offset-4">
				<form name="loginForm" action="login.do" method="post" onSubmit="return checkForm()">
					<input type="email" style="width:100%; height:50px" placeholder="&nbsp;&nbsp;아이디" autofocus name="email" value="${cookie.savedId.value}"><br/><br/>
					<input type="password" style="width:100%; height:50px" placeholder="&nbsp;&nbsp;패스워드" name="password"  value="${cookie.savedPassword.value}"><br/><br/>
					<div id="loginFail"></div>
					<input type="checkbox" name="remember" ${cookie.savedCheck.value }>&nbsp;로그인 상태 유지<br/><br/>
					<input type="submit" value="로그인" id="btnLogin" class="custom-button blue-text" style="font-size:20px; width:100%">
				</form>
			<hr/>
			</div>
		</div>
		<div class="row">
			<div align="center" >
				<div class="col-sm-12" align="center">
						<%-- ${cookie.user_remember.value} --%>
						<a href="#">아이디를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="#">비밀번호를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="join.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<!--========== FOOTER ==========-->
	<footer>
		<jsp:include page="include/bottom.jsp"></jsp:include>
	</footer>

<script>
	/* $('document').ready(function(){
		$('#btnLogin').click(function(){
			$('#loginForm').submit();
		})

	}); */
	
	function isNull(obj, msg){
		if(obj.value == ""){
			$('#loginFail').text(msg).css({
				'color' : 'red'
			});
			obj.focus();
			return true;
		}
		return false;
	}
	
	function checkForm() {
		var form = document.loginForm;
		var email = form.email;
		var password = form.password;
		
		if(isNull(form.email,"아이디를 입력하시오.")){
			return false;
		}
		if(isNull(form.password, '패스워드를 입력하세요')){
			return false;
		}
		if(!/^[a-zA-Z0-9]{4,15}$/.test(form.password.value)){
			$('#loginFail').text('암호는 숫자와 영문자 조합으로 4~15자리를 사용해야 합니다.').css({
				'color' : 'red'
			});
			return false;
			///^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/ : 영어, 숫자, 최소 한개 특수문자
		}
		return true;
	}
</script>
</body>
</html>