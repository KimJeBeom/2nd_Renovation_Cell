<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	교육 신청 > 교육 목록 > 교육 안내 및 신청 팝업
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
								<!--<div style="text-align:left; padding-bottom: 10px;">-->
								<table>
									<tbody>
										<tr>
											<td style="width: 80%; padding-left: 5px; text-align: left; padding-bottom: 10px;">
												<b>* 결재요청시 부서 관리자(기획팀장/기획서무 책임자)에게 전달 됩니다.</b>
											</td>
											
											<td style="width: 10%; padding-left: 5px; text-align: right; padding-bottom: 10px;">
												<c:choose>
													<c:when test="${modType eq 'insert'} or ${eginAplyYn eq 'Y'} ">
														<button style="text-align:right;" type="button" class="btn btn-primary btn-toastr">결재요청</button>	 
													</c:when>
													<c:when test="${modType eq 'update'}">
														<button style="text-align:right;" type="button" class="btn btn-primary btn-toastr">재요청</button>	 
													</c:when>
													<c:when test="${modType eq 'delete'}">
														<button style="text-align:right;" type="button" class="btn btn-primary btn-toastr">삭제</button>	 
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>											
											</td>
											
										</tr>
									</tbody>
								</table>
								<!-- 교육 안내 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>교육분류</th>
							   				<td>${vo.edctClsfNm}</td>
											<th>결재대상</th>
											<c:choose>
												<c:when test="${vo.eginAplyYn eq 'Y'}">
													<td>결재대상</td>	 
												</c:when>
												<c:otherwise>
													<td>대상외</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<th>과목명</th>
							   				<td colspan="3">${vo.edctNm}</td>
										</tr>
										<tr>
											<th>교육기관</th>
							   				<td>${vo.edinNm}</td>
											<th>교육방식</th>
							   				<td>${vo.edctTrm}일</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>2020-02-01 ~ 2020-02-05</td>
											<th>교육수준</th>
							   				<td>${vo.edctLevl}</td>
										</tr>
										<tr>
										   <th>첨부파일</th>
										   <td colspan="3">
												<input multiple="multiple" type="file" name="file" class="form-control" value="">
										   </td>
										</tr>
									</tbody>
								</table>
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

