<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ page contentType="text/html; charset=UTF-8"%>
<html>

<%@ include file="../../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../../include/main_header.jsp"%>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                게시판
                <small>목록페이지(페이징+검색)</small>
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> board</li>
                <li class="active"> list</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">
			
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">게시글 목록(페이징+검색)</h3>
                        <div class="pull-right" style="margin-right: 20px;">
                            <button type="button" class="btn btn-success btn-flat" id="writeBtn">
                                <i class="fa fa-pencil"></i> 글쓰기
                            </button>
                        </div>
                    </div>
                    
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th class="col-xs-1">번호</th>
                                <th>제목</th>
                                <th class="col-xs-2">작성자</th>
                                <th class="col-xs-2">작성일자</th>
                                <th class="col-xs-1">조회</th>
                            </tr>
                            <c:forEach items="${boards}" var="board">
                            <tr>
                                <td>${board.b_no}</td>
                                <td>
                                    <a href="${path}/board/paging/search/read${pageMaker.makeSearch(pageMaker.cri.page)}&b_no=${board.b_no}">
                                            ${board.title}
                                    </a>
                                   <span class="badge bg-teal"><i class="fa fa-comment-o"></i> + ${ board.replycnt }</span>
                                </td>
                                <td>${board.writer}</td>
                                <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>

                                <td><span class="badge bg-red">${board.viewCnt} </span></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="box-footer">
                        <div class="text-center">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li><a href="${path}/board/paging/search/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
                                        <a href="${path}/board/paging/search/list${pageMaker.makeSearch(idx)}">${idx}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li><a href="${path}/board/paging/search/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="box-footer">
                        <div class="form-group col-sm-2">
                            <select class="form-control" name="searchType" id="searchType">
                                <option value="n" <c:out value="${searchCri.searchType == null ? 'selected' : ''}"/>>------ 선택 ------</option>
                                <option value="t" <c:out value="${searchCri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                                <option value="c" <c:out value="${searchCri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                                <option value="w" <c:out value="${searchCri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                                <option value="tc" <c:out value="${searchCri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                                <option value="cw" <c:out value="${searchCri.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
                                <option value="tcw" <c:out value="${searchCri.searchType eq 'tcw' ? 'selected' : ''}"/>>전체</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-10">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCri.keyword}" placeholder="검색어">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                                        <i class="fa fa-search"></i> 검색
                                    </button>
                                </span>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../../include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->
<%@ include file="../../include/plugin_js.jsp"%>
<script>

    $(document).ready(function () {

        var result = "${msg}";
        if (result == "regSuccess") {
            alert("게시글 등록이 완료되었습니다.");
        } else if (result == "modSuccess") {
            alert("게시글 수정이 완료되었습니다.");
        } else if (result == "delSuccess") {
            alert("게시글 삭제가 완료되었습니다.");
        }

        $("#searchBtn").on("click", function (event) {
            self.location =
                "/board/paging/search/list${pageMaker.makeQuery(1)}"
                + "&searchType=" + $("select option:selected").val()
                + "&keyword=" + encodeURIComponent($("#keywordInput").val());
        });

        $("#writeBtn").on("click", function (event) {

            self.location = "/board/paging/search/create";

        });
    });

</script>
</body>
</html>