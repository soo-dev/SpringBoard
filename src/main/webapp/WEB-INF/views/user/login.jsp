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
         <a href="${path}/board/paging/search/list">
            <b>Sooyoung's</b><br /> MVC-BOARD
        </a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">로그인 페이지</p>

        <form action="${path}/user/loginPost" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="user_id" class="form-control" placeholder="아이디">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            
            <div class="form-group has-feedback">
                <input type="password" name="user_pw" class="form-control" placeholder="비밀번호">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
           
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="useCookie"> 로그인 유지
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">
                    	<i class="fa fa-sign-in"></i>로그인</button>
                </div>
            </div>
        </form>
<!-- 
        <a href="/user/findId">아이디 찾기</a><br />
		<a href="/user/findPW">비밀번호 찾기</a><br /> -->
        <a href="${path}/user/register" class="text-center">회원가입</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script>

	var msg ="${msg}";
	if(msg === "REGISTERED") {
		alert("회원가입이 완료되었습니다. 로그인 해주세요!");
	} else if(msg === "FAILED") {
		alert("아이디와 비밀번호를 확인해주세요.")
	}

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
