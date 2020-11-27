<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>엑셀 업로드</b></h3>
					
					<form action="/itep/views/admin/EmpAccMngExcelUp" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>
									<input type="hidden" id="ebrcd" name="brcd" value="">
									<input type="hidden" id="euserIdNm" name="userIdNm" value="">
									<input type="hidden" id="eathrCd" name="athrCd" value="">
									<input type="file" name="file">
								
								</td>
								<td>
									<div style="margin-left:10px; width:30px;">
										<input type="submit" class="btn btn-primary" value="업로드" />
									</div>
								</td>
							</tr>
						</table>
					</form>
					<br><br>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
