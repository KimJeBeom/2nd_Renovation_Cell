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
					<!-- Start 교육 등록 및 수정-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>교육 등록 및 수정</b>
							</h1>
						</div>
					</div>
					<!-- End 교육 등록 및 수정-대제목 -->
					<div class="panel">
						<div class="panel-body"  style="padding-top:20px">
							<!-- Start 수강완료한 교육-조회바 -->
							<div class="well col-md-12" style="display: table; padding: 10px">
								<div style="display: table-cell; vertical-align: middle">
									<table>
										<tbody>
											<tr>
												<td style="width: 150px"><b>교육분류</b></td>
												<td style="width: 150px"><select class="form-control"
													style="text-align: left;">
														<option value="outedu">외부교육</option>
														<option value="inedu">내부교육</option>
														<option value="seminar">세미나</option>
												</select></td>
												<td style="width: 150px"><b>과목명</b></td>
												<td style="width: 300px"><input class="form-control"
													type="text" style="text-align: left;" value="과정명 입력하세요"></td>
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
							<!-- End 수강완료한 교육-조회바 -->
							<!-- Start 교육 등록 및 수정 - 버튼바-->
							<div class="form-group row"
								style="text-align: right; padding-right: 25px;">
								<button class="btn btn-primary" type="button"
									onclick="showPopup('admin','newEduRegPop');">등록</button>
								<button class="btn btn-primary" type="button"
									onclick="showPopup('admin','eduModPop');">수정</button>
								<button class="btn btn-primary" type="button">삭제</button>
								<button class="btn btn-primary" type="button">엑셀업로드</button>
								<button class="btn btn-primary" type="button">엑셀다운로드</button>
							</div>
							<!-- End 교육 등록 및 수정 - 버튼바-->
							<!-- Start 교육 조회 결과 리스트-->
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>
											<th style="width: 5px;"><input type="checkbox"></th>
											<th style="width: 65px;">No</th>
											<th style="width: 15px;">교육분류</th>
											<th style="width: 15px;">과목코드</th>
											<th style="width: 15px;">과목명</th>
											<th style="width: 15px;">기관</th>
											<th style="width: 15px;">차수관리</th>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>1</td>
											<td>외부교육</td>
											<td>OTEDU001</td>
											<td style="text-align: left">업무에 바로쓰는 SQL활용실습</td>
											<td>멀티캠퍼스</td>
											<td><button type="button" class="btn btn-primary bts-xs"
													onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>2</td>
											<td>내부교육</td>
											<td>OTEDU002</td>
											<td style="text-align: left">업무에 바로쓰는 컴파일러 명령어</td>
											<td>멀티캠퍼스</td>
											<td><button type="button" class="btn btn-primary bts-xs"
													onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>3</td>
											<td>세미나</td>
											<td>OTEDU007</td>
											<td style="text-align: left">고가용성에 대한 다양한 사례 공유</td>
											<td>레드햇</td>
											<td><button type="button" class="btn btn-primary bts-xs"
													onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- End 교육 조회 결과 리스트-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />