<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PPT</title>
<link rel="icon" href="${context }/resources/logo.png" type="image/png">

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
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />

<script src="${context}/resources/assets/js/ace-extra.min.js"></script>
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/resources/d3.min.js"></script>
<script src="${context}/resources/d3.layout.cloud.js"></script>
<script src="${context}/resources/word-cloud.js"></script>
<script src="${context}/resources/liquidFillGauge.js"></script>
<!------------------------------------------------------------------------------------------------------------------------->
<script>
var opts = {
		  lines: 10 // The number of lines to draw
		, length: 8 // The length of each line
		, width: 6 // The line thickness
		, radius: 8 // The radius of the inner circle
		, scale: 1 // Scales overall size of the spinner
		, corners: 1 // Corner roundness (0..1)
		, color: '#000' // #rgb or #rrggbb or array of colors
		, opacity: 0.25 // Opacity of the lines
		, rotate: 0 // The rotation offset
		, direction: 1 // 1: clockwise, -1: counterclockwise
		, speed: 1 // Rounds per second
		, trail: 60 // Afterglow percentage
		, fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
		, zIndex: 2e9 // The z-index (defaults to 2000000000)
		, className: 'spinner' // The CSS class to assign to the spinner
		//, top: '50%' // Top position relative to parent
		//, left: '50%' // Left position relative to parent
		, shadow: false // Whether to render a shadow
		, hwaccel: false // Whether to use hardware acceleration
		, position: 'absolute' // Element positioning
		}
		
//step1 to 2
//step1 member variable
var comName = '';
var newsCode = '';
var anaCode = '';
var prevDic = [];
var prevDicSize = 0;
function getDictionary(){
	//초기화
	dicValidationKey='';
	prevDic=[];
	prevDicSize=0;
	var target = document.getElementById('spinner');
	var spinner = new Spinner(opts).spin(target);
	$.ajax({
		url : "${context}/dictionary/getDictionary.json",
		data : {
			'id' : '${loginUser.id}',
			'name' : comName,
			'anaCode' : anaCode,
			'newsCode' : newsCode
		},
		success : function(data){
			var obj = JSON.parse(data);
			//console.log(obj);
			dicValidationKey = obj.id;
			prevDic = obj.prevDic;
			prevDicSize = obj.size;
			//console.log(dicValidationKey);
			$('#textTab button').attr('onclick','drawPrevDic(1)');
			$('#spinner').empty();
		},
		error : function(e){
			console.log("error : "+ e);
		}
	});
	$('#inputDic').empty();
}
var myDic = [];
function selectUserDic(){
	$.ajax({
		url : "${context}/dictionary/mongo/selectUserDic.json",
		type: 'get',
		data : {
			'userNo' : '${loginUser.no}'
		},
		async : false,
		success : function(data){
			myDic = JSON.parse(data);
			console.log(myDic);
			$('#mydicTab tbody').empty();
			for(var i in myDic){
				var anaCode = '';
				var newsCode = '';
				if(myDic[i].anaCode == 'opi1')
					anaCode = '감정분석1';
				else if(myDic[i].anaCode == 'opi2')
					anaCode = '감정분석2';
				else if(myDic[i].anaCode == 'pro1')
					anaCode = '확률분석1';
				else if(myDic[i].anaCode == 'pro2')
					anaCode = '확률분석2';
				else if(myDic[i].anaCode == 'fit1')
					anaCode = '필터분석1';
				else if(myDic[i].anaCode == 'fit2')
					anaCode = '필터분석2';
				else if(myDic[i].anaCode == 'meg1')
					anaCode = '통합분석1';
				else if(myDic[i].anaCode == 'meg2')
					anaCode = '통합분석2';
				if(myDic[i].newsCode == 'culture')
					newsCode = '문화';
				else if(myDic[i].newsCode == 'digital')
					newsCode = 'IT';
				else if(myDic[i].newsCode == 'economic')
					newsCode = '경제';
				else if(myDic[i].newsCode == 'entertain')
					newsCode = '연예';
				else if(myDic[i].newsCode == 'foreign')
					newsCode = '국제';
				else if(myDic[i].newsCode == 'politics')
					newsCode = '정치';
				else if(myDic[i].newsCode == 'society')
					newsCode = '사회';
				$('#mydicTab tbody').append('<tr style="cursor:pointer;" onclick="drawMyDic('+i+')"><td>'+myDic[i].dicName+'</td><td>'+myDic[i].comName+'</td><td>'+anaCode
												+'</td><td>'+newsCode+'</td><td>'+myDic[i].reliability+'%</td><td>'+myDic[i].dictionary.length+'</td></tr>');
			}
		},
		error : function(error){
			console.log("error : "+ error);
		}
	});
}

