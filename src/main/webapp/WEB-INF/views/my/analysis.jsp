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
	<jsp:include page="../include/top-menu.jsp"></jsp:include>
	<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context }">Home</a></li>
					<li><a href="#">Other Pages</a></li>
					<li class="active">Error 404</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
	
			<div class="page-content">
				<div class="col-sm-12">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">나만의 분석 만들기</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div id="fuelux-wizard-container">
												<div>
													<ul class="steps">
														<li data-step="1" class="active">
															<span class="step">1</span>
															<span class="title">기업 및 분석방법 선택</span>
														</li>

														<li data-step="2">
															<span class="step">2</span>
															<span class="title">사전 등록</span>
														</li>

														<li data-step="3">
															<span class="step">3</span>
															<span class="title">사전 유효성 점검</span>
														</li>

														<li data-step="4">
															<span class="step">4</span>
															<span class="title">결과 확인</span>
														</li>
													</ul>
												</div>

												<hr />

												<div class="step-content pos-rel">
													<jsp:include page="step1.jsp"></jsp:include>
													<jsp:include page="step2.jsp"></jsp:include>
													<jsp:include page="step3.jsp"></jsp:include>
													<jsp:include page="step4.jsp"></jsp:include>
												</div>
											</div>
											<hr />
											<div class="wizard-actions">
												<button class="btn btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													Prev
												</button>

												<button class="btn btn-success btn-next" data-last="Finish">
													Next
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					<%-- <iframe src="${context}/my/analysis/start.do" width="100%" height="800px" frameBorder="0"> </iframe> --%>
				</div>
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	</div>
	<footer>
		<jsp:include page="../include/bottom.jsp"></jsp:include>
	</footer>
	<script src="${context }/resources/assets/js/wizard.min.js"></script>
	<script src="${context }/resources/assets/js/jquery.validate.min.js"></script>
	<script
		src="${context }/resources/assets/js/jquery-additional-methods.min.js"></script>
	<script src="${context }/resources/assets/js/bootbox.js"></script>
	<script src="${context }/resources/assets/js/jquery.maskedinput.min.js"></script>
	<script src="${context }/resources/assets/js/select2.min.js"></script>
	<script src="${context}/resources/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
	<script src="${context}/resources/assets/js/jquery-typeahead.js"></script>
	<script src="${context}/resources/assets/js/bootstrap-tag.min.js"></script>
	
	<!-- inline scripts related to this page -->
	<script>
		var comName = '';
		var newsCode = '';
		var anaCode = '';
		var dicValidationKey = '';
		var equalTerms = [];
		var garbageTerms = [];
		//step1 to 2
		function getDictionary(){
			dicValidationKey='';
			$.ajax({
				url : "${context}/dictionary/getDictionary.json",
				data : {
					'id' : "test",//session ID로 바꿔야함
					'name' : comName,
					'anaCode' : anaCode,
					'newsCode' : newsCode
				},
				success : function(data){
					dicValidationKey = data;
					console.log(dicValidationKey);
				},
				error : function(e){
					console.log("error : "+ e);
				}
			});
		}
		function checkValidation(e){
			var userTerms = $('.tags span');
			var userReqDic = [];
			equalTerms = [];
			garbageTerms = [];
			for(var i=1; i<userTerms.length; i++){
				var str = $(userTerms[i]).text().replace('×','');
				userReqDic.push(str);
			}
			if(userReqDic.length == 0 ){
				alert('단어를 입력해주세요.');
				e.preventDefault();
			}else if(dicValidationKey == ''){
				alert('단어 사전을 불러오고 있습니다.');
				e.preventDefault();
			}else{
				$.ajax({
					url : "${context}/dictionary/validation.json",
					type: 'post',
					data : {
						'key' : dicValidationKey,
						'userReq' : JSON.stringify(userReqDic),
					},
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					async : false,
					success : function(data){
						var obj = JSON.parse(data);
						for(var i in obj){
							console.log(i);
							var term = obj[i];
							if(term.garbageTerm === undefined){
								equalTerms.push(term.equalTerm);
							}else{
								garbageTerms.push(term.garbageTerm);
							}
						}
						console.log(equalTerms);
						console.log(garbageTerms);
						drawValidationState();
						if(data == ""){
							e.preventDefault();
						}
					},
					error : function(e){
						console.log("error : "+ e);
					}
				});
			}
		}
		jQuery(function($) {
			var $validation = false;
			//Prev & Next 버튼 클릭 이벤트
			$('#fuelux-wizard-container').ace_wizard({
			//step: 2 //optional argument. wizard will jump to step "2" at first
			//buttons: '.wizard-actions:eq(0)'
			}).on('actionclicked.fu.wizard', function(e, info) {
				if (info.step == 1) {
					if(comName == ''){
						alert('기업을 선택해주세요.');
						e.preventDefault();
					}else if(anaCode == ''){
						alert('분석 방법을 선택해주세요.');
						e.preventDefault();
					}else if(newsCode == ''){
						alert('뉴스 카테고리를 선택해주세요.');
						e.preventDefault();
					}else{
						getDictionary();
					}
				}else if(info.step == 2 && info.direction == "next"){
					checkValidation(e);
				}
				if (info.step == 1 && $validation) {

					if (!$('#validation-form').valid())
						e.preventDefault();
				}
			}).on('changed.fu.wizard', function(info) {
				
			})
			
			var comList = [];
			<c:forEach items="${comList}" var="companyVO">
				comList.push("${companyVO.name}");
			</c:forEach>
			//typeahead.js
			//example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
			var substringMatcher = function(strs) {
				return function findMatches(q, cb) {
					var matches, substringRegex;

					// an array that will be populated with substring matches
					matches = [];

					// regex used to determine if a string contains the substring `q`
					substrRegex = new RegExp(q, 'i');

					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
							matches.push({
								value : str
							});
						}
					});
					cb(matches);
				}
			}
			$('input.typeahead').typeahead({
				hint : true,
				highlight : true,
				minLength : 0
			}, {
				name : 'company',
				displayKey : 'value',
				source : substringMatcher(comList),
				limit : 20
			});
			///////////////
			
			
			var tag_input = $('#form-field-tags');
			try{
				tag_input.tag(
				  {
					placeholder:tag_input.attr('placeholder'),
					//enable typeahead by specifying the source array
					//source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
					/**
					//or fetch data from database, fetch those that match "query"
					source: function(query, process) {
					  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
					  .done(function(result_items){
						process(result_items);
					  });
					}
					*/
				  }
				)
		
				//programmatically add/remove a tag
				var $tag_obj = $('#form-field-tags').data('tag');
				
				var index = $tag_obj.inValues('some tag');
				$tag_obj.remove(index);
				$('.tags span').empty();
				$('.inline').css('width','100%');
				$('.tags').css('width','100%');
			}
			catch(e) {
				//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
				tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
				//autosize($('#form-field-tags'));
			}

		});
	</script>
</body>
</html>