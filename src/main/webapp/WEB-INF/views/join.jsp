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
				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon">
							<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
							<i class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div><!-- /.nav-search -->
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
						<!-- PAGE CONTENT BEGINS -->
						<div class="widget-box">
							<div class="widget-header widget-header-blue widget-header-flat">
								<h4 class="widget-title lighter">회원가입 페이지입니다</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main">
									<div id="fuelux-wizard-container">
										<div>
											<ul class="steps">
												<li data-step="1" class="active">
												</li>
	
												<li data-step="2">
												</li>
	
												<li data-step="3">
												</li>
											</ul>
										</div>
	
										<hr />
	
										<div class="step-content pos-rel">
											<div class="step-pane active" data-step="1">
												<h3 class="lighter block green">정보를 입력해주세요</h3>
	
												<form class="form-horizontal" id="validation-form" method="get" action="${context}/hello.do">
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">이메일:</label>
	
														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="email" name="email" id="email" class="col-xs-12 col-sm-6" />
																&nbsp;&nbsp;<span><button class="btn btn-sm btn-warning">중복확인</button></span>
															</div>
														</div>
													</div>
	
													<div class="space-2"></div>
	
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">비밀번호:</label>
	
														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="password" name="password" id="password" class="col-xs-12 col-sm-4" />
															</div>
														</div>
													</div>
	
													<div class="space-2"></div>
	
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2">비밀번호 재입력:</label>
	
														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="password" name="password2" id="password2" class="col-xs-12 col-sm-4" />
															</div>
														</div>
													</div>
	
													<div class="hr hr-dotted"></div>
	
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">이름:</label>
	
														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="text" id="name" name="name" class="col-xs-12 col-sm-5" />
															</div>
														</div>
													</div>
	
													<div class="space-2"></div>
	
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">전화번호:</label>
	
														<div class="col-xs-12 col-sm-9">
															<div class="input-group">
																<span class="input-group-addon">
																	<i class="ace-icon fa fa-phone"></i>
																</span>
	
																<input type="tel" id="phone" name="phone" />
															</div>
														</div>
													</div>
	
													<div class="hr hr-dotted"></div>
	
													<div class="space-8"></div>
	
													<div class="form-group">
														<div class="col-xs-12 col-sm-4 col-sm-offset-3">
															<label>
																<input name="agree" id="agree" type="checkbox" class="ace" />
																<span class="lbl"> 약관 내용에 동의합니다</span>
															</label>
														</div>
													</div>
												</form>
											</div>
	
											<div class="step-pane" data-step="2">
												<div class="center">
													<h3 class="green">입력하신 정보입니다!</h3>
													맞으시면 다음버튼을 눌러주세요.
												</div>
											</div>
	
											<div class="step-pane" data-step="3">
												<div class="center">
													<h3 class="green">축하합니다!</h3>
													"PPT-제법 쓸만한 예측 툴"에 가입하신것을 환영합니다!
												</div>
											</div>
	
										</div>
									</div>
	
									<hr />
									<div class="wizard-actions">
										<button class="btn btn-prev" data-last="취소">
											<i class="ace-icon fa fa-arrow-left"></i>
											이전
										</button>
	
										<button class="btn btn-success btn-next" data-last="완료">
											다음
											<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
										</button>
									</div>
								</div><!-- /.widget-main -->
							</div><!-- /.widget-body -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- main-content-inner -->
	</div><!-- main-content -->
</div>
<!--========== FOOTER ==========-->
	<footer>
		<jsp:include page="include/bottom.jsp"></jsp:include>
	</footer>
<!-- page specific plugin scripts -->
<script src="${context}/resources/assets/js/wizard.min.js"></script>
<script src="${context}/resources/assets/js/jquery.validate.min.js"></script>
<script src="${context}/resources/assets/js/jquery-additional-methods.min.js"></script>
<script src="${context}/resources/assets/js/bootbox.js"></script>
<script src="${context}/resources/assets/js/jquery.maskedinput.min.js"></script>
<script src="${context}/resources/assets/js/select2.min.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {
	
		$('[data-rel=tooltip]').tooltip();
	
		$('.select2').css('width','200px').select2({allowClear:true})
		.on('change', function(){
			$(this).closest('form').validate().element($(this));
		}); 
	
	
		//var $validation = this.checked;
		$('#fuelux-wizard-container')
		.ace_wizard({
			//step: 2 //optional argument. wizard will jump to step "2" at first
			//buttons: '.wizard-actions:eq(0)'
		})
		.on('actionclicked.fu.wizard' , function(e, info){
			if(info.step == 1) {
				if(!$('#validation-form').valid()) e.preventDefault();
			}
		})
		//.on('changed.fu.wizard', function() {
		//})
		.on('finished.fu.wizard', function(e) {
			bootbox.dialog({
				message: "회원가입이 완료되었습니다.", 
				buttons: {
					/* confirm : {
						"label" : "확인",
						"className" : "btn-sm btn-primary"
					}, cancel : {
						"label" : "취소",
						"className" : "btn-sm btn-primary"
					}, */
					"메인으로" : function(result){
						$('#validation-form').submit();
						//callhome();
					}
				}
			});
		}).on('stepclick.fu.wizard', function(e){
			//e.preventDefault();//this will prevent clicking and selecting steps
		});
		
	
		//hide or show the other form which requires validation
		//this is for demo only, you usullay want just one form in your application
	
		//documentation : http://docs.jquery.com/Plugins/Validation/validate
	
		$.mask.definitions['~']='[+-]';
		$('#phone').mask('(999) 9999-9999');
	
		jQuery.validator.addMethod("phone", function (value, element) {
			return this.optional(element) || /^\(\d{3}\) \d{4}\-\d{4}( x\d{1,6})?$/.test(value);
		}, "올바른 전화번호를 입력해주세요.");
	
		$('#validation-form').validate({
			debug : true,
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			rules: {
				email: {
					required: true,
					email:true
				},
				password: {
					required: true,
					minlength: 5
				},
				password2: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				name: {
					required: true
				},
				phone: {
					required: true,
					phone: 'required'
				},
				agree: {
					required: true,
				}
			},
	
			messages: {
				email: {
					required: "이메일 주소를 입력해 주세요.",
					email: "이메일 주소를 입력해 주세요."
				},
				password: {
					required: "비밀번호를 입력해주세요.",
					minlength: "비밀번호를 입력해주세요."
				},
				agree: "약관 동의에 체크해주세요."
			},
	
	
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
	
			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
	
			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},
	
			submitHandler: function (form) {
			},
			invalidHandler: function (form) {
			}
		});
		
		
		$(document).one('ajaxloadstart.page', function(e) {
			//in ajax mode, remove remaining elements before leaving page
			$('[class*=select2]').remove();
		});
	})
</script>
</body>
</html>