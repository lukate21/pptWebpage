<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<div id="vis" style="width: 100%"></div>
	<script>
	$.ajax({
		url : 'http://localhost:8080/PPTAnalysisServer/dictionary/mongo/selectOpiDic.do?comName=${name}&opinion=pos&newsCode=economic',
		success : function(data){
			var tags = JSON.parse(data);
			wordCloudUpdate(tags);
			console.log(tags);
			window.onresize = function(event) {
				wordCloudUpdate(tags);
			}
		}
	});
	</script>
		<%-- <script src="${pageContext.request.contextPath }/resources/cloud.min.js"></script> --%>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/word-cloud.js"></script>
</body>
</html>
