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
						<form class="form-horizontal" role="form" action="${context}/myPage/modify.do" onSubmit="return checkEle()">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-input-readonly"> 이메일 </label>
	
								<div class="col-sm-9">
									<input readonly="" type="text" class="col-xs-10 col-sm-5" id="form-input-readonly" value="${sessionScope.loginUser.name}@${sessionScope.loginUser.domain}" />
								</div>
							</div>
	
							<div class="space-4"></div>
	
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 현재 비밀번호 </label>
	
								<div class="col-sm-9">
									<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
										<span class="middle">비밀번호를 확인합니다</span>
									</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 변경할 비밀번호 </label>
	
								<div class="col-sm-9">
									<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 비밀번호 재입력 </label>
	
								<div class="col-sm-9">
									<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
										<span class="middle">비밀번호가 일치하지 않습니다.</span>
									</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-filed-2"> 전화번호 </label>
								
								<div class="col-sm-9">
									<input type="text" id="form-filed=2" placeholder="(-)생략" class="col-xs-10 col-sm-5" value="${sessionScope.loginUser.tel}"/>
								</div>
							</div>
	
							<div class="space-4"></div>
	
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<button id="btnModify" class="btn btn-info" type="button">
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
						</form>
					</div><!-- /.row -->
				</div><!-- /.row -->
			</div>
		</div>
	</div>
</div>
<footer id="footer">
	<jsp:include page="../include/bottom.jsp"></jsp:include>
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