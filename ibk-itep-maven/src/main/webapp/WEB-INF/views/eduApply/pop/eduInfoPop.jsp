<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
								<!-- 교육 안내 테이블 -->
								<table class="table table-bordered tbl-type1">
									<div style="text-align:left; padding-bottom: 10px;">
										<b >* 결재요청시 부서 관리자(기획팀장/기획서무 책임자)에게 전달 됩니다.</b>
										<button style="text-align:right;" type="button" class="btn btn-default btn-toastr"><b>결재요청</b></button>
									</div>
									<tbody>
										<tr>
											<th>교육분류</th>
											<td>외부교육</td>
											<th>결재대상</th>
											<td>대상외</td>
										</tr>
										<tr>
											<th>과목명</th>
											<td colspan="3">Java Programming 핵심</td>
										</tr>
										<tr>
											<th>교육기관</th>
											<td>멀티캠퍼스</td>
											<th>교육방식</th>
											<td>오프라인</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>2020-02-01 ~ 2020-02-05</td>
											<th>교육수준</th>
											<td>중급</td>
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

