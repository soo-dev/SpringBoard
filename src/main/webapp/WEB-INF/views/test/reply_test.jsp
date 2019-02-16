<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ page contentType="text/html; charset=UTF-8"%>
<html>

<%@ include file="../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../include/main_header.jsp"%>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                AJAX 댓글 테스트 페이지
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> reply test</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">

            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">댓글 작성</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="newReplyText">댓글 내용</label>
                            <input class="form-control" id="newReplyText" name="replytext" placeholder="댓글 내용을 입력해주세요">
                        </div>
                        <div class="form-group">
                            <label for="newReplyWriter">댓글 작성자</label>
                            <input class="form-control" id="newReplyWriter" name="replyer" placeholder="댓글 작성자를 입력해주세요">
                        </div>
                        <div class="pull-right">
                            <button type="button" id="replyAddBtn" class="btn btn-primary"><i class="fa fa-save"></i> 댓글 저장</button>
                        </div>
                    </div>
                    <div class="box-footer">
                        <ul id="replies">

                        </ul>
                    </div>
                    <div class="box-footer">
                        <div class="text-center">
                            <ul class="pagination pagination-sm no-margin">

                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modifyModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">댓글 수정창</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="rno">댓글 번호</label>
                                <input class="form-control" id="rno" name="rno" readonly>
                            </div>
                            <div class="form-group">
                                <label for="replytext">댓글 내용</label>
                                <input class="form-control" id="replytext" name="replytext" placeholder="댓글 내용을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label for="replyer">댓글 작성자</label>
                                <input class="form-control" id="replyer" name="replyer" readonly>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-success modalModBtn">수정</button>
                            <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->
<%@ include file="../include/plugin_js.jsp"%>
<script>

	var b_no=3003;
	var replyPageNum =10;
	
	//getReplies();
	getRepliesPaging(replyPageNum);
	
	
	function getReplies() {
		
		$.getJSON("/replies/all/" + b_no, function(data) {
			
			console.log(data);
			
			var str="";
			
			$(data).each(function (){
				str += "<li data-rno='" + this.rno + "' class='replyLi'>"
					+ "<p class='replytext'>" + this.replytext + "</p>"
					+ "<p class='replyer'>" + this.replyer + "</p>"
					+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
					+ "</li>"
					+ "<hr />";
			});
			
			$("#replies").html(str);
			
			
		});
	}
	 
	$("#replyAddBtn").on("click", function() {
		
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();

		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_no : b_no,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'success') {
					alert("등록 되었습니다.");
					//getReplies();
					 getRepliesPaging(replyPageNum);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	$("#replies").on("click", ".replyLi button", function() {
		
		var reply = $(this).parent();
		var rno = reply.attr("data-rno");
		var replytext = reply.find(".replytext").text();
		var replyer = reply.find(".replyer").text();
		
		$("#rno").val(rno);
		$("#replytext").val(replytext);
		$("#replyer").val(replyer);
	});
	
	$(".modalModBtn").on("click", function() {
		// 댓글 선택자
		var reply = $(this).parent().parent();
		// 댓글 번호
		var rno = reply.find("#rno").val();
		var replytext = reply.find("#replytext").val();
		
		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'success') {
					alert("수정 되었습니다.");
					/* $("#modifyModal").modal("hide"); */ // modal 닫기
					//getReplies();	// 댓글 목록 갱신
					 getRepliesPaging(replyPageNum);
				}
			}
		});
	});
	
	$(".modalDelBtn").on("click", function() {
	
		// 댓글 번호
		var rno = $(this).parent().parent().find("#rno").val();

		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'success') {
					alert("삭제 되었습니다.");
					$("#modifyModal").modal("hide");  // modal 닫기
					// getReplies();	// 댓글 목록 갱신
					 getRepliesPaging(replyPageNum);
				}
			}
		});
	});

	// 댓글 목록 페이징 함수
	 function getRepliesPaging(page) {
	
		 $.getJSON("/replies/"+ b_no +"/"+  page, function(data) {
	        	console.log(data.list);
				
				var str="";
				
				$(data.list).each(function (){
					str += "<li data-rno='" + this.rno + "' class='replyLi'>"
						+ "<p class='replytext'>" + this.replytext + "</p>"
						+ "<p class='replyer'>" + this.replyer + "</p>"
						+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
						+ "</li>"
						+ "<hr />";
				});
				
				$("#replies").html(str);
				
				 printPageNumbers(data.pageMaker);
			});
	
	    }
	

	function printPageNumbers(pageMaker) {
		
		var str ="";
		
		if(pageMaker.prev) {
			str += "<li><a href='"+(pageMaker.startPage-1) + "'>이전</a></li>";
		}
		
		//페이지 번호
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i<=len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li " + strClass + "><a href = '"+i+"'>" +i+"</a></li>";
		}
		
		if(pageMaker.next) {
			str += "<li><a href='"+(pageMaker.endPage+1) + "'>다음</a></li>";
		}
		
		$(".pagination-sm").html(str);
	}
	
	
	
	// 목록 페이지 번호 클릭 이벤트
	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
        replyPageNum = $(this).attr("href");
        getRepliesPaging(replyPageNum); // 목록 페이지 호출
	});
	
</script>
</body>
</html>