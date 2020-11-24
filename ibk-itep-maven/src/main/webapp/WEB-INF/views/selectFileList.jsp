<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">

		var fileNoArry = new Array();

 		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#file_no").attr("value", fileNo);
			formObj.attr("action", "/itep/views/cmm/fileDownload");
			formObj.submit();
		}
		
 		function fn_del(file_no){
 			fileNoArry.push(file_no);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			});
 			alert(fileNoArry);
 		}
 		
 		function fn_fileUpdate(){
 			var formObj = $("form[name='updateForm']");
			formObj.submit();
		}
 		
	</script>
	
	<body>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
				
				<div>
<%-- 					<button type="button" class="update_btn">업데이트</button>	
 --%>					<button onclick="fn_fileUpdate()" type="button">업데이트</button>	
				</div>
		
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/itep/updateFile" enctype="multipart/form-data">
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<br> <label>file:</label> <input type="file" name="file1" multiple>
				</form>
				
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="file_no" name="file_no" value=""> 
				</form>
				
				<span>파일 목록</span>
					<c:forEach items="${fileVoList}" var="file">
						<c:if test="${file.del_yn == 'N'}">
							<div class="form-group" style="border: 1px solid #dbdbdb;">
								<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)
								<button id="fileDel" onclick="fn_del('${file.file_no}');" type="button">삭제</button><br>
							</div>
						</c:if>
					</c:forEach>
				<hr>
			</section>
			<hr />
		</div>
	</body>
</html>