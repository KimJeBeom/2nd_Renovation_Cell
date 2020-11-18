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
				<td><input type='text' name='user_id' value=''></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="Login" /></td>
			</tr>
		</table>
	</form>
</body>
</html>