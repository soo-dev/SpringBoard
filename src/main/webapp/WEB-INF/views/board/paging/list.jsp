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

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<%@ include file="../../include/main_header.jsp"%>
		<%@ include file="../../include/left_column.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시판 <small>목록 페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i>Board</a></li>
					<li class="active"><a href="${ path }/board/paging/list">List</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content container-fluid">

			<div class="col-lg-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">게시글 목록</h3>
						
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="width: 30px">#</th>
									<th>제목</th>
									<th style="width: 100px">작성자</th>
									<th style="width: 150px">작성시간</th>
									<th style="width: 60px">조회</th>
								</tr>
								<c:forEach items="${ boards }" var="board">
									<tr>
										<td>${ board.b_no }</td>
										<%-- <td><a href="${ path }/board/read?b_no=${ board.b_no }">${ board.title }</a></td> --%>
										
										<td>
											<a href="${ path }/board/paging/read${ pageMaker.makeQuery(pageMaker.cri.page) }&b_no=${board.b_no}">
												${ board.title }
											</a>
										</td>
										<td>${ board.writer }</td>
										<td><fmt:formatDate value="${ board.regDate }" pattern="yyyy-MM-dd a HH:mm" /></td>
										<td><span class="badge bg-red">${ board.viewcnt }</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="box-footer">
						
						<div class="pull-right">
							<button type="button" class="btn btn-success btn-falt writeBtn" id="writeBtn">
								<i class="fa fa-pencil"></i>글쓰기
							</button>
						</div>
						<form id="listPageForm">
							<input type="hidden" name = "page" value="${ pageMaker.cri.page }">
							<input type="hidden" name = "perPageNum" value="${ pageMaker.cri.perPageNum }">
						</form>
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${ pageMaker.prev }">
									<%-- <li><a href="${ path }/board/listPaging?page=${ pageMaker.startPage - 1 }">이전</a></li> --%>
									<!-- URIComponents 이용 방식 -->
									<%-- <li><a href="${ path }/board/listPaging${ pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li> --%>
									<!-- js 이용 방식 -->
									<li><a href="${ pageMaker.startPage - 1 }">이전</a></li>
									
								</c:if>
								<c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" var="idx">
									<li <c:out value="${ pageMaker.cri.page == idx ? 'class=active' : '' }" />>
										<%-- <a href="${ path }/board/listPaging?page=${ idx }">${ idx }</a> --%>
										<!-- URIComponents 이용 방식 -->
										<%-- <a href="${ path }/board/listPaging${ pageMaker.makeQuery(idx) }">${ idx }</a> --%>
										<!-- js 이용 방식 -->
										<a href="${ idx }">${ idx }</a>
									</li>
								</c:forEach>
								<c:if test="${ pageMaker.next && pageMaker.endPage > 0 }">
									<%-- <li><a href="${ path }/board/listPaging?page=${ pageMaker.endPage + 1}">다음</a></li> --%>
									<!-- URIComponents 이용 방식 -->
									<%-- <li><a href="${ path }/board/listPaging${ pageMaker.makeQuery(pageMaker.endPage + 1 )}">다음</a></li> --%>
									<!-- js 이용 방식 -->
									<li><a href="${ pageMaker.endPage + 1 }">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<%@ include file="../../include/main_footer.jsp"%>


	</div>
	<!-- ./wrapper -->
	<%@ include file="../../include/plugin_js.jsp"%>

<script>

	var result = "${msg}";
	
	if (result == "regSuccess") {
		alert("게시글 등록 완료");
	} else if (result == "modSuccess") {
		alert("게시글 수정 완료");
	} else if (result == "delSuccess") {
		alert("게시글 삭제 완료");
	}

	
</script>
<script>
$(document).ready(function () {
	
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".writeBtn").on("click", function() {
		self.location = "/board/paging/create";
	}); 
	
});

</script>
<script>

	$(".pagination li a").on("click", function(event) {
		
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		var listPageForm = $("#listPageForm");
		listPageForm.find("[name='page']").val(targetPage);
		listPageForm.attr("action", "/board/paging/list").attr("method", "get");
		listPageForm.submit();
	});

</script>

</body>
</html>