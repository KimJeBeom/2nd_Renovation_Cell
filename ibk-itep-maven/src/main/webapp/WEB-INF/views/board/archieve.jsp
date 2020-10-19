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
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/board-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>자료실</b>
							</h1>
						</div>
					</div>
						<div class="panel">
							<div class="panel-body">
								<br>
								<div class="well">
									<table>
										<tbody>
											<tr>
												<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 제 목</b></td>
												<td style="width: 300px; padding-right: 40px">
													<div>
														<input class="form-control" type="text" value="">
													</div>
												</td>
												<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 작성자</b></td>
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
							<div class="form-group row" style="text-align: right; padding-right: 15px;">
								<button class="btn btn-primary" type="button" onclick="showPopup('board','archRegPop');">등 록</button>
							</div>
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>
											<th style="text-align:center; width:10%;" id="1">No.</th>
											<th style="text-align:center; width:15%;" id="2">구분</th>
											<th style="text-align:center; width:45%;" id="3">제목</th>
											<th style="text-align:center; width:15%;" id="4">등록일</th>
											<th style="text-align:center; width:15%;" id="5">등록자</th>
										</tr>
										<tr onclick="showPopup('board','archModPop');">
											<td style="text-align:center">1</td>
											<td style="text-align:center">세미나</td>
											<td style="text-align: left">업무에 바로쓰는 SQL활용실습</td>
											<td style="text-align:center">2020.09.23</td>
											<td style="text-align:center">김기은</td>
										</tr>
										<tr>
											<td style="text-align:center">2</td>
											<td style="text-align:center">세미나</td>
											<td style="text-align: left">실천!초보자를 위한 Java</td>
											<td style="text-align:center">2020.09.23</td>
											<td style="text-align:center">김기은</td>
										</tr>
										<tr class="table-primary">
											<td style="text-align:center">3</td>
											<td style="text-align:center">세미나</td>
											<td style="text-align: left">Java Programing 핵심</td>
											<td style="text-align:center">2020.09.23</td>
											<td style="text-align:center">김기은</td>
										</tr>
											<td style="text-align:center">4</td>
											<td style="text-align:center">세미나</td>
											<td style="text-align: left">핵심! Go프로그래밍</td>
											<td style="text-align:center">2020.09.23</td>
											<td style="text-align:center">김기은</td>
										</tr>
									</tbody>
								</table>
							</div>
							<nav aria-label="Page navigation" style="text-align: right;">
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