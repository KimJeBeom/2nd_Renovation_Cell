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
									<c:if test="${eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM' }">
										<tr>
											<td style="width: 80%; padding-left: 5px; text-align: left; padding-bottom: 10px;">
												<b>* 결재요청시 부서 관리자(기획팀장/기획서무 책임자)에게 전달 됩니다.</b>
											</td>
											<td style="width: 10%; padding-left: 5px; text-align: right; padding-bottom: 10px;">	
												<button style="text-align:right;" type="button" class="btn btn-primary btn-toastr" onclick ="reApply(${eduInfoPop.edctAplcId});">결재요청</button><br>
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
										<tr>
										   <th>첨부파일</th>
									<c:choose>
									<c:when test="${eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM' }">
										   <td colspan="3">
												<input multiple="multiple" type="file" name="file" class="form-control" value="">
										   </td>
								    </c:when>
								    <c:otherwise>
								    		<td colspan="3">${eduInfoPop.apndDat } </td>
								    </c:otherwise>
									</c:choose>
										</tr>
									</tbody>
								</table>
								<c:if test="${eduInfoPop.aplcStgCd == 'REJDPM' || eduInfoPop.aplcStgCd == 'REJGRM' }">
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

<script type="text/javascript">

		function reApply(edctAplcId) {
			
	    $.ajax({
	    	url:"/itep/views/myClass/pop/eduInfoPop/reApply", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터
			
			success: function (responseData) {						

				opener.parent.location.reload();
				window.close();

			},
			error: function (xhr, status, error) {
			}
	    });
	}

</script>
