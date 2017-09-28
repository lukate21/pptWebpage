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
						Form Wizard
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							and Validation
						</small>
					</h1>
				</div><!-- /.page-header -->
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						
						<div class="widget-box">
							<div class="widget-header widget-header-blue widget-header-flat">
								<h4 class="widget-title lighter">회원가입</h4>

							</div>

							<div class="widget-body">
								<div class="widget-main">
									<div id="fuelux-wizard-container">
										<div class="step-content pos-rel">
											<div class="step-pane active" data-step="1">

												<form class="form-horizontal" id="validation-form" action="#" method="post">
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Email Address:</label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="email" name="email" id="email" class="col-xs-12 col-sm-6" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">Password:</label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="password" name="password" id="password" class="col-xs-12 col-sm-4" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2">Confirm Password:</label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="password" name="password2" id="password2" class="col-xs-12 col-sm-4" />
															</div>
														</div>
													</div>

													<div class="hr hr-dotted"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Name:</label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<input type="text" id="name" name="name" class="col-xs-12 col-sm-5" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">Tel:</label>

														<div class="col-xs-12 col-sm-9">
															<div class="input-group">
																<span class="input-group-addon">
																	<i class="ace-icon fa fa-phone"></i>
																</span>

																<input type="tel" id="phone" name="phone" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>
												</form>
											</div>

											<div class="step-pane" data-step="2">
												<div class="center">
													<h3 class="green">Congrats!</h3>
													Your product is ready to ship! Click finish to continue!
												</div>
											</div>
										</div>
									</div>

									<hr />
									<div class="wizard-actions">
										<button class="btn btn-prev">
											<i class="ace-icon fa fa-arrow-left"></i>
											취소
										</button>

										<button class="btn btn-success btn-next" data-last="홈으로">
											완료
											<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
										</button>
									</div>
								</div><!-- /.widget-main -->
							</div><!-- /.widget-body -->
						</div>
			</div>
		</div>
	</div><!-- /.main-content -->
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
	
	
		var $validation = this.checked;
		$('#fuelux-wizard-container')
		.ace_wizard({
			//step: 2 //optional argument. wizard will jump to step "2" at first
			//buttons: '.wizard-actions:eq(0)'
		})
		.on('actionclicked.fu.wizard' , function(e, info){
			if(info.step == 1 && $validation) {
				if(!$('#validation-form').valid()) e.preventDefault();
			}
		})
		//.on('changed.fu.wizard', function() {
		//})
		.on('finished.fu.wizard', function(e) {
			bootbox.dialog({
				message: "Thank you! Your information was successfully saved!", 
				buttons: {
					"success" : {
						"label" : "OK",
						"className" : "btn-sm btn-primary"
					}
				}
			});
		}).on('stepclick.fu.wizard', function(e){
			//e.preventDefault();//this will prevent clicking and selecting steps
		});
		
	function callhome(){
		location.href = "${context}/hello.do"
	}	
	
		//hide or show the other form which requires validation
		//this is for demo only, you usullay want just one form in your application
		$('#skip-validation').removeAttr('checked').on('click', function(){
			$validation = this.checked;
			if(this.checked) {
				$('#sample-form').hide();
				$('#validation-form').removeClass('hide');
			}
			else {
				$('#validation-form').addClass('hide');
				$('#sample-form').show();
			}
		})
	
		//documentation : http://docs.jquery.com/Plugins/Validation/validate
	
		$.mask.definitions['~']='[+-]';
		$('#phone').mask('(999) 9999-9999');
	
		jQuery.validator.addMethod("phone", function (value, element) {
			return this.optional(element) || /^\(\d{3}\) \d{4}\-\d{4}( x\d{1,6})?$/.test(value);
		}, "Enter a valid phone number.");
	
		$('#validation-form').validate({
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
					required: "Please provide a valid email.",
					email: "Please provide a valid email."
				},
				password: {
					required: "Please specify a password.",
					minlength: "Please specify a secure password."
				},
				state: "Please choose state",
				subscription: "Please choose at least one option",
				gender: "Please choose gender",
				agree: "Please accept our policy"
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
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
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