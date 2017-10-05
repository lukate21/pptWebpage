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
<jsp:include page="include/top-menu.jsp"></jsp:include>
	<jsp:include page="include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context}/hello.do">Home</a></li>
					<li class="active">myPage</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="row margin-b-5">
					<div class ="col-sm-4 col-sm-offset-4">
						<h1>${sessionScope.loginUser.name}님의 정보수정</h1>
						<form name="modifyForm" action="modify.do" method="post" onSubmit="return checkInfo()">
								 		<input type="hidden" name="email" value="${sessionScope.loginUser.id}@${sessionScope.loginUser.domain}"><br/><br/>
							비밀번호  		<input type="password" placeholder="password" name="password"><br/><br/>
							비밀번호확인  	<input type="password" placeholder="password" name="repassword"><br/><br/>
							전화번호 		<input type="tel" placeholder="'-'생략가능" name="tel"><br/>
										<input type="submit" value="완료">
						</form>
						 <div id="fail"><br/><br/></div>
					 </div>
				 </div>
			</div>
		</div>
	</div>
</div>
<footer id="footer">
	<jsp:include page="include/bottom.jsp"></jsp:include>
</footer>
<script>
	$('document').ready(function(){
		
	});
	
	function isNull(obj, msg){
		if(obj.value == ""){
			$('#fail').text(msg).css({
				'color' : 'red'
			});
			obj.focus();
			return true;
		}
		return false;
	}
	
	checkInfo = function(){
		var mForm = document.modifyForm;
		var password = mForm.password;	
		var rePassword = mForm.repassword;
		
		if(isNull(password,"변경할 비밀번호를 입력하세요"))
			return false;
		else if(isNull(rePassword,"변경할 비밀번호를 한번 더 입력하세요"))
			return false;
		else if(password.value !== rePassword.value){
			$('#fail').text("입력한 비밀번호가 일치하지 않습니다").css({ 'color' : 'red'});
			return false;
		}
		else{
			var result = confirm("수정하시겠습니까?");
			if(result == true)
				return true;
			else
				return false;
		}
		
	}
</script>
</body>
</html>