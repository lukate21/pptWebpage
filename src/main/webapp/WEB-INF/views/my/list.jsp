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
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />

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
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							<div class="col-xs-10 col-xs-offset-1">
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
										<tr class="detail-row">
											<td colspan="8">
												<div class="table-detail">
													<div class="row">
														<div class="col-xs-12 col-sm-2">
															<div class="text-center">
																<img height="150"
																	class="thumbnail inline no-margin-bottom"
																	alt="Domain Owner's Avatar"
																	src="assets/images/avatars/profile-pic.jpg" /> <br />
																<div
																	class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
																	<div class="inline position-relative">
																		<a class="user-title-label" href="#"> <i
																			class="ace-icon fa fa-circle light-green"></i> &nbsp;
																			<span class="white">Alex M. Doe</span>
																		</a>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-xs-12 col-sm-7">
															<div class="space visible-xs"></div>

															<div class="profile-user-info profile-user-info-striped">
																<div class="profile-info-row">
																	<div class="profile-info-name">Username</div>

																	<div class="profile-info-value">
																		<span>alexdoe</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">Location</div>

																	<div class="profile-info-value">
																		<i class="fa fa-map-marker light-orange bigger-110"></i>
																		<span>Netherlands, Amsterdam</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">Age</div>

																	<div class="profile-info-value">
																		<span>38</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">Joined</div>

																	<div class="profile-info-value">
																		<span>2010/06/20</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">Last Online</div>

																	<div class="profile-info-value">
																		<span>3 hours ago</span>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">About Me</div>

																	<div class="profile-info-value">
																		<span>Bio</span>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-xs-12 col-sm-3">
															<div class="space visible-xs"></div>
															<h4 class="header blue lighter less-margin">Send a
																message to Alex</h4>

															<div class="space-6"></div>

															<form>
																<fieldset>
																	<textarea class="width-100" resize="none"
																		placeholder="Type something…"></textarea>
																</fieldset>

																<div class="hr hr-dotted"></div>

																<div class="clearfix">
																	<label class="pull-left"> <input
																		type="checkbox" class="ace" /> <span class="lbl">
																			Email me a copy</span>
																	</label>

																	<button
																		class="pull-right btn btn-sm btn-primary btn-white btn-round"
																		type="button">
																		Submit <i
																			class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
																	</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</td>
										</tr>
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
</div>
	<footer>
		<jsp:include page="../include/bottom.jsp"></jsp:include>
	</footer>
	<script>
	var myDic = JSON.parse('${myDic}');
	var myAnalysisList = [];
	<c:forEach items="${myAnalysisList}" var="myAnaysisVO">
		myAnalysisList.push({
			dicName : '${myAnaysisVO.dicName}',
			yesterdayFluc : '${myAnaysisVO.yesterdayFluc}',
			todayFluc : '${myAnaysisVO.todayFluc}',
			todayInc : ${myAnaysisVO.todayInc},
			todayDec : ${myAnaysisVO.todayDec},
			todayEqu : ${myAnaysisVO.todayEqu},
			tomorrowFluc : '${myAnaysisVO.tomorrowFluc}',
			tomorrowInc : ${myAnaysisVO.tomorrowInc},
			tomorrowDec : ${myAnaysisVO.tomorrowDec},
			tomorrowEqu : ${myAnaysisVO.tomorrowEqu},
		})
	</c:forEach>
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
											+'</td><td>'+newsCode+'</td><td>'+myDic[i].reliability+'%</td><td>'+myDic[i].dictionary.length
											+'</td><td class="center"><div class="action-buttons"><a href="#" class="green bigger-140 show-details-btn" title="Show Details">'
											+'<i class="ace-icon fa fa-angle-double-down"></i><span class="sr-only">Details</span></a></div></td>'
											+'<td class="center"><div class="hidden-sm hidden-xs btn-group center"><button class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></button></div></td></tr>');
			var detail = '';
			var dictionary = myDic[i].dictionary;
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
					$('#simple-table tbody').append('<tr class="detail-row"><td colspan="8"><div class="table-detail"><div class="row">'
							+'<div class="col-sm-9"><iframe src="${context}/company/chart/stock.do?name='+myDic[i].comName+'&draw=true" width="100%" height="400px" frameBorder="0"></iframe></div>'
							+'<div class="col-sm-3"><div class="row">주가예측 : '+todayPredict+'(금일) | '+tomorrowPredict+'(익일)<br/>'
							+'금일 상승치 : '+todayInc.toFixed(2)+' | 금일 하락치 : '+todayDec.toFixed(2)+' | 금일 동결치 : '+todayEqu.toFixed(2) + '<br/>'
							+'익일 상승치 : '+tomorrowInc.toFixed(2)+' | 익일 하락치 : '+tomorrowDec.toFixed(2)+' | 익일 동결치 : '+tomorrowEqu.toFixed(2) + '</div></div>'
							+'</div><div class="row"><div class="col-sm-6"><iframe src="${context}/company/chart/dTree.do'
							+'?name='+myDic[i].comName+'&anaCode='+myDic[i].anaCode+'&newsCode='+myDic[i].newsCode+'&inc='+todayInc+'&dec='+todayDec+'&equ='+todayEqu
							+'"width="100%" height="500px" frameBorder="0" id="today'+i+'"> </iframe></div>'
							+'<div class="col-sm-6"><iframe src="${context}/company/chart/dTree.do'
							+'?name='+myDic[i].comName+'&anaCode='+myDic[i].anaCode+'&newsCode='+myDic[i].newsCode+'&inc='+tomorrowInc+'&dec='+tomorrowDec+'&equ='+tomorrowEqu
							+'"width="100%" height="500px" frameBorder="0" id="tomorrow'+i+'"> </iframe></div>'
							+'</div></div></td></tr>');
					break;
				}
			}
			
		}
</script>
		<script type="text/javascript">
			jQuery(function($) {
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});

			})
		</script>
</body>
</html>