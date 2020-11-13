<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 등록 및 수정 > 교육 차수 추가 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>교육 차수 추가</b></h3>
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
								<div class="panel-body panel-popup">

									<h4 style="float: left;"><b>차수</b></h4>
									
									<!-- 상단 버튼 -->
									<button type="button" class="btn btn-primary btn-toastr btn-top">삭제</button>

									<!-- 교육별 차수안내 테이블 (TOGGLE) -->
									<table class="table table-hover tbl-type2">
										<thead>
											<tr>
												<th>No</th>
												<th style="width: 50%;">학습기간</th>
												<th>교육기간</th>
											</tr>
										</thead>
										<tbody>
											<tr data-toggle="tab" data-target="#table1">
												<td>1</td>
												<td>20191101 ~ 20191130</td>
												<td>30일</td>
											</tr>
											<tr data-toggle="tab" data-target="#table2">
												<td>2</td>
												<td>20191201 ~ 20191231</td>
												<td>30일</td>
											</tr>
											<tr data-toggle="tab" data-target="#table3">
												<td>3</td>
												<td>20200101 ~ 20200131</td>
												<td>30일</td>
											</tr>
										</tbody>
									</table>
									<br>

									<h4 style="float: left;"><b>차수 추가</b></h4>
									<button type="button" class="btn btn-primary btn-toastr btn-top">등록/수정</button>
									<br><br>

									<!-- 차수추가 포맷 및 위의 차수별 상세내용(TOGGLE) -->
									<div class="tab-content">
										<!-- 테이블 1 -->
										<div class="tab-pane fade in active" id="table1" style="padding: 5px 5px;">
											<div class="table-responsive">
												<!-- 교육 안내 테이블 -->
												<table class="table table-bordered tbl-type1">
													<tbody>	
														<tr>
															<th>과목명</th>
															<td colspan="3">
																<input type="text" class="form-control" placeholder="IT Governance 핵심 이해" readonly onfocus="this.blur();">
															</td>
														</tr>
														<tr>
															<th>신청기간</th>
															<td>
																<input type="text" class="form-control" placeholder="20191201">
																<input type="text" class="form-control" placeholder="20191231">
															</td>
															<th>취소기간</th>
															<td>
																<input type="text" class="form-control" placeholder="20191201">
																<input type="text" class="form-control" placeholder="20191231">
															</td>
														</tr>
														<tr>
															<th>학습기간</th>
															<td>
																<input type="text" class="form-control" placeholder="20200101">
																<input type="text" class="form-control" placeholder="20200105">
															</td>
															<th>학습시간</th>
															<td>
																<input type="text" class="form-control" placeholder="09:00">
																<input type="text" class="form-control" placeholder="17:00">
															</td>
														</tr>
														<tr>
															<th>이수시간</th>
															<td><input type="text" class="form-control" placeholder="35시간"></td>
															<th>교육기간</th>
															<td><input type="text" class="form-control" placeholder="5일"></td>
														</tr>
														<tr>
															<th>교육비용</th>
															<td><input type="text" class="form-control" placeholder="350,000원"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>	

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

