<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 관리자>배치수행 -->
<body>
   <!-- WRAPPER -->
   <div id="wrapper">
	<!-- MAIN -->
	<div class="main">
	   <!-- MAIN CONTENT -->
	   <div class="main-content">
		  <div class="container-fluid">
			 <h3 class="page-title"><b>배치실행</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
				   <div class="panel-body panel-popup">
				   <!-- 작업수행을 위한 버튼 -->
					<div style="text-align:left; padding-bottom: 10px;">
						<button type="button" class="btn btn-primary" onclick="addUser();">직원배치수행</button>
						<button type="button" class="btn btn-primary" onclick="addBranch();">부서배치수행</button>
					</div>
					<textarea id ="result" class="form-control" style="width:100%; height: 200px;"></textarea>
				   </div>
				   </div>
				   <!-- END INPUTS -->
				</div>
			 </div>
		  </div>
	   </div>
	   <!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
 </div>
 <!-- END WRAPPER -->
 <!-- Javascript -->
 
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
 <script>
 //직원 배치 수행
 function addUser() {
        $.ajax({
	        url:"/itep/views/admin/pop/addUserBat", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식

	         success: function (responseData) {
	        	 var result = responseData.split("@@")
	        	 if(result[0] == "success"){
	        		 $('#result').val("[배치수행성공] =================\n"+result[1]);
        		 }else if(result[0] == "nofile"){
        			 $('#result').val("[READ파일 없음] =================\n"+result[1]);
        		 }else if(result[0] == "failed"){
        			 $('#result').val("[배치수행실패] =================\n"+result[1]);
        		 }else{
	        	 	$('#result').val("[ERROR] =================\n 전달값이 이상합니다.");
        		 }
	          },
	         error: function (xhr, status, error) {
    			 $('#result').val("[배치수행실패] =================\n"+result[1]);
	          }
		});
 } 
 //부서배치수행
 function addBranch() {
     $.ajax({
	        url:"/itep/views/admin/pop/addBranchBat", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식

	         success: function (responseData) {
	        	 var result = responseData.split("@@")
	        	 if(result[0] == "success"){
	        		 $('#result').val("[배치수행성공] =================\n"+result[1]);
     		 }else if(result[0] == "nofile"){
     			 $('#result').val("[READ파일 없음] =================\n"+result[1]);
     		 }else if(result[0] == "failed"){
     			 $('#result').val("[배치수행실패] =================\n"+result[1]);
     		 }else{
	        	 	$('#result').val("[ERROR] =================\n 전달값이 이상합니다.");
     		 }
	          },
	         error: function (xhr, status, error) {
 			 $('#result').val("[배치수행실패] =================\n"+result[1]);
	          }
		});
} 
   
</script>

