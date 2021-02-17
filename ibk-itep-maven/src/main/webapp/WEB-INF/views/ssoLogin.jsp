<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.initech.eam.nls.CookieManager"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="/text/html; charset=utf-8">
	<title>userSelfCheck</title>
</head>
<body>
<%
	CookieManager.setEncStatus(true);
	
	String encTicket = (String) request.getParameter("ticket");
	
	if (encTicket != null) {
		encTicket = URLDecoder.decode(encTicket);
	}else{
		encTicket = "";
	}
	
	int firstIndex   = encTicket.indexOf("&&");
	
	String encTicket2  = encTicket.substring(0, firstIndex);
	String hmac = encTicket.substring(firstIndex + 2);
	//인증티켓과 hmac 값 추출
	
	List res = null;
	String userid=null;
	
	boolean decSuccess=false;
	
	try {
		res = CookieManager.readClientTicket(encTicket2, hmac);
		//인증티켓 유효성 검증
	
		userid = (String) res.get(0);
		//업무인증ID 추출
	
		session.setAttribute("SSOID",userid);			//업무인증ID를 세션에 추가
		decSuccess=true;
			System.out.println(userid);
		
	} catch (Exception e) {
	
			System.out.println(e);
		decSuccess=false;
	}
%>
<!-- NC클라이언트 오브젝트 ID -->
<OBJECT ID="NEXESS_API" CLASSID="CLSID:D4F62B67-8BA3-4A8D-94F6-777A015DB612" width=0 height=0></OBJECT>

<form action="/itep/login" name="form" method="post">
	<input type="hidden" name="userId" value="<%=userid%>">
	<script>document.form.submit();</script>
</form>

<!-- 
<script language="javascript">
	id = "<%=userid%>";
	//alert(id+"/"+NEXESS_API.GetExtentionalField(id,"name")+"/"+NEXESS_API.GetExtentionalField(id,"branchname"));
	self.location.replace("http://localhost:8090/itep/login?userId="+id);
</script>
 -->
 
</body>
</html>
