<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<div class="panel">
						<div class="panel-heading" > 
							<h1 class="page-title" style="margin-bottom: 0px"><b>교육 신청 현황</b></h1>
						</div>
					</div>
					<div class="panel">
						<div class="panel-body">
							<!-- Start-과정개설신청 리스트 - 조회 조건 선택-->
							<div class="well">
								<table>
									<tbody>
										<tr>
											<td>
												<h1 class="panel-title"><b>▶ 과정개설 신청</b></h1>
											</td>
											<td>
												<select class="form-control" style="text-align: center;">
													<option value="all">전체</option>
													<option value="confirm">확인</option>
													<option value="unconfirm">미확인</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>								
							</div>			
						<!-- END-과정개설신청 리스트 - 조회 조건 선택-->
						<!-- START-과정개설신청 리스트 - 조회 결과 -->
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody style="vertical-align: center;">
										<tr>
											<th>No</th>
											<th>부서명</th>
											<th>직원번호</th>
											<th>직원명</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>상세확인</th>
										</tr>
										<tr>
											<td>1</td>
											<td>IT시스템운영팀</td>
											<td>26673</td>
											<td>한원석</td>
											<td>IBM AIX PowerHA 8.0</td>
											<td>미르헨지</td>
											<td>2020.09.01 ~ 2020.09.05</td>
											<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','newEduInfoPop');">확인</button></td>
										</tr>
										<tr>
											<td>1</td>
											<td>IT시스템운영팀</td>
											<td>26673</td>
											<td>한원석</td>
											<td>IBM AIX PowerHA 8.0</td>
											<td>미르헨지</td>
											<td>2020.09.01 ~ 2020.09.05</td>
											<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','newEduInfoPop');">확인</button></td>
										</tr>
									</tbody>
								</table>
							</div>						
						</div>						
					</div>
					<!-- END-과정개설신청 리스트 - 조회 결과 -->
					<!-- Start-교육신청 리스트-->
					<div class="panel">
						<div class="panel-body">
							<!-- Start-교육신청리스트 - 조회 조건 선택-->
								<div class="well" style="background-color: white;">
									<table>
										<tbody>
											<tr>
												<td class="col-md-2" style="text-align: left;">
													<h1 class="panel-title"><b>▶ 교육일자</b></h1>
												</td>
												<td class="col-md-2"  style="text-align: left;">
													<input type='date' name='edudate' value='2020-09-22'/>
												</td>
												<td class="col-md-2"  style="text-align: left;">
													<h1 class="panel-title"><b>▶ 교육분류</b></h1>
												</td>
												<td class="col-md-2"  style="text-align: left;">
													<select class="form-control" style="text-align: center;">
														<option value="outedu">외부교육</option>
														<option value="inedu">내부교육</option>
														<option value="seminar">세미나</option>
													</select>
												</td>
												<td class="col-md-4"  style="text-align: right;">
													<td><button type="button" class="btn btn-primary">엑셀 다운로드</button></td>
												</td>
											</tr>
										</tbody>
									</table>								
								</div>			
							<!-- End-교육신청리스트-조회조건선택-->
							<!-- Start-교육신청리스트-조회결과-->
								<div class="table-responsive">
									<table class="table table-hover">
										<tbody style="vertical-align: center;">
											<tr>
												<th>No</th>
												<th>교육분류</th>
												<th>학습기간</th>
												<th>과목명</th>
												<th>교육기관</th>
												<th>신청인원</th>
												<th>상세확인</th>
											</tr>
											<tr>
												<td>1</td>
												<td>외부교육</td>
												<td>2020.09.01 ~ 2020.09.05</td>
												<td>IBM AIX PowerHA 8.0</td>
												<td>미르헨지</td>
												<td>5</td>
												<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','eduEmpListPop');">확인</button></td>
											</tr>
											<tr>
												<td>2</td>
												<td>세미나</td>
												<td>2020.09.03 ~ 2020.09.05</td>
												<td>리눅스 맛보기 2020</td>
												<td>레드햇 코리아</td>
												<td>2</td>
												<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','eduEmpListPop');">확인</button></td>
											</tr>
										</tbody>
									</table>
								</div>						
							<!--End-교육신청리스트-조회결과-->
						</div>
					</div>
					<!--END-교육신청리스트-->
				</div>
			</div>		
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->
	
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />