<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 신청현황 > 교육신청 직원목록
-->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="col-md-9 col-popup">
					<div class="panel panel-headline">
						<div class="panel-body panel-popup">
							<button type="button" class="btn btn-primary btn-toastr btn-top"
								onclick="finEduCnt(${eduEmpList[0].edctCntId });">차수완료</button>
								
							<!-- 교육 내용 테이블 -->
							<table class="table table-bordered tbl-type1">
								<tbody>
									<tr>
										<th>과목명</th>
										<td colspan="3">${eduEmpList[0].edctNm }</td>
									</tr>
									<tr>
										<th>교육내용</th>
										<td class="txt-long" colspan="3" style="text-align: center;">${eduEmpList[0].edctCon }</td>
									</tr>
									<tr>
										<th>교육기간</th>
										<td colspan="3">${eduEmpList[0].edctSttgYmd } ~ ${eduEmpList[0].edctFnshYmd }</td>
									</tr>
								</tbody>
							</table>

							<!-- 교육신청 직원목록 -->
							<div class="panel-body" style="padding:0px;">
								<h4 style="float:left; margin:10px 0px 0px;">교육신청 직원목록</h4>
								<form action="/itep/views/admin/pop/EduEmpListPopExcelDown" role="form" method="post" enctype="multipart/form-data">
									<input type="hidden" id="edctCntId" name="edctCntId" value="${eduEmpList[0].edctCntId }">
									<input type="submit" class="btn btn-primary btn-toastr btn-top" style="float:right;" value="엑셀 다운로드" />
								</form>
							</div>
							
							<div class="panel-body" style="overflow-x:hidden; height:300px; padding:0px;">
							<table class="table table-bordered tbl-type2">
								<thead>
									<tr>
										<th>No</th>
										<th>부서</th>
										<th>직원번호</th>
										<th>직원명</th>
										<th style="width: 50px;">수료</th>
										<th style="width: 50px;">미수료</th>
									</tr>
								</thead>
								<tbody id="eduEmpListTBody" style="vertical-align: center;">
									<c:choose>
										<c:when test="${eduEmpList[0].edctAplcId ne '' && eduEmpList[0].edctAplcId ne null}">
											<c:forEach items="${eduEmpList }" var="eduemplist" varStatus="status">
												<tr>
													<td>${status.count }</td>
													<td>${eduemplist.brnm }</td>
													<td>${eduemplist.userId }</td>
													<td>${eduemplist.userNm }</td>
													<td>
														<label class="fancy-radio" style="margin-bottom: 0px;"> 
															<input name="ctcr${status.count }" value="Y" type="radio"
																<c:if test="${eduemplist.ctcrYn eq 'Y'}">checked</c:if> />
															<span><i style="margin-right: 0"></i></span>
														</label>
													</td>
													<td>
														<label class="fancy-radio" style="margin-bottom: 0px;"> 
															<input name="ctcr${status.count }" value="N" type="radio"
																<c:if test="${eduemplist.ctcrYn eq 'N'}">checked</c:if> />
															<span><i style="margin-right: 0"></i></span>
														</label>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr height="100">
												<td colspan="6" class="txt_center"><h4>신청한 직원이 없습니다.</h4></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

	<script>
	function finEduCnt(edctCntId) {
		var radioLength = $('input[name^="ctcr"]').length / 2; // 총 라디오버튼 개수
		var radioChecked = $('input[name^="ctcr"]:checked').length; // 선택된 라디오버튼 개수
		
		if(radioLength != radioChecked) { // 선택 안된 라디오버튼이 있으면 수료여부 안내
			alert("수료여부를 선택해주세요.");
			return false;
		} else {

			if (confirm("차수완료 및 수료여부 등록을 하시겠습니까?") == true){
				// {edctCntId:차수번호, 신청서번호:수료여부, 신청서번호:수료여부 ...} 형태로 데이터 넘겨줌
				var data = {};
				data["edctCntId"] = edctCntId;
				<c:forEach items="${eduEmpList }" var="eduemplist" varStatus="status">
					data["${eduemplist.edctAplcId}"] = $('input[name="ctcr${status.count}"]:checked').val();
				</c:forEach>			
				
				$.ajax({
			    	url:"/itep/views/admin/pop/eduEmpListPopFinEduCnt", //데이터를  넘겨줄 링크 설정
			        type:"POST", // post 방식
					data: JSON.stringify(data), //넘겨줄 데이터
					dataType: "json",
				    contentType:"application/json",
					
					success: function (responseData) {
		        		if(responseData == 1) {
							alert("완료되었습니다.");
			        		window.close();
			        		window.opener.searchEduReadyStat();
			        	} else {
			        		confirm("실패하였습니다. 다시 시도해주십시오."); 
			        		window.close();
			        	}
					},
					error: function (xhr, status, error) { alert("통신실패"); }
				}); 
			} else {
				return false;
			}
		}
	}
</script>