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
					<h1 class="page-title"><b>교육목록</b></h1>
					<div id="toastr-demo" class="panel" style="height:700px;">
						<div class="panel-body">
							<div style="height: auto; width: 60%;">
								<h3 class="hidden">공지사항 검색폼</h3>
								<br>
								<form class="table-form">
										<div class="input-group">
										<span>
										<select class="form-control"  style="height: auto; width: 20%;">
											<option value="title">과목명</option>
											<option value="type">유형</option>
											<option value="e-id">순번</option>
										</select>
										</span>
											<input class="form-control" type="text" style="height: auto; width: 80%;">
											<span class="input-group-btn"><button class="btn btn-primary" type="button"  onclick="text();">검색</button></span>
										</div>
								</form>
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
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="applyPop();">안내 및 신청</button></td>
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
													</tr>
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
								<div class="tab-pane" id="tab2" value="1234">2. Put a little content in your pane.</div>
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
	<!-- Javascript -->
	<script>
		function applyPop(){
			window.open('/itep/views/eduApply/pop/eduApplyPop','안내 및 신청','location=no, width=750, height=750');
		}
	</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

