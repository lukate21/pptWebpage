<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />
<div id="navbar" 
	class="navbar navbar-default ace-save-state navbar-fixed-top">
	<div class="navbar-container ace-save-state" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="${context}/hello.do" class="navbar-brand" style="margin:auto">
				<i class="fa fa-line-chart"></i><i>
						P<small style="color:white">erfect</small> P<small style="color:white">rediction</small> T<small style="color:white">ool</small>
				</i>
			</a>
		</div>
	</div>
	<!-- /.navbar-container -->
</div>

