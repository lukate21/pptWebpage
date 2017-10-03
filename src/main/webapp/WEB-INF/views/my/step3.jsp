<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="3">
	<div class="center" id="validationDiv">
		<h3 class="blue lighter"></h3>
		<div class="row" id="equalTermDiv">
		
		</div>
		<div class="row" id="garbageTermDiv">
		
		</div>
	</div>
</div>

<script>
	function drawValidationState(){
		$('#equalTermDiv').append(equalTerms);
		$('#garbageTermDiv').append(garbageTerms);
	}
</script>