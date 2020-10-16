<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 수강 이력-대제목 -->
					<h1 class="page-title" style="padding-top:20px">
						<b>수강 이력</b>
					</h1>
					<!-- End 수강 이력-대제목 -->
					<div class="row">
						<div class="panel">
							<div class="panel-body"  style="padding-top:20px">
								<!-- Start 수강이력-조회바 -->
								<div class="well col-md-12"
									style="display: table; padding: 10px; vertical-align: middle">
									<div style="display: table-cell; vertical-align: middle">
										<table>
											<tbody>
												<tr>
													<td style="width: 100px;"><b>기간</b></td>
													<td style="width: 130px; text-align: left"><input
														type='date' name='startdate' value='2020-09-22' /></td>
													<td style="width: 50px;"><b>~</b></td>
													<td style="width: 130px; text-align: left"><input
														type='date' name='enddate' value='2020-09-22' /></td>
													<td style="width: 150px"><b>교육분류</b></td>
													<td style="width: 150px"><select class="form-control"
														style="text-align: left;">
															<option value="outedu">외부교육</option>
															<option value="inedu">내부교육</option>
															<option value="seminar">세미나</option>
													</select></td>

												</tr>
												<tr style="height: 10px"></tr>
												<tr>
													<td style="width: 100px"><b>부서</b></td>
													<td colspan="3"><select class="form-control"
														style="text-align: left;">
															<option value="outedu">IT시스템운영팀</option>
															<option value="inedu">IT금융개발부</option>
															<option value="seminar">IT디지털개발부</option>
													</select></td>
													<td style="width: 150px"><b>직원명</b></td>
													<td style="width: 150px"><input class="form-control"
														type="text" style="text-align: left;" value="직원명"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div
										style="display: table-cell; padding-right: 10px; vertical-align: middle">
										<button type="button" class="btn btn-primary"
											style="float: right; height: 50px">조회</button>
									</div>
								</div>
								<!-- End 수강이력-조회바 -->
								<!-- Start 수강이력 - 버튼바-->
								<div class="form-group row"
									style="text-align: right; padding-right: 20px;">
									<button class="btn btn-primary" type="button">참고사항 등록</button>
									<button class="btn btn-primary" type="button">엑셀 다운로드</button>
								</div>
								<!-- End 수강이력 - 버튼바-->
								<!-- Start 수강이력 - 리스트 -->
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width: 50px"><input type="checkbox"></th>
											<th style="width: 50px">No</th>
											<th>교육분류</th>
											<th>부서명</th>
											<th>직원명</th>
											<th>직원번호</th>
											<th>과목코드</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>교육기간</th>
											<th>예산</th>
											<th>참고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td>1</td>
											<td>외부교육</td>
											<td>IT시스템운영팀</td>
											<td>김지영</td>
											<td>42344</td>
											<td>OTEDU0001</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>1,960,000</td>
											<td>교육 퀄리티 우수</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>2</td>
											<td>외부교육</td>
											<td>IT시스템운영팀</td>
											<td>김지영</td>
											<td>41114</td>
											<td>OTEDU0001</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>960,000</td>
											<td>교육 퀄리티 우수</td>
										</tr>
									</tbody>
								</table>
								<!-- End 수강이력 - 리스트 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />