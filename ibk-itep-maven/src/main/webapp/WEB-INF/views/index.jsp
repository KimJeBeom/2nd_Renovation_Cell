<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>ticket</title>
	</head>

	<body>
	<script language="javascript">
	function activex_error(){
		alert("업무인증 Client 프로그램이 설치되어 있지 않습니다. 업무인증 Client 프로그램 설치->업무인증 로그인 후 다시 시도하여 주십시오. 프로그램 수동 설치 화면으로 이동합니다.");
		self.location.replace("http://sso.ibk.co.kr/nls3/NCInstall.html");
	}	
	</script>
	
	<!-- NC클라이언트 오브젝트 ID-->
	<OBJECT ID="NEXESS_API" CLASSID="CLSID:D4F62B67-8BA3-4A8D-94F6-777A015DB612" onError="activex_error();" width=0 height=0></OBJECT> 
	
	<script language="javascript">
	//업무인증 Ticket 추출 및 APP_ID 접근 이력 업데이트
	var ticket = NEXESS_API.GetTicketAppWithEnc("IEPIEP001");

	//NC 클라이언트에서 인증 정보를 가져옴
	//응답코드 성공: 인증티켓, 실패: 2: 로그인 전 상태, 3: 중복 로그인, 4: 권한이 없음

	if(ticket.length==1){
		if(ticket==2 ){
			alert("업무인증 시스템에 로그인 되어 있지 않습니다. 업무인증 로그인 후 재 접속하여 주십시오.");
		}else if(ticket==3 ){
			alert("업무인증 로그인 정보가 유효하지 않습니다. 업무인증 로그인 후 재 접속하여 주십시오.");
		}else if(ticket==4 ){
			alert("업무인증 연동 로그인 권한이 없습니다.");
		}else {
		}

	}else{
		while(ticket.indexOf("+") != -1) {
				ticket= ticket.replace("+", "%2b");
		}
		/*login.jsp 이동 */
		self.location.replace("/itep/ssoLogin?ticket=" + escape(ticket));
	}

	</script>
	</body>

</html>
