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
<!------------------------------------------------------------------------------------------------------------------------->
</head>
<body class="no-skin">
	<jsp:include page="include/top-menu.jsp"></jsp:include>
	<jsp:include page="include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context}/hello.do">Home</a></li>
					<li class="active">로그인</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="row">
					<div class="col-sm-12">
							<div align="center">
								<img src="${context }/resources/logo.png" width="20%"><br/><br/>
							</div>
					</div>
				</div>
				<div class="row margin-b-5">
					<div class ="col-sm-4 col-sm-offset-4">
						<form name="loginForm" action="${context}/login.do" method="post" onSubmit="return checkForm()">
							<input type="email" style="width:100%; height:50px" placeholder="&nbsp;&nbsp;아이디" autofocus name="email" value="${cookie.savedId.value}"><br/><br/>
							<input type="password" style="width:100%; height:50px" placeholder="&nbsp;&nbsp;패스워드" name="password"  value="${cookie.savedPassword.value}"><br/><br/>
							<div id="loginFail"></div>
							<input type="checkbox" id="remember" class="ace" name="remember" ${cookie.savedCheck.value }>
							<span class="lbl"><label for="remember">&nbsp;로그인 상태 유지</label><br/><br/></span>
							<input type="submit" value="로그인" id="btnLogin" class="btn btn-info" style="font-size:20px; width:100%">
						</form>
					<hr/>
					</div>
				</div>
				<div class="row">
					<div align="center" >
						<div class="col-sm-12" align="center">
							<a href="#" id="id-btn-dialog1">아이디를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="#" id="id-btn-dialog2">비밀번호를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="join.do">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		<!-- jQuery UI -->
		<div id="dialog-findId" class="hide">
			<div class="alert alert-info bigger-100">
				이름과 전화번호를 입력해 주세요
			</div>
			<div class="hr hr-12 hr-double"></div>
			<div class="col-sm-12">
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="iName"> 이름 </label>
					<div class="col-sm-9">
						<input data-rel="tooltip" type="text" name="iName" id="iName" placeholder="name" title="이메일을 입력해 주세요" data-placement="top"/>
					</div>
				</div>
				
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">전화번호</label>

					<div class="col-xs-12 col-sm-9">
						<div class="input-group">
							<input type="tel" id="iPhone" name="iPhone" placeholder="phone"/>
						</div>
					</div>
				</div>
			</div>
			<div class="hr hr-12 hr-double"></div>
			<div>결과</div>
		</div><!-- #dialog-message -->

		<div id="dialog-findPassword" class="hide">
			<div class="alert alert-info bigger-100">
				이름과 전화번호, 이메일을 입력해 주세요
			</div>
			<div class="hr hr-12 hr-double"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="form-group">
						<label class="col-xs-3 control-label no-padding-right" for="pName"> 이름 </label>
						<div class="col-xs-9">
							<input data-rel="tooltip" type="text" class="input-large" name="pName" id="pName" placeholder="name" title="이메일을 입력해 주세요" data-placement="top"/>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="control-label col-xs-3 no-padding-right" for="phone">전화번호</label>
	
						<div class="col-xs-9">
							<div class="input-group">
								<input type="tel" id="pPhone" class="input-large" name="pPhone" placeholder="phone"/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-3 no-padding-right" for="email">이메일</label>
	
						<div class="col-xs-9">
							<div class="input-group">
								<input type="text" id="pEmail" class="input-large" name="pEmail" placeholder="email"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hr hr-12 hr-double"></div>
			<div class="alert alert-info bigger-100">
				이름과 전화번호, 이메일을 입력해 주세요
			</div>
		</div><!-- #dialog-confirm -->
	<!-- jQuery UI -->
		</div>
	</div>
</div>
	<!--========== FOOTER ==========-->
	<footer>
		<jsp:include page="include/bottom.jsp"></jsp:include>
	</footer>
<!-- page specific plugin scripts -->
<script src="${context}/resources/assets/js/chosen.jquery.min.js"></script>
<script src="${context}/resources/assets/js/jquery.inputlimiter.min.js"></script>
<script src="${context}/resources/assets/js/jquery.maskedinput.min.js"></script>
<script>
	jQuery(function($) {
		$.mask.definitions['~']='[+-]';
		$('#iPhone').mask('999-9999-9999');
		$('#pPhone').mask('999-9999-9999');
	});
	
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
	
	function findId(){
		var param = "name="+iName.value+"&tel="+iPhone.value;
		$.ajax({
			url : "${context}/findId.json",
			data : param,
			method : "post",
			success : function(result){
				alert(result);
			}
		});
	}
	function findPassword(){
		var param = "email="+pEmail.value+"&name="+pName.value+"&tel="+pPhone.value;
		$.ajax({
			url : "${context}/findPassword.json",
			data : param,
			method : "post",
			success : function(result){
				alert(result);
			}
		});
	}
	
jQuery(function($) {
	$( "#id-btn-dialog1" ).on('click', function(e) {
		e.preventDefault();

		var dialog = $( "#dialog-findId" ).removeClass('hide').dialog({
			modal: true,
			width: '360',
			height: '350',
			title: "    아이디 찾기",
			title_html: true,
			buttons: [ 
				{
					text: "확인",
					"class" : "btn btn-primary btn-minier",
					click: function() {
						findId();
						$( this ).dialog( "close" ); 
					} 
				},
				{
					text: "취소",
					"class" : "btn btn-minier",
					click: function() {
						$( this ).dialog( "close" ); 
					} 
				}
			]
		});
	});


	$( "#id-btn-dialog2" ).on('click', function(e) {
		e.preventDefault();
	
		var dialog = $( "#dialog-findPassword" ).removeClass('hide').dialog({
			modal: true,
			width: '400',
			height: '400',
			title: "    비밀번호 찾기",
			title_html: true,
			buttons: [ 
				{
					text: "확인",
					"class" : "btn btn-primary btn-minier",
					click: function() {
						findPassword();
						$( this ).dialog( "close" ); 
					} 
				},
				{
					text: "취소",
					"class" : "btn btn-minier",
					click: function() {
						$( this ).dialog( "close" ); 
					} 
				}
			]
		});
	});
});
</script>
</body>
</html>