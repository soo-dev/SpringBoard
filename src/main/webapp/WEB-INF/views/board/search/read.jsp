<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ page contentType="text/html; charset=UTF-8" language="java"%>

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
					게시판 <small>조회 페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${ path }/board/list"><i
							class="fa fa-dashboard"></i>Board</a></li>
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
						<div class="box-body" style="height: 400px">${ board.content }
						</div>
						<div class="box-footer">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" alt="user image"
									src="${ path }/resources/dist/img/user1-128x128.jpg"> <span
									class="username"> <a href="#">${ board.writer }</a>
								</span> <span class="description"><fmt:formatDate
										pattern="yyyy-MM-dd a HH:mm" value="${ board.regDate }" /></span>
							</div>
						</div>
						<div class="box-footer">
							<form role="form" method="post">
								<input type="hidden" name="b_no" value="${ board.b_no }" /> 
								<input
									type="hidden" name="page" value="${searchCri.page}"> <input
									type="hidden" name="perPageNum" value="${searchCri.perPageNum}">
								<input type="hidden" name="searchType"
									value="${searchCri.searchType}"> <input type="hidden"
									name="keyword" value="${searchCri.keyword}">
							</form>
							<button type="submit" class="btn btn-primary listBtn">
								<i class="fa fa-list"></i>목록
							</button>
							<c:if test="${ login.user_id == board.writer }">
								<div class="pull-right">
									<button type="submit" class="btn btn-warning modBtn">
										<i class="fa fa-edit"></i>수정
									</button>
									<button type="submit" class="btn btn-dager delBtn">
										<i class="fa fa-trash"></i>삭제
									</button>
								</div>
							</c:if>
						</div>
						
						<div class="box box-warning">
							<div class="box-header with-border">
								<a class="link-black text-lg"><i
									class="fa fa-pencil margin-r-5"></i> 댓글 쓰기</a>
							</div>
							<div class="box-body">
								<c:if test="${not empty login}">
									<form>
										
										<div class="form-group">

											<textarea class="form-control" id="newReplytext" rows="3"
												placeholder="댓글의 내용을 입력해주세요." style="resize: none"></textarea>
										</div>

										<div class="col-sm-2" hidden>
											<input class="form-control" id="newReplyer" type="text"
												value="${ login.user_id }" readonly="readonly">
										</div>


										<button type="button"
											class="btn btn-default btn-block replyAddBtn">
											<i class="fa fa-save"></i> 댓글 저장
										</button>
									</form>
								</c:if>
								<c:if test="${empty login}">
									<a href="${path}/user/login" class="btn btn-default btn-block"
										role="button"> <i class="fa fa-edit"></i>로그인 한 사용자만 댓글 등록이
										가능합니다.
									</a>
								</c:if>
							</div>
						</div>
						<div class="box box-success collapsed-box">
							<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
							<div class="box-header with-border">
								<a class="link-black text-lg"><i
									class="fa fa-comments-o margin-r-5 replyCount"></i> </a>
								<div class="box-tools">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<%--댓글 목록--%>
							<div class="box-body repliesDiv"></div>
							<%--댓글 페이징--%>
							<div class="box-footer">
								<div class="text-center">
									<ul class="pagination pagination-sm no-margin">

									</ul>
								</div>
							</div>
						</div>
						<%--댓글 수정 modal 영역--%>
						<div class="modal fade" id="modModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">댓글수정</h4>
									</div>
									<div class="modal-body" data-rno>
										<input type="hidden" class="rno" />
										<%--<input type="text" id="replytext" class="form-control"/>--%>
										<textarea class="form-control" id="replytext" rows="3"
											style="resize: none"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default pull-left"
											data-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary modalModBtn">수정</button>
									</div>
								</div>
							</div>
						</div>

						<%--댓글 삭제 modal 영역--%>
						<div class="modal fade" id="delModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">댓글 삭제</h4>
										<input type="hidden" class="rno" />
									</div>
									<div class="modal-body" data-rno>
										<p>댓글을 삭제하시겠습니까?</p>
										<input type="hidden" class="rno" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default pull-left"
											data-dismiss="modal">아니요.</button>
										<button type="button" class="btn btn-primary modalDelBtn">네.
											삭제합니다.</button>
									</div>
								</div>
							</div>
						</div>
					</div>
			</section>
		</div>





		<!-- Main Footer -->
		<%@ include file="../../include/main_footer.jsp"%>


	</div>

	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<%@ include file="../../include/plugin_js.jsp"%>

	<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-rno={{rno}}>
        <div class="user-block">
            <%--댓글 작성자 프로필사진--%>
            <img class="img-circle img-bordered-sm" src="${path}/resources/dist/img/user1-128x128.jpg" alt="user image">
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{replyer}}</a>
				{{#eqReplyer replyer}}
                <%--댓글 삭제 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-times"> 삭제</i>
                </a>
                <%--댓글 수정 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
				{{/eqReplyer}}
            </span>
            <%--댓글 작성일자--%>
            <span class="description">{{prettifyDate regdate}}</span>
        </div>
        <%--댓글 내용--%>
        <div class="oldReplytext">{{escape replytext}}</div>
        <br/>
    </div>
    {{/each}}
</script>

	<script>
	
    $(document).ready(function () {

		var b_no = "${board.b_no}";  // 현재 게시글 번호
        var replyer = "${login.user_id}";
        var replyPageNum = 1; // 댓글 페이지 번호 초기화
        
        Handlebars.registerHelper("eqReplyer", function(replytext, block) {
        	var accum = "";
        	if(replyer === "${login.user_id}"){
        		accum += block.fn();
        	}
        	return accum;
        });
        
        Handlebars.registerHelper("escape", function(replytext) {
        	var text = Handlebars.Utils.escapeExpression(replytext);
        	text = text.replace(/(\r\n|\n\r)/gm, "<br />");
        	text = text.replace(/()/gm, "&nbsp;");
        	return new Handlebars.SafeString(text);
        });
        
        Handlebars.registerHelper("prettifyDate", function(timeValue) {
        	var dateObj = new Date(timeValue);
        	var year = dateObj.getFullYear();
        	var month = dateObj.getMonth()+1;
        	var date = dateObj.getDate();
        	var hours = dateObj.getHours();
        	var minutes = dateObj.getMinutes();
        	// 2자리 숫자로 변환
        	month < 10 ? month = '0' + month : month;
        	date < 10 ? date = '0' + date : date;
        	hours < 10 ? hours = '0' + hours : hours;
        	minutes < 10 ? minutes = '0' + minutes : minutes;
        	
        	return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
        });
        
 	

        // 댓글 목록 함수 호출
        getReplies("/replies/" + b_no + "/" + replyPageNum);
        
        function getReplies(repliesUri) {
        
        	$.getJSON(repliesUri, function(data) {
        		printReplyCount(data.pageMaker.totalCount);
        		printReplies(data.list, $(".repliesDiv"), $("#replyTemplate"));
        		printReplyPaging(data.pageMaker, $(".pagination"));
        	});
        }
        
        // 댓글 갯수 출력 함수
        function printReplyCount(totalCount) {
        	
        	var replyCount = $(".replyCount");
        	var collapsedBox = $(".collapsed-box");
        	
        	// 댓글이 없으면
        	if(totalCount === 0) {
        		replyCount.html("첫 댓글을 남겨주세요!");
        		collapsedBox.find(".btn-box-tool").remove();
        		return;
        	}
        	
        	// 댓글이 있으면
        	replyCount.html("댓글 목록 (" + totalCount + ")");
        	collapsedBox.find(".box-tools").html(
        	"<button type = 'button' class='btn btn-box-tool' data-widget='collapse'>"
        	+ "<i class='fa fa-plus'></i>"
        	+ "</button>"
        	);
        }
        
        // 댓글 목록 출력
        function printReplies(replyArr, targetArea, templateObj) {
        	var replyTemplate = Handlebars.compile(templateObj.html());
        	var html = replyTemplate(replyArr);
        	$(".replyDiv").remove();
        	targetArea.html(html);
        }

		// 댓글 페이징 출력
		function printReplyPaging(pageMaker, targetArea) {
			
			var str = "";
			
			if(pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1) + "'>이전</a></li>";
			}
			for(var i = pageMaker.startPage, len = pageMaker.endPage; i<=len; i++) {
				var strClass = pageMaker.cri.page == i ? "class=active" : "";
				str += "<li " +strClass + "><a href='" + i + "'>" + i + "</a></li>";
			}
			if(pageMaker.next) {
				str += "<li><a href='"+(pageMaker.endPage + 1) + "'>다음</a></li>";
			}
			targetArea.html(str);
		}
        
        // 댓글 페이지 번호 클릭 이벤트
        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPageNum = $(this).attr("href");
            getReplies("/replies/" + b_no + "/" + replyPageNum);
        });

        // 댓글 저장 버튼 클릭 이벤트
        $(".replyAddBtn").on("click", function () {

            // 입력 form 선택자
            var replyerObj = $("#newReplyer");
            var replytextObj = $("#newReplytext");
            var replyer = replyerObj.val();
            var replytext = replytextObj.val();

            // 댓글 입력처리 수행
            $.ajax({
                type: 'post',
                url: '/replies/',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    b_no: b_no,
                    replyer: replyer,
                    replytext: replytext
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result === 'success') {
                        alert("댓글이 등록되었습니다.");
                        replyPageNum = 1;  // 페이지 1로 초기화
                        getReplies("/replies/" + b_no + "/" + replyPageNum); // 댓글 목록 호출
                        replytextObj.val("");   // 댓글 입력창 공백처리
                        replyerObj.val("");   // 댓글 입력창 공백처리
                    }
                }
            });
        });
        
        

        // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
        $(".repliesDiv").on("click", ".replyDiv", function (event) {
        	
        	
            var reply = $(this);
            
            console.log("reply rno  " , reply);
            
            $(".rno").val(reply.attr("data-rno"));
            
            $("#replytext").val(reply.find(".oldReplytext").text());
        });

        
        
        
        
        // modal 창의 댓글 수정버튼 클릭 이벤트
        $(".modalModBtn").on("click", function () {
        	
            var rno = $(".rno").val();
            //var rno = 333;
            
            
            console.log("rno", rno)
            
            console.log("======================================")

            
            
            var replytext = $("#replytext").val();
            $.ajax({
                type: "put",
                url: "/replies/" + rno,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                dataType : "text",
                data: JSON.stringify({
                    replytext: replytext
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result === "success") {
                        alert("댓글이 수정되었습니다.");
                        getReplies("/replies/" + b_no + "/" + replyPageNum); // 댓글 목록 호출
                        $("#modModal").modal("hide"); // modal 창 닫기
                    }
                }
            })
        });

        // modal 창의 댓글 삭제버튼 클릭 이벤트
        $(".modalDelBtn").on("click", function () {
            var rno = $(".rno").val();
            $.ajax({
                type: "delete",
                url: "/replies/" + rno,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: "text",
                success: function (result) {
                    console.log("result : " + result);
                    if (result === "success") {
                        alert("댓글이 삭제되었습니다.");
                        getReplies("/replies/" + b_no + "/" + replyPageNum); // 댓글 목록 호출
                        $("#delModal").modal("hide"); // modal 창 닫기
                    }
                }
            });
        });
      
		
		
		var formObj = $("form[role='form']");
        console.log(formObj);
		
		/* $(".modBtn").on("click", function() {
			formObj.attr("action", "/board/update");
			formObj.attr("method", "get");
			formObj.submit();
		});  */
		
		$(".modBtn").on("click", function() {
			formObj.attr("action", "/board/paging/search/update");
			formObj.attr("method", "get");
			formObj.submit();
		}); 
		
		/* $(".delBtn").on("click", function() {
			formObj.attr("action", "/board/delete");
			formObj.submit();
		}); */
		
		$(".delBtn").on("click", function() {
			var con_test = confirm("정말로 삭제하시겠습니까?");
			if(con_test == true){
				formObj.attr("action", "/board/paging/search/delete");
				formObj.submit();
			}
			
		}); 
		
		/* $(".listBtn").on("click", function() {
			self.location = "/board/list";
		}); */ 
		
		$(".listBtn").on("click", function() {
			
			formObj.attr("method", "get");
			formObj.attr("action", "/board/paging/search/list");
			formObj.submit();
		});
	});
	
</script>

</body>
</html>