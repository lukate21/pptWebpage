<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
							clearInterval(test);
							var test;
							var comList = [];
							$.ajax({
								url : '${context}/company/selectCompanyList.json',
								success : function(data){
									comList = JSON.parse(data);
									test = setInterval(myFunction(0), 2000);
								}
							});
							
							function myFunction(i){
									$.ajax({
											url : '${context}/company/rtStock.json?name='+comList[i].comName+'&timeFrame=1_DAY',
											success : function(data){
												var obj = JSON.parse(data)[0];
												var chartData = obj.price;
												var start = chartData[0].value;
												var now = chartData[chartData.length-1].value;
												if(start<now){
													$('#sidebar-shortcuts-large').html('<span class="text-danger"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-danger">'
																	+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-up"></i>&nbsp;'+(now-start)
																	+'&nbsp;&nbsp;&nbsp;+'+((now-start)/start*100).toFixed(2)+'%</small></h3></span>');
												}else if(start>now){
													$('#sidebar-shortcuts-large').html('<span class="text-primary"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-primary">'
															+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>&nbsp;'+(start-now)
															+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
												}else{
													$('#sidebar-shortcuts-large').html('<span><h3 style="margin-top:0"><b>'+now+'</b><small>'
															+'&nbsp;&nbsp;&nbsp;-'+(start-now)
															+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
												}
												console.log(now);
												setInterval(myFunction(++i), 2000);
											}
										});
							}
							</script>
</body>
</html>