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
					<br>
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/eduapply-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>교육 목록</b>
							</h1>
						</div>
					</div>
					<div id="toastr-demo" class="panel" style="height:700px;">
						<div class="panel-body">
							<div class="well">
								<table>
									<tbody>
										<tr>
											<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 검 색 </b></td>
											<td style="width: 100px; padding-right: 40px">
												<div>
													<select class="form-control">
														<option value="title">과목명</option>
														<option value="type">유형</option>
														<option value="e-id">순번</option>
													</select>
												</div>
											</td>
											<td style="width: 300px; padding-right: 40px">
												<div>
													<input class="form-control" type="text" value="">
												</div>
											</td>
											<td style="width: 10%; text-align: left;"><button type="button" class="btn btn-primary btn-toastr" style="float: right; margin-right: 20px;">조회</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						
							<br>
							<div>	
								 <ul class="nav nav-tabs">
									<li class="active">
										<a class="nav-link" href="#tab1" data-toggle="tab">전체</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab2" data-toggle="tab">외부교육</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab3" data-toggle="tab">신전입교육</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab4" data-toggle="tab">세미나</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab5" data-toggle="tab">기타</a>
									</li>
									<!-- 
									<li class="disabled">
										<a class="nav-link" href="#tab6" data-toggle="tab">Disabled</a>
									</li>
									 -->
								</ul>
							</div>
							<div class="tab-content px-1 pt-2">
								<div class="tab-pane active" id="tab1">		
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-hover table-sm first">
												<tbody>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">유형</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
													<tr>
														<td style="text-align:center">1</td>
														<td style="text-align:left"><span class="badge badge-primary">초</span> 업무에 바로쓰는 SQL활용실습</td>
														<td style="text-align:center">멀티캠퍼스</td>
														<td style="text-align:center">2020.09.16 ~ 2020.09.30</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop');">안내 및 신청</button></td>
													</tr>
													<tr>
														<td style="text-align:center">2</td>
														<td style="text-align:left"><span class="badge badge-primary">초</span> 실천!초보자를 위한 Java</td>
														<td style="text-align:center">멀티캠퍼스</td>
														<td style="text-align:center">2020.09.16 ~ 2020.09.30</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs">안내 및 신청</button></td>
													</tr>
													<tr class="table-primary">
														<td style="text-align:center">3</td>
														<td style="text-align:left"><span class="badge badge-primary">중</span> Java Programing 핵심</td>
														<td style="text-align:center">멀티캠퍼스</td>
														<td style="text-align:center">2020.09.16 ~ 2020.09.30</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs">안내 및 신청</button></td>
													<tr>
														<td style="text-align:center">4</td>
														<td style="text-align:left"><span class="badge badge-primary">고</span> 핵심! Go프로그래밍</td>
														<td style="text-align:center">패스트캠퍼스</td>
														<td style="text-align:center">2020.09.16 ~ 2020.09.30</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs">안내 및 신청</button></td>
													</tr>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="tab-pane" id="tab2">2. Put a little content in your pane.</div>
								<div class="tab-pane" id="tab3">3. Put some more content in your pane here.</div>
								<div class="tab-pane" id="tab4">4. Put some more content in your pane here.</div>
								<div class="tab-pane" id="tab4">5. Put some more content in your pane here.</div>
								<div class="tab-pane" id="tab5">6. Put some more content in your pane here.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
				</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