//step2 to 3
//step2 member variable
var dicValidationKey = '';
var usefulTerms = [];
var uselessTerms = [];
function checkValidation(e){
	var userTerms = $('.tags span');
	var userReqDic = [];
	equalTerms = [];
	garbageTerms = [];
	for(var i=0; i<userTerms.length; i++){
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
				'userReq' : JSON.stringify(userReqDic)
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			async : false,
			success : function(data){
				var obj = JSON.parse(data);
				usefulTerms = obj.usefulTerms;
				usefulTerms = usefulTerms.sort(function(a,b){return b.value-a.value});
				uselessTerms = obj.uselessTerms;
				uselessTerms = uselessTerms.sort(function(a,b){return b.value-a.value});
				drawValidationState();
			},
			error : function(error){
				console.log("error : "+ error);
				e.preventDefault();
			}
		});
	}
}
var reliability ='';
function getReliability(){
	var target = document.getElementById('reliabilitySpinner');
	var spinner = new Spinner(opts).spin(target);
	$.ajax({
		url : "${context}/my/analysis/getReliability.json",
		type: 'post',
		data : {
			'comName' : comName,
			'newsCode' : newsCode,
			'anaCode' : anaCode,
			'userDic' : JSON.stringify(userDic)
		},
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data){
			reliability = data.split(',')[1];
			$('#reliabilityDiv').empty();
			$('#reliabilityDiv').html('<i class="ace-icon fa fa-angle-double-right"></i>'+data.split(',')[0]+'->'+reliability+'%');
		},
		error : function(error){
			console.log("error : "+ error);
		}
	});
}

//step3 to 4
//step3 member variable
var dicName = '';
var userDic = [];
var successful = false;
function checkDicName(dicName){
	var able = true;
	for(var i in myDic){
		if(myDic[i].dicName == dicName){
			able = false;
			alert('동일한 이름이 존재합니다.')
			break;			
		}
	}
	if(reliability == ''){
		able = false;
		alert('예측 신뢰도를 측정 중입니다.\n잠시만 기다려주세요.');
	}
	return able;
}


//last
function insertUserDic(){
	$.ajax({
		url : "${context}/my/analysis/insertUserDic.json",
		type: 'post',
		data : {
			'userNo' : '${loginUser.no}',
			'dicName' : dicName,
			'comName' : comName,
			'newsCode' : newsCode,
			'anaCode' : anaCode,
			'userDic' : JSON.stringify(userDic)
		},
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data){
			console.log(data);
		},
		error : function(error){
			console.log("error : "+ error);
		}
	});
	$.ajax({
		url : "${context}/dictionary/mongo/insertUserDic.json",
		type: 'post',
		data : {
			'userNo' : '${loginUser.no}',
			'comName' : comName,
			'newsCode' : newsCode,
			'anaCode' : anaCode,
			'dicName' : dicName,
			'reliability' : reliability,
			'userDic' : JSON.stringify(userDic)
		},
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		async : false,
		success : function(data){
			location.href="${context}/my/list.do";
		},
		error : function(error){
			console.log("error : "+ error);
		}
	});
}
$(function(){
	var target = document.getElementById('loadingSpinner');
	var spinner = new Spinner(opts).spin(target);
});

</script>
<style>
.liquidFillGaugeText {
	font-family: Helvetica;
	font-weight: bold;
}
/* some elements used in demo only */
.spinner-preview {
	width: 100px;
	height: 100px;
	text-align: center;
	margin-top: 60px;
}
</style>

