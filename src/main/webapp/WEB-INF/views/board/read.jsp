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
					게시판 <small>조회 페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/board/list"><i class="fa fa-dashboard"></i>Board</a></li>
					<li class="active"></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">제목 : ${ board.title }</h3>
						</div>
						<div class="box-body" style="height: 700px">
							${ board.content }
						</div>
						<div class="box-footer">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" alt="user image" src="${ path }/resources/dist/img/user1-128x128.jpg">
								<span class="username">
									<a href="#">${ board.writer }</a>
								</span>
								<span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${ board.regDate }" /></span>
							</div>
						</div>
						<div class="box-footer">
							<form role="form" method="post">
								<input type="hidden" name="b_no" value="${ board.b_no }">
							</form>
							<button type = "button" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
							<div class="pull-right">
								<button type = "reset" class="btn btn-warning modBtn"><i class="fa fa-reply"></i>수정</button>
								<button type = "submit" class="btn btn-dager delBtn"><i class="fa fa-save"></i>삭제</button>
							</div>
						</div>
					</div>
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
			formObj.attr("action", "/board/update");
			formObj.attr("method", "get");
			formObj.submit();
		}); 
		
		$(".delBtn").on("click", function() {
			var con_test = confirm("정말로 삭제하시겠습니까?");
			if(con_test == true){
				formObj.attr("action", "/board/delete");
				formObj.submit();
			}
			
		});
		
		$(".listBtn").on("click", function() {
			self.location = "/board/list";
		}); 
	});
	
</script>

</body>
</html>