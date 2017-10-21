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
<!------------------------------------------------------------------------------------------------------------------------->
</head>
<body class="no-skin">
	<div class="preloader">
		<div class="status">&nbsp;</div>
	</div>
	<jsp:include page="../include/top-menu.jsp"></jsp:include>
	<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context }">Home</a></li>
					<li>MY포트폴리오</li>
					<li class="active">나만의&nbsp;분석&nbsp;보기</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							<div class="col-xs-12">
								<table id="simple-table"
									class="table  table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">나만의 분석명</th>
											<th class="center">기업명</th>
											<th class="center">분석방법</th>
											<th class="center">뉴스</th>
											<th class="center">신뢰도</th>
											<th class="center">단어 개수</th>
											<th class="center">자세히</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<!-- /.span -->
						</div>
						<!-- /.row -->

					</div>
					<!-- /.page-content -->
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../include/bottom.jsp"></jsp:include>
	</footer>
	<script>
	var myDic = JSON.parse('${myDic}');
	var myAnalysisList = [];
	var todayIncList = [];
	var todayDecList = [];
	var todayEquList = [];
	var tomorrowIncList = [];
	var tomorrowDecList = [];
	var tomorrowEquList = [];
	<c:forEach items="${myAnalysisList}" var="myAnaysisVO">
		myAnalysisList.push({
			dicName : '${myAnaysisVO.dicName}',
			yesterdayFluc : '${myAnaysisVO.yesterdayFluc}',
			todayFluc : '${myAnaysisVO.todayFluc}',
			todayInc : Number('${myAnaysisVO.todayInc}'),
			todayDec : Number('${myAnaysisVO.todayDec}'),
			todayEqu : Number('${myAnaysisVO.todayEqu}'),
			tomorrowFluc : '${myAnaysisVO.tomorrowFluc}',
			tomorrowInc : Number('${myAnaysisVO.tomorrowInc}'),
			tomorrowDec : Number('${myAnaysisVO.tomorrowDec}'),
			tomorrowEqu : Number('${myAnaysisVO.tomorrowEqu}')
		});
	</c:forEach>
	console.log(myAnalysisList);
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
			$('#simple-table tbody').append('<tr id="'+i+'"><td>'+myDic[i].dicName+'</td><td>'+myDic[i].comName+'</td><td>'+anaCode
											+'</td><td>'+newsCode+'</td><td>'+myDic[i].reliability+'%</td><td>'+myDic[i].dictionary
											+'</td><td class="center"><div class="action-buttons"><a href="#" class="green bigger-140 show-details-btn" title="Show Details">'
											+'<i class="ace-icon fa fa-angle-double-down"></i><span class="sr-only">Details</span></a></div></td>'
											+'<td class="center"><div class="hidden-sm hidden-xs btn-group center"><button class="btn btn-xs btn-danger" onclick="deleteMyDic(\''+myDic[i].dicName+'\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button></div></td></tr>');
			var detail = '';
			//var dictionary = myDic[i].dictionary;
		/* 	for(var i in dictionary){
				detail += '<span class="label label-lg label-yellow arrowed-in arrowed-in-right">'
				detail += dictionary[i].term;
				detail += '</span>';
			} */
			
			for(var j in myAnalysisList){
				if(myAnalysisList[j].dicName == myDic[i].dicName){
					var todayPredict = myAnalysisList[j].todayFluc;
					var tomorrowPredict = myAnalysisList[j].tomorrowFluc;
					var todayInc =  myAnalysisList[j].todayInc;
					var todayDec =  myAnalysisList[j].todayDec;
					var todayEqu =  myAnalysisList[j].todayEqu;
					var tomorrowInc =  myAnalysisList[j].tomorrowInc;
					var tomorrowDec =  myAnalysisList[j].tomorrowDec;
					var tomorrowEqu =  myAnalysisList[j].tomorrowEqu;
					todayIncList.push(todayInc);
					todayDecList.push(todayDec);
					todayEquList.push(todayEqu);
					tomorrowIncList.push(tomorrowInc);
					tomorrowDecList.push(tomorrowDec);
					tomorrowEquList.push(tomorrowEqu);
					if(todayPredict == 'p'){
						todayPredict = '<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp;상승</b></span>';
					}
					else if(todayPredict == 'm'){
						todayPredict = '<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp;하락</b></span>';
					}else if(todayPredict == '-'){
						todayPredict = '<b>- 동결</b>';
					}else if(todayPredict == 'x'){
						todayPredict = '<b>데이터 부족</b>';
					}
					
					//내일
					if(tomorrowPredict == 'p'){
						tomorrowPredict = '<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp;상승</b></span>';
					}else if(tomorrowPredict == 'm'){
						tomorrowPredict = '<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp;하락</b></span>';
					}else if(tomorrowPredict == '-'){
						tomorrowPredict = '<b>- 동결</b>';
					}else if(tomorrowPredict == 'x'){
						tomorrowPredict = '<b>데이터 부족</b>';
					}
					$('#simple-table tbody').append('<tr class="detail-row"><td colspan="8"><div class="table-detail"><div class="row"><h1 class="center">'+myDic[i].comName+'</h1>'
							+'<div class="col-sm-6" id="stockChart'+i+'"></div>'
							+'<div class="col-sm-6"><div class="row center"><h5>주가예측 : '+todayPredict+'(금일) | '+tomorrowPredict+'(익일)</h5></div>'
							+'<div class="row center"><span id="scoreSpan'+i+'"></span>'
							+'<span class="pull-right"><label><input id="switch-field-'+i+'" class="ace ace-switch" type="checkbox">'
							+'<span class="lbl" data-lbl="익일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금일"></span></label></span></div>'
							+'<div class="row" id="dTree'+i+'"></div>'
							+'</div></div></div></div></td></tr>');
					break;
				}
			}
		}
		function drawChart(i){
			//if()
			$('#stockChart'+i).html('<iframe src="${context}/company/chart/stock.do?name='+myDic[i].comName+'&draw=true" width="100%" height="500px" frameBorder="0"></iframe>');
			dTreeSelector(i,'today');
		}
		
		function dTreeSelector(i,day){
			if(day=='today'){
				$('#scoreSpan'+i).html('금일 상승치 : '+todayIncList[i].toFixed(4)+' | 하락치 : '+todayDecList[i].toFixed(4)+' | 동결치 : '+todayEquList[i].toFixed(4));
				$('#dTree'+i).html('<iframe src="${context}/company/chart/dTree.do'
						+'?name='+myDic[i].comName+'&anaCode='+myDic[i].anaCode+'&newsCode='+myDic[i].newsCode+'&inc='+todayIncList[i]+'&dec='+todayDecList[i]+'&equ='+todayEquList[i]
						+'"width="100%" height="500px" frameBorder="0"> </iframe>');
			}else if(day == 'tomorrow'){
				$('#scoreSpan'+i).html('익일 상승치 : '+tomorrowIncList[i].toFixed(4)+' | 하락치 : '+tomorrowDecList[i].toFixed(4)+' | 동결치 : '+tomorrowEquList[i].toFixed(4));
				$('#dTree'+i).html('<iframe src="${context}/company/chart/dTree.do'
						+'?name='+myDic[i].comName+'&anaCode='+myDic[i].anaCode+'&newsCode='+myDic[i].newsCode+'&inc='+tomorrowIncList[i]+'&dec='+tomorrowDecList[i]+'&equ='+tomorrowEquList[i]
						+'"width="100%" height="500px" frameBorder="0"> </iframe>');
			}
		}
		
		function deleteMyDic(dicName){
			if(confirm('삭제되면 다시 확인할 수 없습니다.\n삭제 하시겠습니까?')){
				$.ajax({
					url : '${context}/dictionary/mongo/deleteUserDic.json',
					type : 'get',
					data : {
						'userNo' : '${loginUser.no}',
						'dicName' : dicName
					},
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data){
						alert(data);
						location.href = '${context}/my/list.do';
					}
				});
				
			}
		}
</script>
		<script type="text/javascript">
		$(document).on("click", ".ace.ace-switch", function() {
			var i = $(this).attr('id').split('-')[2];
			var day = '';
			if($('#scoreSpan'+i).text().includes('금일'))
				day='tomorrow';
			else
				day='today';
			dTreeSelector(i,day);
		});
		$(document).on("click", ".show-details-btn", function() {
			var i = $(this).closest('tr').attr('id');
			drawChart(i);
		});
			jQuery(function($) {
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});

			});
		</script>
</body>
</html>