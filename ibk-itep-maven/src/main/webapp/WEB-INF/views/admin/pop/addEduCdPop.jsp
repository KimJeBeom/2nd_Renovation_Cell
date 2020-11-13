<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 코드관리 > 신규 코드 등록 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title" style="float: left;"><b>신규 코드 등록</b></h3>

					<!-- 상단 버튼 -->
					<button type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom; ">등록</button><br><br>

					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 신규 교육 등록 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>코드분류</th>
											<td colspan="3">
												<select id="eduCdType" class="form-control">
													<option>교육기관</option>
													<option>교육분류</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>코드ID</th>
											<td>
												<input type="text" class="form-control" placeholder="코드ID">
											</td>
										</tr>
										<tr>
											<th>코드명</th>
											<td>
												<input type="text" class="form-control" placeholder="코드명">
											</td>
										</tr>
									</tbody>
								</table>
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
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
