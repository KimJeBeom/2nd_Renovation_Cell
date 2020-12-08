<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>

<style>
	.flex-container{
	  width: 100%;
	  height: 80vh;
	  display: -webkit-box;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-align: center;
	      -ms-flex-align: center;
	          align-items: center;
	  -webkit-box-pack: center;
	      -ms-flex-pack: center;
	          justify-content: center;
	}
	.whiteBox {
	  width: 400px;
	  background: white;
	  text-align:center;
	  padding: 2em;
	  border-radius: 15px;
	}
	body{
		background-color:#2B333E
	}
</style>

</head>
<body onload='document.f.user_id.focus();'>
	<div><img class="logo-icon" src="/itep/assets/itep/img/itep-logo.png" /></div>
	<div class="flex-container">
	<c:choose>
		<c:when test="${show != null}">
			<!-- show파라미터가 있을경우 수동로그인화면 출력 -->
			 <div class="whiteBox" >
				<form name='f' action='/itep/j_spring_security_check' method='POST' style="margin: 0 auto;" >
					<table style="margin: 0 auto;" >
						<tr>
							<td style="text-align:center;" colspan='3'><h3>Login with Username and Password</h3></td>
						<tr>
							<td style="text-align:center;">UserId:</td>
							<td style="text-align:center;"><input type='text' name='user_id' value='${userId}'></td>
							<td style="text-align:center;"><input name="submit" type="submit"
								value="Login" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
		<c:when test="${userId == null}">
			<!-- userId없이 링크가 호출되었을 경우 로그인 실패 화면 출력 -->
			<div class="whiteBox">
				<img src='/itep/assets/itep/img/icon/failure.png' style='width:50px; height:auto; float: center'>
				<br>
				<h3>로그인 인증 실패<br>
				SSO설정 확인 후 재접속 바랍니다.</h3>
				<br>
				<button onclick="window.location.replace('/itep');"> 재접속 </button>
			</div>
		</c:when>
		<c:otherwise>
			<!-- show파라미터 없고 UserId가 있을경우 자동로그인 수행 -->
			 <div class="whiteBox"  style="display:none">
				<form name='f' action='/itep/j_spring_security_check' method='POST'>
					<input type='text' name='user_id' value='${userId}'>
					<input id='submit' name="submit" type="submit" value="Login" />
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
<!-- Javascript -->
<script src="/itep/assets/vendor/jquery/jquery.min.js"></script>
<script>
window.onload = function() {
	var userId = $('input[name=user_id]').val();
	if(userId != null){
		 document.getElementById("submit").click();
	}
}
</script>
</body>
</html>