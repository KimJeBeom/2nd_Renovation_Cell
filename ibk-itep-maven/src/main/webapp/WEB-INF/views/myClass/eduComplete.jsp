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
					<!-- Start 대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/myclass-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>수강 완료한 교육</b>
							</h1>
						</div>
					</div>
					<!-- End 대제목 -->
					<!-- Start 본문 -->
					<div class="row">
						<div class="panel">
							<div class="panel-body"  style="padding-top:20px">
								<!-- Start 수강완료한 교육-조회바 -->
								<div class="well col-md-12"
									style="display: table; padding: 10px">
									<div style="display: table-cell; vertical-align: middle">
										<table>
											<tbody>
												<tr>
												  <td style="width: 130px; padding-left: 5px;"><b>기간</b></td>
												  <td style="width: 600px; padding-right: 20px">
													<div class="ui form">
														<div class="two fields" style="margin-bottom: 0px">
														  <div class="field">
															<div class="ui calendar" id="rangestart">
															  <div class="ui input left icon">
																<i class="calendar icon" style="font-size:14px;"></i>
																<input type="text" placeholder="Start" style="height:35px; font-size:14px;">
															  </div>
															</div>
														</div>
														<label style="padding-top: 6px; height: 7px;"> &nbsp; ~ &nbsp; </label>
														<div class="field">
															<div class="ui calendar" id="rangeend">
															  <div class="ui input left icon">
																<i class="calendar icon" style="font-size:14px;"></i>
																<input type="text" placeholder="End" style="height:35px; font-size:14px;">
															  </div>
															</div>
														  </div>
														</div>
													</div>
												  </td>
											  </tr>
											</tbody>
										</table>
									</div>
									<div style="display: table-cell"
										style="text-align: center; padding-right:5px;">
										<button type="button" class="btn btn-primary">조회</button>
									</div>
								</div>
								<!-- End 수강완료한 교육-조회바 -->
								<!-- Start 수강완료한 교육-조회결과 -->
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th style="width: 150px;">과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>수료여부</th>
											<th>상세확인</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>Y</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>현민지의 3병이 제일 쉬웠어요</td>
											<td>주작cmp</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>N</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('eduApply','eduInfoPop ');">확인</button>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- End 수강완료한 교육-조회결과 -->
							</div>
						</div>
					</div>
					<!-- End 본문 -->
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />