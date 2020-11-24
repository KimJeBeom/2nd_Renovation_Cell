<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 신청현황 > 과정개설 신청 현황확인 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<!--<div class="container-fluid">
					 <div class="row"> -->
						<div class="col-md-9 col-popup">
							<!-- 상단 버튼 -->
							<c:choose>
								<c:when test="${edoVo.cnfaYn eq 'Y'}">
									<button type="button" class="btn btn-default btn-toastr" style="float: right; vertical-align: bottom;" disabled>확인완료</button><br><br>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom;" onclick="updateCnfa(${edoVo.aplcId});">확인</button><br><br>
								</c:otherwise>
							</c:choose>
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 과정개설신청 상세내역 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>신청일시</th>
											<td class="txt-long" colspan="3">${edoVo.aplcTs }</td>
										</tr>
										<tr>
											<th>부서명</th>
											<td>${edoVo.brnm }</td>
											<th>직원명</th>
											<td>${edoVo.userNm }</td>
										</tr>
										<tr>
											<th>교육구분</th>
											<td>
												<c:choose>
													<c:when test="${edoVo.inbkEdctYn } eq 'Y'">행내</c:when>
													<c:when test="${edoVo.inbkEdctYn } eq 'N'">행외</c:when>
												</c:choose>
											</td>
											<th>교육기관</th>
											<td colspan="3">${edoVo.edinNm }</td>
										</tr>
										<tr>
											<th>교육명</th>
											<td colspan="3">${edoVo.edctNm }</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">${edoVo.edctCon }</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>${edoVo.edctSttgYmd } ~ ${edoVo.edctFnshYmd }</td>
											<th>신청기간</th>
											<td>${edoVo.aplcSttgYmd } ~ ${edoVo.aplcFnshYmd }</td>
										</tr>
										<tr>
											<th>교육시간</th>
											<td>${edoVo.edctSttgTim } ~ ${edoVo.edctFnshTim }</td>
											<th>교육비용</th>
											<td>${edoVo.edex }원</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>
												<c:choose>
													<c:when test="${edoVo.onlEdctYn } eq 'Y'">온라인</c:when>
													<c:when test="${edoVo.onlEdctYn } eq 'N'">오프라인</c:when>
												</c:choose>
											</td>
											<th>교육수준</th>
											<td>${edoVo.edctLevl }</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td class="txt-long" colspan="3">${edoVo.apndDat }</td>
										</tr>
									</tbody>
								</table>
							</div>
							</div>
						</div>
					<!-- </div> 
				</div>-->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

<script type="text/javascript">	
		
		// 확인처리
		function updateCnfa(aplcId) {	
			if (confirm("확인하시겠습니까?") == true){
				$.ajax({
			    	url:"/itep/views/admin/pop/newEduInfoPopUpdateCnfa", //데이터를  넘겨줄 링크 설정
			        type:"POST", // post 방식
					data: {"aplcId" : aplcId}, //넘겨줄 데이터
					
					success: function (responseData) {
						if(responseData == 1) {
			        		window.close();
			        		//window.returnValue ="JobStart";
			        		//$(opener.document).find("#serchEdo").click();
			        		window.opener.searchEdo();
			        	} else {
			        		confirm("실패하였습니다. 다시 시도해주십시오."); // 결과가 1이 아니면 승인 실패
			        		window.close();
			        	}
					},
					error: function (xhr, status, error) { alert("통신실패"); }
				});
			} else {
				return false;
			}
		}
	</script>


