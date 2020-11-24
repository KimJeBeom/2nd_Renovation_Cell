<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">
								<button type="button" class="btn btn-primary btn-toastr btn-top">차수완료</button>
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
								<h4 style="float: left;">교육신청 직원목록</h4>
								<button type="button" class="btn btn-primary btn-toastr btn-top">엑셀 다운로드</button>

								<table class="table table-bordered tbl-type2">
									<thead>
										<tr>
											<th>No</th>
											<th>부서</th>
											<th>직원번호</th>
											<th>직원명</th>
											<th style="width:50px;">수료</th>
											<th style="width:50px;">미수료</th>
										</tr>
									</thead>
									<c:if test="${eduEmpList[0].edctAplcId ne ''}">
									<tbody id="eduEmpListTBody" style="vertical-align: center;">
										<c:forEach items="${eduEmpList }" var="eduemplist" varStatus="status">
											<tr data-toggle="tab" data-target="#table">
												<td>${status.count }</td>
												<td>${eduemplist.brnm }</td>
												<td>${eduemplist.userId }</td>
												<td>${eduemplist.userNm }</td>
												<td>
													<label class="fancy-radio" style="margin-bottom:0px;">
														<input name="ctcr${status.count }" value="y" type="radio" 
															<c:if test="${eduemplist.ctcrYn eq 'Y'}">checked</c:if>/>
														<span><i style="margin-right:0"></i></span>										
													</label>
												</td>
												<td>
													<label class="fancy-radio" style="margin-bottom:0px;">
														<input name="ctcr${status.count }" value="n" type="radio" 
															<c:if test="${eduemplist.ctcrYn eq 'N'}">checked</c:if>/>
														<span><i style="margin-right:0"></i></span>	
													</label>
												</td>
											</tr>
										</c:forEach> 
									</tbody>
									</c:if>
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

