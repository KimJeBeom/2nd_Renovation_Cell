<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- 대제목 Start -->
					<h1 class="page-title" style="padding-top:20px">
						<b>수강신청한 교육</b>
					</h1>
					<!-- 대제목 End -->
					<!-- 본문 Start -->
					<div class="row">
						<div class="panel">
							<!-- Start 과정개설 신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<b>▶ 과정개설 신청목록</b>
								</h4>
							</div>
							<!-- End 과정개설 신청목록-소제목 -->
							<!-- Start 과정개설 신청목록-리스트 -->
							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>담당자 확인여부</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>AWS SUMMIT SEOUL</td>
											<td>Amazon</td>
											<td>2020.07.01 ~ 2020.08.31</td>
											<td>2020.06.01</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
											<td>Y</td>
										</tr>
										<tr>
											<td>2</td>
											<td>한원석의 AIX 그까이꺼</td>
											<td>WS컴퍼니</td>
											<td>2020.08.01 ~ 2020.09.31</td>
											<td>2020.06.02</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
											<td>N</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- End 과정개설 신청목록-리스트 -->
							<!-- Start 수강신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<b>▶ 수강신청 목록</b>
								</h4>
							</div>
							<!-- End 수강신청목록-소제목 -->
							<div class="panel-body">
								<!-- Start 수강신청목록-조회바 -->
								<div class="well col-md-12"
									style="display: table; padding: 10px">
									<div style="display: table-cell; vertical-align: middle">
										<table>
											<tbody>
												<tr>
													<td style="width: 50px;"><b>기간</b></td>
													<td style="width: 130px; text-align: left"><input
														type='date' name='startdate' value='2020-09-22' /></td>
													<td style="width: 100px;"><b>~</b></td>
													<td style="width: 130px; text-align: left"><input
														type='date' name='enddate' value='2020-09-22' /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div style="display: table-cell"
										style="text-align: center; padding-right:5px;">
										<button type="button" class="btn btn-primary"
											style="float: right;">조회</button>
									</div>
								</div>
								<!-- End 수강신청목록-조회바 -->
								<!-- Start 수강신청목록-리스트 -->
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>결제진행</th>
											<th>취소</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>2020.08.01</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
											<td>결재 중</td>
											<td>
												<button type="button" class="btn btn-default btn-xs">취소요청</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>현민지의 3병이 제일 쉬웠어요</td>
											<td>주작cmp</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>2020.08.01</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
											<td>반려 중</td>
											<td>
												<button type="button" class="btn btn-default btn-xs">취소요청</button>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- End 수강신청목록-리스트 -->
							</div>
						</div>
					</div>
					<!--End 본문-->
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />