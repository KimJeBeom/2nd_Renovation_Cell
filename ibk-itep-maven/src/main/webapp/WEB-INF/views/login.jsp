<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>

</head>
<body onload='document.f.user_id.focus();'>
	<h3>Login with Username and Password</h3>
	<form name='f' action='/itep/j_spring_security_check' method='POST'>
		<table>
			<tr>
				<td>User:</td>
				<td><input id type='text' name='user_id' value='${userId}'></td>
			</tr>
			<tr>
				<td colspan='2'><input id='submit' name="submit" type="submit"
					value="Login" /></td>
			</tr>
		</table>
	</form>
<!-- Javascript -->
<script src="/itep/assets/vendor/jquery/jquery.min.js"></script>
<script>
window.onload = function() {
	var userId = $('input[name=user_id]').val();
	if(userId !=''){
		 document.getElementById("submit").click();
	}
	else{
		alert("직원번호를 입력해주세요");
		return;	
	}
}
</script>
</body>
</html>