</head>
<body class="no-skin">
	<jsp:include page="../include/top-menu.jsp"></jsp:include>
	<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context }">Home</a></li>
					<li>MY포트폴리오</li>
					<li class="active">나만의&nbsp;분석&nbsp;만들기</li>
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
										<h4 class="widget-title lighter">나만의 분석 만들기
											<small>
												<span id="comNameSpan">
												</span>
												<span id="anaCodeSpan">
												</span>
												<span id="newsCodeSpan">
												</span>
												<span id="termCntSpan">
												</span>
												<span id="usefulTermSpan">
												</span>
												
											</small>
										</h4>
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
												<button class="btn btn-prev" data-last="Finish">
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
	<script src="${context }/resources/assets/js/jquery-additional-methods.min.js"></script>
	<script src="${context }/resources/assets/js/bootbox.js"></script>
	<script src="${context }/resources/assets/js/jquery.maskedinput.min.js"></script>
	<script src="${context }/resources/assets/js/select2.min.js"></script>
	<script src="${context}/resources/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
	<script src="${context}/resources/assets/js/jquery-typeahead.js"></script>
	<script src="${context}/resources/assets/js/bootstrap-tag.min.js"></script>
	<script src="${context}/resources/assets/js/jquery-ui.min.js"></script>
	<script src="${context}/resources/assets/js/spin.min.js"></script>
	
	<%-- <script src="${pageContext.request.contextPath }/resources/cloud.min.js"></script> --%>
	
	<!-- inline scripts related to this page -->
	
	<script>
		jQuery(function($) {
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
						selectUserDic();
					}
				}else if(info.step == 2 && info.direction == "next"){
					userDic=[];
					successful=false;
					checkValidation(e);
					for(var i in usefulTerms){
						var term = usefulTerms[i].key;
						userDic.push(term);
					}
					getReliability();
				}else if(info.step == 3 && info.direction == "next" && usefulTerms.length==0){
					alert('유효한 단어가 존재하지 않아 사전을 만들 수 없습니다.');
					e.preventDefault();
				}else if(info.step == 3 && info.direction == "next" && !successful){
					e.preventDefault();
					userDicTable(1);
					$( "#dialog-confirm" ).removeClass('hide').dialog({
						resizable: false,
						width: '640',
						modal: true,
						title: "<div class='widget-header'><h4 class='smaller'><i class='ace-icon fa fa-book'></i> 나만의 분석 등록</h4></div>",
						title_html: true,
						buttons: [
							{
								html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; Cancel",
								"class" : "btn btn-minier",
								click: function() {
									$( this ).dialog( "close" );
								}
							},
							{
								text: "OK",
								"class" : "btn btn-primary btn-minier",
								click: function() {
									dicName = $('#dicNameInput').val();
									if(dicName == ''){
										alert('나만의 분석 이름을 등록해주세요.');
									}else if(checkDicName(dicName)){
										$('#dicNameP').text(dicName);
										$('#comNameP').text($('#comNameSpan').text());
										$('#anaCodeP').text($('#anaCodeSpan').text());
										$('#newsCodeP').text($('#newsCodeSpan').text());
										$('#reliabilityP').text(reliability+'%');
										$('#dictionaryP').text(userDic.length+'개');
										successful=true;
										$( this ).dialog( "close" );
										$('.btn-next').trigger('click');
									}
								} 
							}
						]
					});
				}else if(info.step == 4 && info.direction == "next"){
					insertUserDic();
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
				$('.tags').css({
					'width':'100%',
					'height':'450px',
					'overflow':'auto'
				});
			}
			catch(e) {
				//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
				tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
				//autosize($('#form-field-tags'));
			}
			
			$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
				_title: function(title) {
					var $title = this.options.title || '&nbsp;'
					if( ("title_html" in this.options) && this.options.title_html == true )
						title.html($title);
					else title.text($title);
				}
			}));
		});
	</script>
</body>
</html>