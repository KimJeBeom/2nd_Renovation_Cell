<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 진행 및 완료 문서
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
					<h1 class="page-title" style="padding-top: 20px;"><b>결재 진행 및 완료문서</b></h1>
					<div class="row">

						<!-- 상단 검색 패널 -->
						<div class="panel">
							<div class="panel-body">
								<div class="well" style="margin-bottom: 0px; padding-top: 15px;">		
									<table>
										<tbody>
											<tr>
												<td style="width: 130px; padding-left: 5px;"><b>결재요청일</b></td>
												<td style="width: 600px; padding-right: 40px">
													<div class="ui form">
														<div class="two fields" style="margin-bottom: 0px">
														  <div class="field">
															<div class="ui calendar" id="rangestart">
															  <div class="ui input left icon">
																<i class="calendar icon"></i>
																<input type="text" placeholder="Start">
															  </div>
															</div>
														</div>
														<label style="padding-top: 6px; height: 7px;"> &nbsp; ~ &nbsp; </label>
														<div class="field">
															<div class="ui calendar" id="rangeend">
															  <div class="ui input left icon">
																<i class="calendar icon"></i>
																<input type="text" placeholder="End">
															  </div>
															</div>
														  </div>
														</div>
													</div>
												</td>
												<td style="width: 100px;"><b>결재상태</b></td>
												<td style="width: 200px;">
													<select class="form-control" style="width:100%;">
														<option value="all">전체</option>
														<option value="complete">결재완료</option>
														<option value="ready">결재중</option>
														<option value="reject">반려</option>
													</select>
												</td>
												<td style="width: 30%;"><button type="button" class="btn btn-primary btn-toastr" style="float: right; margin-right: 20px;">조회</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<br>

							<!-- 결재 현황 테이블 -->
							<div class="panel-body">
								<h4 class="panel-title" style="margin-bottom: 10px"><b>▶ 결재 현황</b></h4>
								<div class="table-responsive">
								<table class="table table-hover tbl-type2">
									<thead>
										<tr>
											<th>NO</th>
											<th>부서명</th>
											<th>직원명</th>
											<th style="width: 200px;">신청교육</th>
											<th>신청일자</th>
											<th>결재상태</th>
											<th>결재자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>IT금융개발부</td>
											<td>조기은</td>
											<td>R을 이용한 빅데이터 분석</td>
											<td>2020.01.02</td>
											<td>결재 중</td>
											<td>장기은</td>
										</tr>
										<tr>
											<td>2</td>
											<td>IT금융개발부</td>
											<td>박기은</td>
											<td>업무에 바로 쓰는 SQL 튜닝</td>
											<td>2020.01.06</td>
											<td>결재 중</td>
											<td>주기은</td>
										</tr>
										<tr>
											<td>3</td>
											<td>IT금융개발부</td>
											<td>정기은</td>
											<td>TenserFlow로 배우는 강화학습</td>
											<td>2020.01.15</td>
											<td>결재완료</td>
											<td>기부장</td>
										</tr>
										<tr>
											<td>4</td>
											<td>IT기획부</td>
											<td>김기은</td>
											<td>Java Programming 핵심</td>
											<td>2020.01.24</td>
											<td>반려</td>
											<td>김기은</td>
										</tr>
									</tbody>
								</table>
								</div>
							</div>
						
							<!-- 결재 이력 테이블 -->
							<div class="panel-body">
								<h4 class="panel-title" style="margin-bottom: 10px"><b>▶ 결재 이력</b></h4>
								<div class="table-responsive">
									<table class="table table-hover tbl-type2">
										<thead>
											<tr>
												<th>NO</th>
												<th>부서명</th>
												<th>직원명</th>
												<th>결재의견</th>
												<th>결재일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>IT금융개발부</td>
												<td>조기은</td>
												<td>외부교육 결재 요청 드립니다.</td>
												<td>2020.01.02</td>
											</tr>
											<tr>
												<td>2</td>
												<td>IT금융개발부</td>
												<td>김팀장</td>
												<td>내용 확인함</td>
												<td>2020.01.02</td>
											</tr>
											<tr>
												<td>3</td>
												<td>IT금융개발부</td>
												<td>김부장</td>
												<td>승인</td>
												<td>2020.01.04</td>
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
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
	<!-- END WRAPPER -->


