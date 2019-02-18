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
<%@ include file="../../include/head.jsp"%>
<style>

	.fileDrop {
		width:100%;
		height:200px;
		border:2px dotted #0b58a2;
	}
</style>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<%@ include file="../../include/main_header.jsp"%>
		<%@ include file="../../include/left_column.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시판<small>입력 페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i>board</a></li>
					<li class="active"><a href="${ path }/board/paging/create">create</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

			  <div class="col-lg-12">
				<form role="form" id="createForm" method="post" action="${ path }/board/paging/search/create">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">게시글 작성</h3>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label for="title">제목</label>
								<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" id="content" name="content" rows="18" style="resize: none;" placeholder="내용을 입력해주세요" ></textarea>
							</div>
							<div class="form-group">
								<label for="writer">작성자</label>
								<input class="form-control" id="writer" name="writer" value="${ login.user_id }"  readonly="readonly">
							</div>
							
							<!-- 첨부파일 영역 추가 -->
							<!-- <div class = "form-group">
								<div class="fileDrop">
								<br />
								<br />
								<br />
								<br />
								<p class="text-center"><i class="fa fa-paperclip"></i>첨부파일을 드래그 해주세요.</p>
								</div>
							</div> -->
							
						</div>
						<div class="box-footer">
							<button type = "button" class="btn btn-primary"><i class="fa fa-list"></i>목록</button>
							<div class="pull-right">
								<button type = "reset" class="btn btn-warning"><i class="fa fa-reply"></i>초기화</button>
								<button type = "submit" class="btn btn-success"><i class="fa fa-save"></i>저장</button>
							</div>
						</div>
					</div>
				</form>
			</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<%@ include file="../../include/main_footer.jsp"%>


	</div>
	<!-- ./wrapper -->
	<%@ include file="../../include/plugin_js.jsp"%>



	


</body>
</html>