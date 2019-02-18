<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${path}/">
            <b>Sooyoung's</b><br /> MVC-BOARD
        </a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">회원 정보 수정 페이지</p>
        <input type="hidden" name = "user_id" value="${ login.user_id }">

        <form action="${path}/user/infoPOST" method="post" id="myForm">
            <div class="form-group has-feedback">
                <p>아이디 </p><input type="text" name="user_id" class="form-control" value="${ login.user_id }" readonly="readonly">
                
            </div>
            <div class="form-group has-feedback">
                <p>닉네임 </p><input type="text" name="user_name" class="form-control" value="${ login.user_name }">
                               
            </div>
            <div class="form-group has-feedback">
                <p>이메일 </p><input type="email" name="user_email" class="form-control" value = "${ login.user_email }" readonly="readonly">
            </div>
            
            <div class="form-group has-feedback">
                <p>현재 비밀번호 </p><input type="password" id="pw" name="user_pw" class="form-control" placeholder="현재 비밀번호 입력">
            </div>
           
            <div class="form-group has-feedback">
                <p>수정된 비밀번호 </p><input type="password" id="pw" name="newUser_pw" class="form-control" placeholder="새 비밀번호 입력">
            </div>
           
          
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">수정</button>
                </div>
            </div>
        </form>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script>

	$(function() {
		if(${msg ne null}){
			alert('${msg}');
		};
		
		var pwObj = $("#pw");
		var pw = pwObj.val();
		if
	});
	
	$(document).ready(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>
