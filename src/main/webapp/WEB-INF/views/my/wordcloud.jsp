<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<title>TODO supply a title</title>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/d3.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/d3.layout.cloud.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/tags.js"></script> --%>
<script src="${pageContext.request.contextPath }/assets/js/jquery-2.1.4.min.js"></script>
</head>
<body>
	<div id="vis"></div>
	
	<script>
	$.ajax({
		url : 'http://localhost:8080/PPTAnalysisServer/dictionary/mongo/selectOpiDic.do?comName=AK홀딩스&opinion=pos&newsCode=economic',
		success : function(data){
			var tags = JSON.parse(data);
			update(tags);
			console.log(tags);
			window.onresize = function(event) {
				update(tags);
			}
		}
	});
	</script>
	<%-- <script src="${pageContext.request.contextPath }/resources/cloud.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/word-cloud.js"></script>
</body>
</html>
