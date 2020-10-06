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
					<h1 class="page-title"><b>과정 개설 신청</b></h1>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<br>
							<div class="table-border">
								<table class="tbl-type5">
									<tbody>
									<tr>
										<td class="info" width="150px"><b>교육분류</b></td>
										<td width="500px">
											<div>
											<select class="form-control">
												<option value="cheese">외부교육</option>
												<option value="tomatoes">신전입교육</option>
												<option value="mozarella">세미나</option>
												<option value="mushrooms">기타</option>
											</select>
											</div>
										</td>
										<td class="info" width="150px"><b>교육구분</b></td>
										<td width="500px">
											<label class="fancy-radio col-md-3">
												<input name="eduType" value="inner" type="radio">
												<span><i></i>행내</span>
											</label>
											<label class="fancy-radio col-md-3">
												<input name="eduType" value="outer" type="radio">
												<span><i></i>행외</span>
											</label>
										</td>                        
									</tr>
									<tr>
										<td class="info"><b>과목명</b></td>
										<td colspan="3">
											<input type="title" name="title" class="form-control" value="">                                    
										</td>
									</tr>  
									<tr>
										<td class="info"><b>교육기관</b></td>
										<td colspan="3">
											<input type="academy" name="academy" class="form-control" value="">
										</td>
									</tr>
									<tr>
										<td class="info"><b>신청기간</b></td>
										<td>
											<div class="col-sm-12">
												<div class='col-sm-4'>
													<div class="form-group">
														<input type='date' name='applyStDt' value='2020-09-22'/>
														<!--<div class='input-group date dateTimePicker' id="datepicker1">
															<input type='date' name='startdate' value='2020-09-22'/>
															<span class="input-group-addon">
																<span class="glyphicon glyphicon-calendar"></span>
															</span>
														</div>-->
													</div>
												</div>
												<div class='col-sm-1'>
													<h4 text-align="center"><b>~</b></h4>
												</div>
												<div class='col-sm-4'>
													<div class="form-group">
														<input type='date' name='applyEdDt' value='2020-09-22'/>
													</div>
												</div>
											</div>
										</td>
										<td class="info"><b>학습기간</b></td>
										<td>
											<div class="col-sm-12">
												<div class='col-sm-4'>
													<div class="form-group">
														<input type='date' name='studyStDt' value='2020-09-22'/>
														<!--<div class='input-group date dateTimePicker' id="datepicker1">
															<input type='date' name='startdate' value='2020-09-22'/>
															<span class="input-group-addon">
																<span class="glyphicon glyphicon-calendar"></span>
															</span>
														</div>-->
													</div>
												</div>
												<div class='col-sm-1'>
													<h4 text-align="center"><b>~</b></h4>
												</div>
												<div class='col-sm-4'>
													<div class="form-group">
														<input type='date' name='studyEdDt' value='2020-09-22'/>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육시간</b></td>
										<td>
											<div class="row">
												<div class="col-lg-2">
													<input type="text" id="studyStTm" name="studyStTm" class="form-control input-sm" value="09:00">
												</div>
												<label class="col-md-1 col-form-label form-control-label text-muted">~</label>
												<div class="col-lg-2">
													<input type="text" id="studyEdTm" name="studyEdTm" class="form-control input-sm" value="12:00" >
												</div>
											</div>
										<td class="info"><b>교육비용</b></td>
										<td>
											<div class="col-lg-3">
												<input type="eduCost" name="fax" class="form-control" value="">
												<span><i></i>원</span>
											</div>
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육방식</b></td>
										<td>
											<label class="fancy-radio col-md-3">
												<input name="placetype" value="online" type="radio">
												<span><i></i>온라인</span>
											</label>
											<label class="fancy-radio col-md-3">
												<input name="placetype" value="offline" type="radio">
												<span><i></i>오프라인</span>
											</label>
										</td>
										<td class="info"><b>교육수준</b></td>
										<td>
											<label class="fancy-radio col-md-2">
												<input name="eduLvl" value="high" type="radio">
												<span><i></i>상</span>
											</label>
											<label class="fancy-radio col-md-2">
												<input name="eduLvl" value="middle" type="radio">
												<span><i></i>중</span>
											</label>
											<label class="fancy-radio col-md-2">
												<input name="eduLvl" value="low" type="radio">
												<span><i></i>하</span>
											</label>
										</td>
									</tr>
									<tr>
										<td class="info"><b>첨부파일</b></td>
										<td colspan="3">
											<div>
												<input multiple="multiple" type="file" name="file" class="form-control" value="dd">
												<!--
												<input class="form-control col-md-1" type="text" style="height: auto; width: 90%;">
												<span class="input-group-btn"><button class="btn btn-info" type="button">파일첨부</button></span>
												-->
											</div>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
							</br>
							<div class="form-group row" style="text-align:center">
								<div class="col-lg-12">
									<input type="button" class="btn btn-primary btn-lg mr-2" value="신청">
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

