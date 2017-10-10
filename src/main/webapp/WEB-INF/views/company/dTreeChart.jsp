<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/resources/assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context }/resources/treant/Treant.css">
<link rel="stylesheet" href="${context }/resources/treant/super-simple.css">
<script>
	var data = JSON.parse('${dTree}');
</script>

</head>
<body>
	<div class="chart" id="OrganiseChart-simple" style="width:100%;height:450px">
	</div>
	<script src="${context }/resources/treant/vendor/raphael.js"></script>
	<script src="${context }/resources/treant/Treant.js"></script>
	<script>
	drawDtree();
	function drawDtree(){
		var simple_chart_config = [];
		var config = {
			container: "#OrganiseChart-simple"
		};
		simple_chart_config.push(config);
		
		var newsCode = '${newsCode}';
		var anaCode = '${anaCode}';
		var index=0;
		for(var i in data){
			if(data[i].newsCode == newsCode && data[i].anaCode == anaCode){
				index = i;
				break;
			}
		}
		var dTree = data[index].dTree;
		var branch = dTree[0];
		var score = eval('branch.var');
		var name = branch.splits;
		if(score.includes('Inc'))
			name = '상승치'+name;
		else if(score.includes('Dec'))
			name = '하락치'+name;
		else if(score.includes('Equ'))
			name = '동결치'+name;
		var node0 = {
				text : { name : name}
		};
		simple_chart_config.push(node0);
	 	for(var i=1; i<dTree.length; i++){
			var leafCnt = 0;
			var branch = dTree[i];
			var score = eval('branch.var');
			var name = branch.splits;
			if(score.includes('Inc'))
				name = '상승치'+name;
			else if(score.includes('Dec'))
				name = '하락치'+name;
			else if(score.includes('Equ'))
				name = '동결치'+name;
			var index=0;
			for(var j=i-1; j>=0; j--){
				var checkBranch = dTree[j];
				if(checkBranch.floor == branch.floor)
					continue;
				else if(checkBranch.floor == branch.floor-1){
					index= j;
					break;
				}
			}
			if(branch.splits == '-'){
				if(branch.yVal == 'p')
					name = '상승';
				else if(branch.yVal == 'm')
					name = '하락'
				else if(branch.yVal == '-')
					name = '동결'
			}
			eval('var node' + i + '={parent : node'+ index + ',text : {name : "'+name +'"}}');
			simple_chart_config.push(eval("node"+i));
			
		}  
		new Treant( simple_chart_config );
	}
	</script>

</body>
</html>
	