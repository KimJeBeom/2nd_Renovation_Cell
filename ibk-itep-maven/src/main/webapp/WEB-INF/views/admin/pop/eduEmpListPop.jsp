<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 신청현황 > 교육신청 직원목록
-->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 교육 내용 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>과목명</th>
											<td colspan="3">2020년 제1회 금융IT세미나</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">클라우드 개념의 이해 및 금융권 적용 사례</td>
										</tr>
										<tr>
											<th>교육기간</th>
											<td colspan="3">20200908 ~ 20200908</td>
										</tr>
									</tbody>
								</table>


								<!-- 교육신청 직원목록 -->
								<h4 style="float: left;">교육신청 직원목록</h4>
								<button type="button" class="btn btn-primary btn-toastr btn-top">엑셀 다운로드</button>

								<table class="table table-bordered tbl-type2">
								<thead>
									<tr>
										<th>No</th>
										<th>부서</th>
										<th>직원번호</th>
										<th>직원명</th>
										<th style="width:50px;">수료</th>
										<th style="width:50px;">미수료</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>IT기획부</td>
										<td>50000</td>
										<td>김기은</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_1" value="y" type="radio" checked/><span><i style="margin-right:0"></i></span>										
											</label>
										</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_1" value="n" type="radio"/><span><i style="margin-right:0"></i></span>
											</label>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>IT시스템운영팀</td>
										<td>50001</td>
										<td>박기은</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_2" value="y" type="radio" checked/><span><i style="margin-right:0"></i></span>										
											</label>
										</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_2" value="n" type="radio"/><span><i style="margin-right:0"></i></span>
											</label>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>IT금융개발부</td>
										<td>50002</td>
										<td>이기은</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_3" value="y" type="radio" checked/><span><i style="margin-right:0"></i></span>										
											</label>
										</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_3" value="n" type="radio"/><span><i style="margin-right:0"></i></span>
											</label>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>IT금융개발부</td>
										<td>50003</td>
										<td>정기은</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_4" value="y" type="radio" checked/><span><i style="margin-right:0"></i></span>										
											</label>
										</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_4" value="n" type="radio"/><span><i style="margin-right:0"></i></span>
											</label>
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td>IT금융개발부</td>
										<td>50004</td>
										<td>강기은</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_5" value="y" type="radio" checked/><span><i style="margin-right:0"></i></span>										
											</label>
										</td>
										<td>
											<label class="fancy-radio" style="margin-bottom:0px;">
												<input name="ctcr_5" value="n" type="radio"/><span><i style="margin-right:0"></i></span>
											</label>
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

