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
					<h1 class="page-title"><b>공지사항</b></h1>
					<div id="toastr-demo" class="panel">
						<br>
						<div class="form-group row">
							<label class="col-md-1 col-form-label form-control-label text-muted" style="text-align: right;vertical-align: middle;">■ 제 목</label>
							<div class="col-md-5">
								<input class="form-control" type="text" value="Bishop">
							</div>
							<button class="btn btn-primary" type="button">검 색</button>
						</div>					
					</div>

					<div id="toastr-demo" class="panel" style="height:500px;">
						<div class="panel-body">
							<div class="form-group row" style="text-align: right; padding-right: 15px;">
								<button class="btn btn-primary btn-xs" type="button" onclick="regPopup();">등 록</button>
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
										<tr onclick="modPopup();">
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
	<!-- Javascript -->
	<script>
	function regPopup(){
		window.open('/itep/views/board/pop/noticeRegPop','공지사항등록','location=no, width=750, height=600,left=100,top=100');
	}
	function modPopup(){
		window.open('/itep/views/board/pop/noticeModPop','공지사항등록','location=no, width=750, height=600,left=100,top=100');
	}
	</script>
	
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />