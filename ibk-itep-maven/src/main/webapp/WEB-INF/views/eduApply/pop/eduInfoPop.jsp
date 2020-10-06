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
					<h3 class="page-title"><b>교육 안내 및 신청</b></h3>
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 교육 안내 테이블 -->
								<table class="table table-bordered tbl-type1">
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
											<th>교육내용</th>
											<td class="txt-long" colspan="3">
												<br >
												- 다형성과 Loose Coupling 개념을 개발기간 뿐만 아니라 유지보수 및 확장시 개발자가 어떻게 적용할 수 있는지 학습합니다. <br >
												- 디자인 패턴 등 현장의 개발자에게 필요하지만 어려운 개념을 쉽고 구체적으로 접근합니다.
												<br ><br >
											</td>
										</tr>
										<tr>
											<th>교육기관</th>
											<td>멀티캠퍼스</td>
											<th>교육비용</th>
											<td>1,350,000</td>
										</tr>
										<tr>
											<th>교육기간</th>
											<td>5일</td>
											<th>이수시간</th>
											<td>35시간</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>오프라인</td>
											<th>교육수준</th>
											<td>중급</td>
										</tr>
									</tbody>
								</table>

								<!-- 교육별 차수안내 테이블 -->
								<table class="table table-bordered tbl-type2">
								<thead>
									<tr>
										<th>No</th>
										<th>학습기간</th>
										<th>신청기간</th>
										<th style="width: 25%;">신청</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>20200101 ~ 20200131</td>
										<td>20191201 ~ 20191231</td>
										<td>
											<!-- 교육신청 버튼 (비활성) -->
											<button type="button" class="btn btn-default btn-toastr" disabled="disabled">신청마감</button>
										</td>
									</tr>
										<tr>
										<td>2</td>
										<td>20200201 ~ 20200205</td>
										<td>20200101 ~ 20200131</td>
										<td>
											<!-- 교육신청 버튼 (활성) -->
											<button type="button" class="btn btn-primary btn-toastr" onclick="showPopup('eduApply','eduApplyPop');">교육신청</button>
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

