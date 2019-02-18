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
        <a href="/board/paging/search/list">
            <b>Sooyoung's</b><br /> MVC-BOARD
        </a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">아이디 검색결과</p>
        

				<div class="form-group has-feedback">
					<i>아이디 : <p>${ find_id.user_id }<p></i>
				<a href="/user/login"><button type="button" 
							class="btn btn-primary btn-block btn-flat">로그인</button></a>
				<a href="/user/findPW"><button type="button" 
							class="btn btn-primary btn-block btn-flat">비밀번호 찾기</button></a>	
				</div>

    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>
