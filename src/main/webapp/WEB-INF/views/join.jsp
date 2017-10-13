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

<!-- owl.carousel -->
<link rel="stylesheet" href="${context}/resources/assets/owlcarousel/assets/owl.carousel.css" />
<link rel="stylesheet" href="${context}/resources/assets/owlcarousel/assets/owl.theme.green.css" />
<script src="${context}/resources/assets/owlcarousel/owl.carousel.js"></script>
</head>
<body class="no-skin">
	<jsp:include page="include/top-menu.jsp"></jsp:include>
	<jsp:include page="include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context}/hello.do">Home</a></li>
					<li class="active">회원가입</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="page-header">
					<h1>
						<i class="ace-icon fa fa-leaf">&nbsp;회원가입</i>
					</h1>
				</div><!-- /.page-header -->
	
				<div class="row">
					<div class="col-xs-12">
						<form class="form-horizontal" id="joinForm" name="joinForm" role="form" action="${context}/join.do" onsubmit="return checkEle()" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 이메일 </label>
	
								<div class="col-sm-9">
									<input data-rel="tooltip" type="text" name="email" id="form-field-1" placeholder="e-mail" class="col-xs-10 col-sm-5"  title="이메일을 입력해 주세요" data-placement="top"/>
									<span class="help-inline col-xs-12 col-sm-7">
										<span class="btn btn-xs btn-warning" id="btnDup">중복확인</span>
									</span>
								</div>
							</div>
	
							<div class="space-4"></div>
	
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="password"> 
									비밀번호 <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="top" data-content="대소문자와 숫자조합으로 5글자이상" title="비밀번호 작성시">?</span>
								</label>
								
								<div class="col-sm-9">
									<input type="password" name="password" id="password" placeholder="Password" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="rePassword"> 비밀번호 재입력 </label>
	
								<div class="col-sm-9">
									<input type="password" id="rePassword" name="rePassword" placeholder="Password" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
										<span class="middle" id="rPassword"></span>
									</span>
								</div>
							</div>
	
							<div class="space-4"></div> 
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="name"> 이름 </label>
	
								<div class="col-sm-9">
									<input data-rel="tooltip" type="text" name="name" id="name" placeholder="name" title="이름을 입력해 주세요" data-placement="bottom" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">전화번호</label>

								<div class="col-xs-12 col-sm-9">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="ace-icon fa fa-phone"></i>
										</span>

										<input type="tel" id="phone" name="phone" />
									</div>
								</div>
							</div>
						</form>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" id="btnSubmit">
									<i class="ace-icon fa fa-check bigger-110"></i>
									Submit
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
									Reset
								</button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- /.page-content -->
		</div><!-- main-content-inner -->
	</div><!-- main-content -->
</div>
<!--========== FOOTER ==========-->
	<footer>
		<jsp:include page="include/bottom.jsp"></jsp:include>
	</footer>
<!-- page specific plugin scripts -->
<!-- inline scripts related to this page -->
<script src="${context}/resources/assets/js/chosen.jquery.min.js"></script>
<script src="${context}/resources/assets/js/moment.min.js"></script>
<script src="${context}/resources/assets/js/autosize.min.js"></script>
<script src="${context}/resources/assets/js/jquery.inputlimiter.min.js"></script>
<script src="${context}/resources/assets/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
	var checkDup = false;
	var dupId = false;
jQuery(function($) {
	$.mask.definitions['~']='[+-]';
	$('#phone').mask('999-9999-9999');
	
	$('[data-rel=tooltip]').tooltip({container:'body'});
	$('[data-rel=popover]').popover({container:'body'});
	
	$('#password').focus(function(){
		$('#rPassword').text("");
	})
	
});
$('#btnSubmit').click(function(){
	$('#joinForm').submit();
});

$('#btnDup').click(function(){
	setCheck();
	var form = document.joinForm;
	var email = form.email;

	if(email.value == ""){
		alert("이메일을 입력해주세요.")
		email.focus();
	}else{
		var param = "email="+email.value;
		$.ajax({
			url : "${context}/idCheck.json",
			data : param,
			method : "post",
			success : function(result){
				if(result == 1) {alert("이미 사용중인 이메일입니다."); dupId = true;}
				else {alert("사용 가능한 이메일입니다."); dupId = false;}
			}
		});
	}
});
function isNull(obj, msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}

function checkEle(){
	var form = document.joinForm;
	var email = form.email;
	var password = form.password;
	var rePassword = form.rePassword;
	var name = form.name;
	var phone = form.phone;

	if(isNull(email,"이메일을 입력해주세요.")){
		return false;
	}
	if(isNull(password, '패스워드를 입력해주세요')){
		return false;
	}
	if(isNull(rePassword, '패스워드를 재입력해주세요')){
		return false;
	}
	if(isNull(name, '이름을 입력해주세요')){
		return false;
	}
	if(isNull(phone, '전화번호를 입력해주세요')){
		return false;
	}
	if(!/^[a-zA-Z0-9]{4,15}$/.test(password.value)){
		$('#password').text('암호는 숫자와 영문자 조합으로 4~15자리를 사용해야 합니다.').css({
			'color' : 'red'
		});
		return false;
	}
	if(!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(phone.value)){
		alert("전화번호 형식에 맞지 않습니다.")
		return false;
	}
	if(checkDup == false){
		alert("이메일 중복확인 해주세요");
		$('#btnDup').focus();
		return false;
	}
	if(dupId == true){
		alert("다른 이메일을 입력해 주세요.");
		email.focus();
		return false;
	}
	if(password.value != rePassword.value){
		alert("입력한 비밀번호와 재입력한 비밀번호는 일치해야 합니다.");
		rePassword.focus();
		return false;
	}
	return true;
}

function setCheck(){
	if(checkDup == false)
		checkDup = true;
	return checkDup;
}

function checkPassword(element){
	var form = document.joinForm;
	var password = form.password;
	var rePassword = form.rePassword;
	
	if(element == "password"){
		if(rePassword.value != "" && rePassword.value == password.value)
			$('#rPassword').text("비밀번호가 일치합니다.").css("color","blue");
		else if(rePassword.value != "" && rePassword.value != password.value)
			$('#rPassword').text("비밀번호가 일치하지 않습니다.").css("color","red");
		else if(password.value == "")
			$('#rPassword').text("");
		else if(rePassword.value == "")
			$('#rPassword').text("");
	}else{
		if(rePassword.value != password.value){
			if(password.value == null) {
				$('#rPassword').text("");
			}
			else{
				$('#rPassword').text("비밀번호가 일치하지 않습니다.").css("color","red");
			}
		}else{
			if(password.value == null) {
				$('#rPassword').text("");
			}else{
				$('#rPassword').text("비밀번호가 일치합니다.").css("color","blue");
			}
		}
	}
}

$("#password").keyup(function(key) {
	if(password.value == "")
		$('#rPassword').text("");
	else
		checkPassword("password");
});

$("#rePassword").keyup(function(key) {
	checkPassword("repassword");
});

</script>
</body>
</html>