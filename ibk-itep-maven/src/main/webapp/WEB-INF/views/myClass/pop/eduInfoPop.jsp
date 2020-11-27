<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	내학습실 > 신청상세확인
-->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>교육 신청</b></h3>
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">
								<table>
									<tbody>
									<c:if test="${modType != 'history' && (eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM') }">
										<tr>
											<td style="width: 10%;"></td>
											<td style="width: 20%; padding-left: 30px; text-align: center; padding-bottom: 10px;"><b>▶부서 결재자</b></td>
											<td style="width: 30%; padding-bottom: 10px;">
												<div>
													<select class="form-control" id="dpmAthzId">
													<c:forEach items="${dpmList}" var="dpmList">
														<option value="${dpmList.userId}">${dpmList.brnm} ${dpmList.userNm}</option>
													</c:forEach>
													</select>
												</div>
											</td>
											<td style="width: 10%; padding-left: 5px; padding-left: 20px; text-align: right; padding-bottom: 10px;">	
												<button style="text-align:right;" type="button" class="btn btn-primary" onclick ="reApply(${eduInfoPop.edctAplcId});">결재요청</button><br>
											</td>
										</tr>
									</c:if>
									</tbody>
								</table>
								<!-- 교육 안내 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>교육분류</th>
											<td>${eduInfoPop.edctClsfNm}</td>
											<th>결재대상</th>
											<td>${eduInfoPop.snctTgtYn }</td>
										</tr>
										<tr>
											<th>과목명</th>
											<td colspan="3">${eduInfoPop.edctNm }</td>
										</tr>
										<tr>
											<th>교육기관</th>
											<td>${eduInfoPop.edinNm }</td>
											<th>교육방식</th>
											<td>${eduInfoPop.onlEdctYn }</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>${eduInfoPop.edctSttgYmd } ~ ${eduInfoPop.edctFnshYmd }</td>
											<th>교육수준</th>
											<td>${eduInfoPop.edctLevl }</td>
										</tr>
									<c:choose>
									<c:when test="${modType != 'history' && (eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM') }">
																		<tr>
										   <th>첨부파일<br><button class="fileAdd_btn" type="button">파일추가</button></th>
										   <td colspan="3">
												<form name="writeForm"  id="applyForm" method="post" action="upload" enctype="multipart/form-data">
												<input type="text" name="code_nm" style="display:none" value="EDA">
												<input id="edctAplcId" type="text" name="pbns_id" style="display:none" value="${eduInfoPop.edctAplcId}">
												<c:forEach items="${fileVoList}" var="file">
													<c:if test="${file.del_yn == 'N'}">
														<div class="form-group" style="border: 1px solid #dbdbdb;">
															<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)
															<button id="fileDel" onclick="fn_del('${file.file_no}');" type="button">삭제</button><br>
														</div>
													</c:if>
												</c:forEach>
												<div id="fileIndex"></div>
												</form>
										   </td>
										</tr>
								    </c:when>
								    <c:otherwise>
								   		   <th>첨부파일</th>
								   		   <td colspan="3">
								    	<c:forEach items="${fileVoList}" var="file">
											<c:if test="${file.del_yn == 'N'}">
												<div class="form-group" style="border: 1px solid #dbdbdb;">
													<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)
												</div>
											</c:if>
										</c:forEach>
										</td>
								    </c:otherwise>
									</c:choose>
									</tbody>
								</table>
								<c:if test="${modType != 'history' && (eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM') }">
									<table>
										<tbody>
											<tr>
												<td style="width: 80%; padding-left: 5px; text-align: left; padding-bottom: 10px;">
													<font color="red"><b>* 반려된 신청건이므로 재결재요청 또는 취소신청을 하시기 바랍니다.</b></font>
												</td>
											</tr>
										</tbody>
									</table>
									<!-- 반려사유 확인 테이블 -->
									<table class="table table-bordered tbl-type1">
										<tbody>
											<tr>
											 	<th>반려사유</th>
												<td style="width: 80%;">${eduInfoPop.rtreCon }</td>
											</tr>
										</tbody>
									</table>
								</c:if>
							</div>
							</div>
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

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

		function reApply(edctAplcId) {
			
			var dpmAthzId = $("#dpmAthzId").val(); //부서결재자
			var edctAplcId = $("#edctAplcId").val();//결재번호

			var form = $('#applyForm')[0];
			var formData = new FormData(form);
			formData.append("dpmAthzId",dpmAthzId);
			formData.append("edctAplcId",edctAplcId);
			
				$.ajax({
			    	url:"/itep/views/myClass/eduInfoPop/reApply", //데이터를  넘겨줄 링크 설정
			        type:"POST", // post 방식
			        enctype: 'multipart/form-data',
			        processData: false,
					contentType: false,
					data: formData,
	
			        success: function (responseData) {	
			        	if(responseData == 1) {
			        		alert("결재요청 되었습니다."); // 결과가 1이면 정상적으로 반려처리 완료
			        		window.close();
				     		window.opener.location.reload();

			        	} else {
			        		alert("실패하였습니다. 히융 다시 시도해주십시오."); // 1이 아니면 승인 실패
			        		window.close();
				     		window.opener.location.reload();
			        	}
					},
					error: function (xhr, status, error) {
						alert("실패하였습니다. 다시 시도해주십시오."); // 1이 아니면 승인 실패
		        		window.close();
			     		window.opener.location.reload();
					}
			 	});
			}	


		$(document).ready(function(){
			fn_addFile();
		})
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float: left;width:90%;' name='file_"+(fileIndex++)+"'>"+"<button style='float: left' type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");	});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
</script>
