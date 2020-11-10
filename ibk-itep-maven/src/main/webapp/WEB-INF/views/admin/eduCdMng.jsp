<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 코드 관리-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>코드 관리</b>
							</h1>
						</div>
					</div>
					<!-- End 코드 관리-대제목 -->
					<!-- Start 코드 관리-본문 panel -->
					<div class="panel">
						<div class="panel-body"  style="padding-top:20px">
									<!-- Start 코드 관리  -조회바 -->
									<div class="well col-md-12"
										style="display: table; padding: 10px">
										<div style="display: table-cell; vertical-align: middle">
											<table>
												<tbody>
													<tr>
														<td style="width: 100px;"><b>분류</b></td>
														<td style="width: 200px"><select class="form-control" style="text-align: left;">
														        <option>-- 선택 --</option>
																<option>교육기관</option>
																<option>교육분류</option>
														</select></td>		
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- End 코드 관리 - 조회바 -->
									<!-- Start 버튼바-->
									<div class="form-group row"
										style="text-align: right; padding-right: 25px;">
										<button class="btn btn-primary" type="button">수정</button>
										<button class="btn btn-primary" type="button" onclick="showPopup('admin','addEduCdPop');">추가</button><br>
									</div>
							        <!-- End 버튼바-->
									<!-- Start 코드 관리 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
										<table class="table table-hover">
											<tbody style="vertical-align: center;" id="tab1-tbody">
												<tr>
													<th>No</th>
													<th>코드분류</th>
													<th>코드ID</th>
													<th>코드명</th>
													<th>사용여부</th>
												</tr>
												<tr>
													<td>1</td>
													<td>교육기관</td>
													<td>MTC</td>
													<td>
												    <input class="form-control" type="text" style="text-align: center;" value="멀티캠퍼스">
													</td>
													<td>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 130px;">
														<input name="appr1" value="apprY" type="radio" checked>
														<span><i></i>Y</span>
														</label>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 10px;">
														<input name="appr1" value="apprN" type="radio">
														<span><i></i>N</span>
														</label>
													</td>
												</tr>
												<tr>
													<td>2</td>
													<td>교육기관</td>
													<td>FSC</td>
													<td>
												    <input class="form-control" type="text" style="text-align: center;" value="패스트캠퍼스">
													</td>
													<td>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 130px;">
														<input name="appr2" value="apprY" type="radio" checked>
														<span><i></i>Y</span>
														</label>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 10px;">
														<input name="appr2" value="apprN" type="radio">
														<span><i></i>N</span>
														</label>
													</td>
												</tr>
												<tr>
													<td>3</td>
													<td>교육기관</td>
													<td>FSS</td>
													<td>
												    <input class="form-control" type="text" style="text-align: center;" value="금융보안원">
													</td>
													<td>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 130px;">
														<input name="appr3" value="apprY" type="radio" checked>
														<span><i></i>Y</span>
														</label>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 10px;">
														<input name="appr3" value="apprN" type="radio">
														<span><i></i>N</span>
														</label>
													</td>
												</tr>
												<tr>
													<td>4</td>
													<td>교육분류</td>
													<td>OTEDU</td>
													<td>
												    <input class="form-control" type="text" style="text-align: center;" value="외부교육">
													</td>
													<td>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 130px;">
														<input name="appr4" value="apprY" type="radio" checked>
														<span><i></i>Y</span>
														</label>
														<label class="fancy-radio" style="width: 20%; float: left; margin-left: 10px;">
														<input name="appr4" value="apprN" type="radio">
														<span><i></i>N</span>
														</label>
													</td>
												</tr>
											</tbody>
										</table>
							     </div>
							<!-- End 코드관리 결과 리스트-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />