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
					<li class="active">정보수정</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="page-header">
					<h1>
						회원정보 수정
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							${sessionScope.loginUser.name}님의 정보 수정
						</small>
					</h1>
				</div><!-- /.page-header -->
	
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" name="modifyForm" id="modifyForm" role="form" action="${context}/myPage/modify.do" method="post" onSubmit="return checkEle()">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="email"> 이메일 </label>
	
								<div class="col-sm-9">
									<input readonly="" type="text" class="col-xs-10 col-sm-5" name="email" id="email" value="${sessionScope.loginUser.id}@${sessionScope.loginUser.domain}" />
								</div>
							</div>
	
							<div class="space-4"></div>
	
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="prePassword"> 현재 비밀번호 </label>
	
								<div class="col-sm-9">
									<input type="password" id="prePassword" name="prePassword" placeholder="현재 비밀번호" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
										<span id="prePass" class="middle"></span>
									</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="password"> 변경할 비밀번호 </label>
	
								<div class="col-sm-9">
									<input type="password" id="password" name="password" placeholder="변경할 비밀번호" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="rePassword"> 비밀번호 재입력 </label>
	
								<div class="col-sm-9">
									<input type="password" id="rePassword" name="rePassword" placeholder="비밀번호 재입력" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
										<span id="rePass" class="middle"></span>
									</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">전화번호</label>

								<div class="col-xs-12 col-sm-9">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="ace-icon fa fa-phone"></i>
										</span>

										<input type="tel" id="phone" name="tel" value="${sessionScope.loginUser.tel}" />
									</div>
								</div>
							</div>
	
							<div class="space-4"></div>
	
						</form>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button id="btnModify" class="btn btn-info">
									<i class="ace-icon fa fa-check bigger-110"></i>
									완료
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
									초기화
								</button>
							</div>
						</div>
					</div><!-- /.row -->
				</div><!-- /.row -->
			</div>
		</div>
	</div>
</div>
<footer id="footer">
	<jsp:include page="../include/bottom.jsp"></jsp:include>
</footer>
<!-- inline scripts related to this page -->
<script src="${context}/resources/assets/js/jquery-ui.custom.min.js"></script>
<script src="${context}/resources/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${context}/resources/assets/js/chosen.jquery.min.js"></script>
<script src="${context}/resources/assets/js/moment.min.js"></script>
<script src="${context}/resources/assets/js/autosize.min.js"></script>
<script src="${context}/resources/assets/js/jquery.inputlimiter.min.js"></script>
<script src="${context}/resources/assets/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
jQuery(function($) {
	$.mask.definitions['~']='[+-]';
	$('#phone').mask('999-9999-9999');

	$('#btnModify').click(function(){
		$('#modifyForm').submit();
	});
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

function checkEle(){
	var mForm = document.modifyForm;
	var prePassword = mForm.prePassword;
	var password = mForm.password;	
	var rePassword = mForm.rePassword;
	var tel = mForm.tel;
	
	if(isNull(password,"변경할 비밀번호를 입력하세요"))
		return false;
	if(isNull(rePassword,"변경할 비밀번호를 한번 더 입력하세요"))
		return false;
	if(password.value !== rePassword.value){
		$('#fail').text("입력한 비밀번호가 일치하지 않습니다").css({ 'color' : 'red'});
		return false;
	}
	if(!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(tel.value)){
		alert("전화번호 형식에 맞지 않습니다.")
		return false;
	} 	
	var result = confirm("수정하시겠습니까?");
	if(result == true)
		return true;
	else
		return false;
};

function checkPassword(element){
	var mForm = document.modifyForm;
	var password = mForm.password;	
	var rePassword = mForm.rePassword;
	
	if(element == "password"){
		
	}else{
		if(rePassword.value != password.value){
			if(password.value == null) {
				
			}
			else{
				$('#rePass').text("비밀번호가 일치하지 않습니다.").css("color","red");
			}
		}else{
			if(password.value == null) {
				
			}else{
				$('#rePass').text("비밀번호가 일치합니다.").css("color","blue");
			}
		}
	}
};

$("#password").keyup(function(key) {
	checkPassword("password");
});

$("#rePassword").keyup(function(key) {
	checkPassword("repassword");
});
</script>
</body>
</html>