<!-- FOOTER -->
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 진행 및 완료 문서
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
					<h1 class="page-title" style="padding-top: 20px;"><b>결재 진행 및 완료문서</b></h1>
					<div class="row">

						<!-- 상단 검색 패널 -->
						<div class="panel">
							<div class="panel-body">
								<div class="well" style="margin-bottom: 0px; padding-top: 15px;">		
									<table>
										<tbody>
											<tr>
												<td style="width: 130px; padding-left: 5px;"><b>결재요청일</b></td>
												<td style="width: 600px; padding-right: 40px">
													<div class="ui form">
														<div class="two fields" style="margin-bottom: 0px">
														  <div class="field">
															<div class="ui calendar" id="rangestart">
															  <div class="ui input left icon">
																<i class="calendar icon"></i>
																<input type="text" placeholder="Start">
															  </div>
															</div>
														</div>
														<label style="padding-top: 6px; height: 7px;"> &nbsp; ~ &nbsp; </label>
														<div class="field">
															<div class="ui calendar" id="rangeend">
															  <div class="ui input left icon">
																<i class="calendar icon"></i>
																<input type="text" placeholder="End">
															  </div>
															</div>
														  </div>
														</div>
													</div>
												</td>
												<td style="width: 100px;"><b>결재상태</b></td>
												<td style="width: 200px;">
													<select class="form-control" style="width:100%;">
														<option value="all">전체</option>
														<option value="complete">결재완료</option>
														<option value="ready">결재중</option>
														<option value="reject">반려</option>
													</select>
												</td>
												<td style="width: 30%;"><button type="button" class="btn btn-primary btn-toastr" style="float: right; margin-right: 20px;">조회</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<br>

							<!-- 결재 현황 테이블 -->
							<div class="panel-body">
								<h4 class="panel-title" style="margin-bottom: 10px"><b>▶ 결재 현황</b></h4>
								<div class="table-responsive">
								<table class="table table-hover tbl-type2">
									<thead>
										<tr>
											<th>NO</th>
											<th>부서명</th>
											<th>직원명</th>
											<th style="width: 200px;">신청교육</th>
											<th>신청일자</th>
											<th>결재상태</th>
											<th>결재자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>IT금융개발부</td>
											<td>조기은</td>
											<td>R을 이용한 빅데이터 분석</td>
											<td>2020.01.02</td>
											<td>결재 중</td>
											<td>장기은</td>
										</tr>
										<tr>
											<td>2</td>
											<td>IT금융개발부</td>
											<td>박기은</td>
											<td>업무에 바로 쓰는 SQL 튜닝</td>
											<td>2020.01.06</td>
											<td>결재 중</td>
											<td>주기은</td>
										</tr>
										<tr>
											<td>3</td>
											<td>IT금융개발부</td>
											<td>정기은</td>
											<td>TenserFlow로 배우는 강화학습</td>
											<td>2020.01.15</td>
											<td>결재완료</td>
											<td>기부장</td>
										</tr>
										<tr>
											<td>4</td>
											<td>IT기획부</td>
											<td>김기은</td>
											<td>Java Programming 핵심</td>
											<td>2020.01.24</td>
											<td>반려</td>
											<td>김기은</td>
										</tr>
									</tbody>
								</table>
								</div>
							</div>
						
							<!-- 결재 이력 테이블 -->
							<div class="panel-body">
								<h4 class="panel-title" style="margin-bottom: 10px"><b>▶ 결재 이력</b></h4>
								<div class="table-responsive">
									<table class="table table-hover tbl-type2">
										<thead>
											<tr>
												<th>NO</th>
												<th>부서명</th>
												<th>직원명</th>
												<th>결재의견</th>
												<th>결재일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>IT금융개발부</td>
												<td>조기은</td>
												<td>외부교육 결재 요청 드립니다.</td>
												<td>2020.01.02</td>
											</tr>
											<tr>
												<td>2</td>
												<td>IT금융개발부</td>
												<td>김팀장</td>
												<td>내용 확인함</td>
												<td>2020.01.02</td>
											</tr>
											<tr>
												<td>3</td>
												<td>IT금융개발부</td>
												<td>김부장</td>
												<td>승인</td>
												<td>2020.01.04</td>
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
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
	<!-- END WRAPPER -->


<!-- FOOTER -->
>>>>>>> branch 'master' of https://github.com/KimJeBeom/2nd_Renovation_Cell.git
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />