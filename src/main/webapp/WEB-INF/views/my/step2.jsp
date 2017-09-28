<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="2">
	<div>
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">
				<i class="ace-icon fa fa-times"></i>
			</button>

			<strong> <i class="ace-icon fa fa-check"></i> Well done!
			</strong> You successfully read this important alert message. <br />
		</div>

		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert">
				<i class="ace-icon fa fa-times"></i>
			</button>

			<strong> <i class="ace-icon fa fa-times"></i> Oh snap!
			</strong> Change a few things up and try submitting again. <br />
		</div>

		<div class="alert alert-warning">
			<button type="button" class="close" data-dismiss="alert">
				<i class="ace-icon fa fa-times"></i>
			</button>
			<strong>Warning!</strong> Best check yo self, you're not looking too
			good. <br />
		</div>

		<div class="alert alert-info">
			<button type="button" class="close" data-dismiss="alert">
				<i class="ace-icon fa fa-times"></i>
			</button>
			<strong>Heads up!</strong> This alert needs your attention, but it's
			not super important. <br />
		</div>
	</div>
</div>