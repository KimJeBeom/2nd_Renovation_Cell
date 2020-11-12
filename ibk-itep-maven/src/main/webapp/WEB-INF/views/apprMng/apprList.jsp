<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 결재할 문서
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">

		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle"><img src="/itep/assets/itep/img/icon/apprmng-icon-big.png" height="36px" ></div>
						<div style="display: table-cell; vertical-align: middle"><h1 class="page-title" style="vertical-align: middle;">&nbsp;&nbsp;<b>결재 할 문서</b></h1></div>						 	
					</div>
					<div class="row">
					
						<div id="toastr-demo" class="panel">
						
							<!-- 결재 목록 -->
							<div class="panel-body">
								<h4 class="panel-title" style="float:left;"><b>▶ 결재 목록</b></h4>
								
								<!-- 상단 버튼 -->
								<button type="button" class="btn btn-primary btn-toastr btn-top" onclick="showPopup('apprMng','apprRejectPop');">반려</button>
								<button type="button" class="btn btn-primary btn-toastr btn-top" data-context="info" data-message="승인되었습니다." data-position="top-center">승인</button>
							
								<!-- 결재 목록 테이블 (TOGGLE 적용)-->
								<table class="table table-hover tbl-type2">
									<thead>
										<tr>
											<th>
												<label class="fancy-checkbox" onclick="event.cancelBubble=true">
													<input type="checkbox" name="checkAll"><span></span>
												</label>
											</th>
											<th style="width: 10px;">NO</th>
											<th>부서명</th>
											<th>직원명</th>
											<th style="width: 200px;">신청교육</th>
											<th>신청일자</th>
										</tr>
									</thead>
									<tbody>
										<!-- 컨트롤러에서 가져온 리스트에서 VO 하나씩 꺼내서 출력 -->
										<c:forEach items="${apprList }" var="apprlist">
											<tr data-toggle="tab" data-target="#table" onclick="showDetail(${apprlist.edctAplcId })">
												<td>
													<label class="fancy-checkbox" onclick="event.cancelBubble=true">
														<input type="checkbox" name="checkbox"><span></span>
													</label>
												</td>
												<td>${apprlist.rowNum }</td>
												<td>${apprlist.brnm }</td>
												<td>${apprlist.userNm }</td>
												<td>${apprlist.edctNm }</td>
												<td>${apprlist.aplcTs }</td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
								
								<br>
								
								<!-- apprList가 하나도 없으면 apprDetail == null (Controller에서 지정) -->
								<!-- apprDetail 이 not null일 때만 아래 화면 보여줌 -->
								<c:if test="${not empty apprDetail}">
									<!-- 위의 결재항목별 교육상세설명 테이블 (TOGGLE 적용) -->
									<div id="tab-content" class="tab-content">
										<!-- 테이블 1 -->
										<div class="tab-pane fade in active" id="table">
											<div class="table-responsive">
												<table class="table tbl-type1">
													<tbody>
														<tr>
															<th>과목명</th>
															<td colspan="3" id="edctNm">${apprDetail.edctNm }</td>
														</tr>
														<tr>
															<th>교육내용</th>
															<td class="txt-long" colspan="3" id="edctCon"><br>${apprDetail.edctCon }<br><br></td>
														</tr>
														<tr>
															<th>교육기관</th>
															<td colspan="3" id="edinNm">${apprDetail.edinNm }</td>
														</tr>
														<tr>
															<th>교육방식</th>
															<td id="onlEdctYn">${apprDetail.onlEdctYn }</td>
															<th>교육수준</th>
															<td id="edctLevl">${apprDetail.edctLevl }</td>
														</tr>
														<tr>
															<th>학습기간</th>
															<td id="edctYmd">${apprDetail.edctSttgYmd } ~ ${apprDetail.edctFnshYmd}</td>
															<th>신청기간</th>
															<td id="aplcYmd">${apprDetail.aplcSttgYmd } ~ ${apprDetail.aplcFnshYmd}</td>
														</tr>
														<tr>
															<th>제출파일</th>
															<td colspan="3" id="apndDat">${apprDetail.apndDat }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>																	
								</c:if>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->
	
	<script type="text/javascript">
	
		// 결재건 클릭 시 상세내역 동적변경을 위한 함수
		function showDetail(edctAplcId) {
		    $.ajax({
		    	url:"/itep/views/apprMng/apprListDetail", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터
				
				success: function (responseData) {						
					// apprDetail 결과값을 테이블에 동적으로 반영
					$('#edctNm').html(responseData.edctNm);
					$('#edctCon').html('<br>'+responseData.edctCon+'<br><br>');
					$('#edctLevl').html(responseData.edctLevl);
					$('#onlEdctYn').html(responseData.onlEdctYn);
					$('#edctYmd').html(responseData.edctSttgYmd+' ~ '+responseData.edctFnshYmd);
					$('#aplcYmd').html(responseData.aplcSttgYmd+' ~ '+responseData.aplcFnshYmd);
					$('#apndDat').html(responseData.apndDat);
				},
				error: function (xhr, status, error) {
					
				}
			});
		}		
	</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />