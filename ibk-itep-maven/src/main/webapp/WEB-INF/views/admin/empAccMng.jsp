<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

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
					<!-- Start 사용자 계정관리-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>사용자 계정관리</b>
							</h1>
						</div>
					</div>
					<!-- End 사용자 계정관리-대제목 -->
					<!-- Start 사용자 계정관리-본문 -->
					<div class="panel">
						<!--Start-사용자 계정관리 button bar 부분-->
						<div class="panel-body" style="padding-top:20px">
							<div class="form-group col-md-12" style="text-align: right; padding:0px">
								<button class="btn btn-primary" type="button">등록</button>
								<button class="btn btn-primary" type="button">수정</button>
								<button class="btn btn-primary" type="button">삭제</button>
								<button class="btn btn-primary" type="button">엑셀다운로드</button>
							</div>

							<!--End-사용자 계정관리 button bar 부분-->
							<!--Start-직원관련 inputline1 부분-->
							<div class="well col-md-12" style="display: table; padding: 10px; margin-top: 10px">
								<div style="display: table-cell; vertical-align: middle">
									<table>
										<tbody>
											<tr>
												<td style="width: 100px"><b>부서</b></td>
												<td style="width: 200px"><select class="form-control"
													style="text-align: left;">
														<option>IT시스템운영팀</option>
														<option>IT금융개발부</option>
														<option>IT디지털개발부</option>
												</select></td>
												<td style="width: 200px"><b>직원명/직원번호</b></td>
												<td style="width: 200px"><input class="form-control"
													type="text" style="text-align: left;"></td>
												<td style="width: 100px"><b>권한</b></td>
												<td style="width: 150px"><select class="form-control"
													style="text-align: left;">
														<option>관리자</option>
														<option>사용자</option>
												</select></td>

											</tr>
										</tbody>
									</table>
								</div>
								<div
									style="display: table-cell; text-align: center; padding-right: 5px; width: 100px">
									<button type="button" class="btn btn-primary"
										style="float: right;">조회</button>
								</div>
							</div>
							<!--End-직원관련 inputline1 부분-->

							<!--Start-직원관련 inputline2 부분-->

							<table class="table table-bordered tbl-type1">
								<!-- 팝업용 form을 사용하면 될듯 -->
								<tbody>
									<tr>
										<th>직원번호</th>
										<td><input type="text" class="form-control"
											placeholder="text field"></td>
										<th>직원명</th>
										<td><input type="text" class="form-control"
											placeholder="text field"></td>
										<th>직책</th>
										<td><input type="text" class="form-control"
											placeholder="text field"></td>
									</tr>
									<tr>
										<th>부서명</th>
										<td><select class="form-control"
											style="text-align: left;">
												<option value="outedu">IT시스템운영팀</option>
												<option value="inedu">IT금융개발부</option>
												<option value="seminar">IT디지털개발부</option>
										</select></td>



										<th>행내전화</th>
										<td><input type="text" class="form-control"
											placeholder="text field"></td>
										<th>권한</th>
										<td><select class="form-control"
											style="text-align: left;">
												<option value="admin">관리자</option>
												<option value="user">사용자</option>
										</select></td>
									</tr>
								</tbody>
							</table>

							<!--End-직원관련 inputline2 부분-->
							<!-- Start-직원 조회 리스트 부분-->

							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width: 5px;"><input type="checkbox"></th>
											<th style="width: 65px;">No</th>
											<th style="width: 15px;">직원번호</th>
											<th style="width: 15px;">직원명</th>
											<th style="width: 15px;">직책</th>
											<th style="width: 15px;">행내전화</th>
											<th style="width: 15px;">부서명</th>
											<th style="width: 15px;">권한</th>
										</tr>
									</thead>
									<tbody style="vertical-align: center;">
										<tr>
											<td><input type="checkbox"></td>
											<td>1</td>
											<td>26673</td>
											<td>한원석</td>
											<td>대리</td>
											<td>8-2680</td>
											<td>IT시스템운영팀</td>
											<td>사용자</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>2</td>
											<td>42780</td>
											<td>현민지</td>
											<td>대리</td>
											<td>8-2961</td>
											<td>IT시스템운영팀</td>
											<td>관리자</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>3</td>
											<td>26333</td>
											<td>이은섭</td>
											<td>대리</td>
											<td>8-2111</td>
											<td>IT시스템운영팀</td>
											<td>권한</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- End-직원 조회 리스트 부분-->
					</div>
					<!-- Start 사용자 계정관리-본문 -->
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />