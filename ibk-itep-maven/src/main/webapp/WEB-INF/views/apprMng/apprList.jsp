<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h1 class="page-title" style="padding-top: 20px;"><b>결재 할 문서</b></h1>
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
											<th><input type="checkbox" name="checkAll"></th>
											<th style="width: 10%;">NO</th>
											<th>부서명</th>
											<th>직원명</th>
											<th style="width: 150px;">신청교육</th>
											<th>신청일자</th>
										</tr>
									</thead>
									<tbody>
										<tr data-toggle="tab" data-target="#table1">
											<td><input type="checkbox" name="checkbox"></td>
											<td>1</td>
											<td>IT금융개발부</td>
											<td>조기은</td>
											<td>R을 이용한 빅데이터 분석</td>
											<td>2020.01.02</td>
										</tr>
										<tr data-toggle="tab" data-target="#table2">
											<td><input type="checkbox" name="checkbox"></td>
											<td>2</td>
											<td>IT금융개발부</td>
											<td>박기은</td>
											<td>업무에 바로 쓰는 SQL 튜닝</td>
											<td>2020.01.06</td>
										</tr>
										<tr data-toggle="tab" data-target="#table3">
											<td><input type="checkbox" name="checkbox"></td>
											<td>3</td>
											<td>IT금융개발부</td>
											<td>정기은</td>
											<td>TenserFlow로 배우는 강화학습</td>
											<td>2020.01.15</td>
										</tr>
										<tr data-toggle="tab" data-target="#table4">
											<td><input type="checkbox" name="checkbox"></td>
											<td>4</td>
											<td>IT기획부</td>
											<td>김기은</td>
											<td>Java Programming 핵심</td>
											<td>2020.01.24</td>
										</tr>
									</tbody>
								</table>
								<br>
								
								<!-- 위의 결재항목별 교육상세설명 테이블 (TOGGLE 적용) -->
								<div class="tab-content">
									<!-- 테이블 1 -->
									<div class="tab-pane fade in active" id="table1">
										<div class="table-responsive">
											<table class="table tbl-type1">
												<tbody>
													<tr>
														<th>과목명</th>
														<td colspan="3">R을 이용한 빅데이터 분석</td>
													</tr>
													<tr>
														<th>교육내용</th>
														<td class="txt-long" colspan="3">
															<br>
															- R을 이용한 빅데이터 분석
															<br><br>
														</td>
													</tr>
													<tr>
														<th>교육기관</th>
														<td colspan="3">멀티캠퍼스</td>
													</tr>
													<tr>
														<th>교육방식</th>
														<td>오프라인</td>
														<th>교육수준</th>
														<td>중급</td>
													</tr>
													<tr>
														<th>학습기간</th>
														<td>20200201 ~ 20200205</td>
														<th>신청기간</th>
														<td>20200101 ~ 20200131</td>
													</tr>
													<tr>
														<th>제출파일</th>
														<td colspan="3"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- 테이블 2 -->
									<div class="tab-pane fade" id="table4">
										<div class="table-responsive">
											<table class="table tbl-type1">
												<tbody>
													<tr>
														<th>과목명</th>
														<td colspan="3">Java Programming 핵심</td>
													</tr>
													<tr>
														<th>교육내용</th>
														<td class="txt-long" colspan="3">
															<br>
															- 다형성과 Loose Coupling 개념을 개발기간 뿐만 아니라 유지보수 및 확장시 개발자가 어떻게
															적용할 수 있는지 학습합니다. <br>
															- 디자인 패턴 등 현장의 개발자에게 필요하지만 어려운 개념을 쉽고 구체적으로 접근합니다.
															<br><br>
														</td>
													</tr>
													<tr>
														<th>교육기관</th>
														<td colspan="3">멀티캠퍼스</td>
													</tr>
													<tr>
														<th>교육방식</th>
														<td>오프라인</td>
														<th>교육수준</th>
														<td>중급</td>
													</tr>
													<tr>
														<th>학습기간</th>
														<td>20200201 ~ 20200205</td>
														<th>신청기간</th>
														<td>20200101 ~ 20200131</td>
													</tr>
													<tr>
														<th>제출파일</th>
														<td colspan="3"></td>
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