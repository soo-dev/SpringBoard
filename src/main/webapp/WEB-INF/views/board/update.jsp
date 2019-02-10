<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<%@ include file="../include/main_header.jsp"%>
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시판 <small>수정 페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/board/list"><i class="fa fa-dashboard"></i>Board</a></li>
					<li class="active">Update</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

			<div class="col-lg-12">
				<form role="form" id="writeForm" method="post" action="${ path }/board/update">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">게시글 수정</h3>
						</div>
						<div class="box-body">
							<input type="hidden" name="b_no" value="${ board.b_no }">
							<div class="form-group">
									<label for="title">제목</label>
									<input class="form-control" id="title" name="title"  value="${ board.title }">
								</div>
								<div class="form-group">
									<label for="content">내용</label>
									<textarea class="form-control" id="content" name="content" rows="30" style="resize: none;">${ board.content }</textarea>
								</div>
								<div class="form-group">
									<label for="writer">작성자</label>
									<input class="form-control" id="writer" name="writer" value="${ board.writer }" readonly="readonly">
								</div>
						</div>
						<div class="box-footer">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" alt="user image" src="${ path }/resources//dist/img/user1-128x128.jpg">
								<span class="username">
									<a href="#">${ board.writer }</a>
								</span>
								<span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${ board.regDate }" /></span>
							</div>
						</div>
						<div class="box-footer">
							<button type = "button" class="btn btn-primary"><i class="fa fa-list listBtn"></i>목록</button>
							<div class="pull-right">
								<button type = "reset" class="btn btn-warning cancleBtn"><i class="fa fa-trash"></i>취소</button>
								<button type = "submit" class="btn btn-success modBtn"><i class="fa fa-save"></i>저장</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<%@ include file="../include/main_footer.jsp"%>


	</div>
	<!-- ./wrapper -->
	<%@ include file="../include/plugin_js.jsp"%>

<script>

	$(document).ready(function () {
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".modBtn").on("click", function() {
			
			formObj.submit();
		}); 
		
		$(".cancleBtn").on("click", function() {
			history.go(-1);
		}); 
		
		$(".listBtn").on("click", function() {
			self.location = "/board/list";
		}); 
	});
	
</script>

</body>
</html>