<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 교육 신청 현황-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>교육 신청 현황</b>
							</h1>
						</div>
					</div>
					<!-- End 교육 신청 현황-대제목 -->
					<!-- Start 교육 신청 현황-본문 panel -->
					<div class="panel">
						<div class="panel-body" style="padding-top: 20px">
							<!-- Start 교육 신청 현황 - 탭 바 -->
							<div>
								<ul class="nav nav-tabs">
									<li class="nav-item active" value="크아아"><a
										class="nav-link" href="#tab1" data-toggle="tab">수강신청현황</a></li>
									<li class="nav-item" value="흐하하"><a class="nav-link"
										href="#tab2" data-toggle="tab">개설신청현황</a>
								</ul>
							</div>
							<!-- End 교육 신청 현황 - 탭 바 -->
							<!-- Start 교육 신청 현황 - 탭  내용 panel -->
							<div class="tab-content px-1 pt-2">
								<!-- Start 교육 신청 현황 - 탭1 내용 - 수강신청 현황 -->
								<div class="tab-pane active" id="tab1">
									<!-- Start 교육 신청 현황 - 탭1. 수강신청 현황 - 조회바 -->
									<div class="well col-md-12"
										style="display: table; padding: 10px">
										<div style="display: table-cell; vertical-align: middle">
											<table>
												<tbody>
													<tr>
														<td style="width: 130px;"><b>▶ 교육분류</b></td>
														<td style="width: 200px"><select class="form-control" id="edctClsfCd" style="text-align: left;">
															<option value="ALL">전체</option>
															<c:forEach items="${cldVoList }" var="cldVo">
																<option value=${cldVo.edctClsfCd }>${cldVo.edctClsfNm }</option>		
															</c:forEach>
													</select></td>
													<td style="width: 50px;"></td>
														<td style="width: 130px;"><b>▶ 교육기간</b></td>
														<td style="width: 600px; padding-right: 20px">
															<div class="ui form">
																<div class="two fields" style="margin-bottom: 0px">
																	<div class="field">
																		<div class="ui calendar" id="rangestart">
																			<div class="ui input left icon">
																				<i class="calendar icon" style="font-size: 14px;"></i>
																				<input id="sttgYmd" type="text"
																					style="height: 35px; font-size: 14px;">
																			</div>
																		</div>
																	</div>
																	<label style="padding-top: 7px; height: 7px;">
																		&nbsp; ~ &nbsp; </label>
																	<div class="field">
																		<div class="ui calendar" id="rangeend">
																			<div class="ui input left icon">
																				<i class="calendar icon" style="font-size: 14px;"></i>
																				<input id="fnshYmd" type="text"
																					style="height: 35px; font-size: 14px;">
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
											<button type="button" class="btn btn-primary"
												style="float: right;">조회</button>
										</div>
									</div>
									<!-- End 교육 신청 현황 - 탭1. 수강신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭1. 수강신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
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
													<td><button type="button" class="btn btn-primary"
															onclick="showPopup('admin','eduEmpListPop');">확인</button></td>
												</tr>
												<tr>
													<td>2</td>
													<td>세미나</td>
													<td>2020.09.03 ~ 2020.09.05</td>
													<td>리눅스 맛보기 2020</td>
													<td>레드햇 코리아</td>
													<td>2</td>
													<td><button type="button" class="btn btn-primary"
															onclick="showPopup('admin','eduEmpListPop');">확인</button></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- End 교육 신청 현황 - 탭1. 수강신청 현황 - 조회결과 -->
								</div>
								<!-- Start 교육 신청 현황 - 탭2. 내용 - 개설 신청 현황 -->
								<div class="tab-pane" id="tab2">
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<div class="well col-md-12"
										style="display: table; padding: 10px">
										<div style="display: table-cell; vertical-align: middle">
											<table>
												<tbody>
													<tr>
														<td style="width: 150px;"><b>▶ 과정개설 신청</b></td>
														<td style="width: 150px"><select class="form-control">
																<option value="all">전체</option>
																<option value="confirm">확인</option>
																<option value="unconfirm">미확인</option>
														</select></td>
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
									<!-- End 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
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
													<td><button type="button" class="btn btn-primary"
															onclick="showPopup('admin','newEduInfoPop');">확인</button></td>
												</tr>
												<tr>
													<td>1</td>
													<td>IT시스템운영팀</td>
													<td>26673</td>
													<td>한원석</td>
													<td>IBM AIX PowerHA 8.0</td>
													<td>미르헨지</td>
													<td>2020.09.01 ~ 2020.09.05</td>
													<td><button type="button" class="btn btn-primary"
															onclick="showPopup('admin','newEduInfoPop');">확인</button></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- End 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회결과 -->
								</div>
								<!-- End 교육 신청 현황 - 탭2. 내용 - 개설 신청 현황 -->
							</div>
							<!-- End 교육 신청 현황 - 탭  내용 panel -->
						</div>
					</div>
					<!-- End 교육 신청 현황-본문 panel -->
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	<script type="text/javascript">
		/* 	$(document).ready(function(){
		 $(document).click(function(){
		 var navv = $(".nav-tabs .active").attr('value');
		 alert(navv);
		 });

		 }); */
	</script>