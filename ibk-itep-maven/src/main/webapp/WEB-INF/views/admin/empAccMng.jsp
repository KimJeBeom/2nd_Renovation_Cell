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
							<h1 class="page-title" style="margin-bottom: 0px"><b>사용자 계정관리</b></h1>
						</div>
						<div class="panel-body">
							<!-- 교육 modify 버튼 부분-->
							<div class="form-group row" style="text-align: right;">
<!-- 							<div class="form-group row" style="text-align: right; padding-right: 25px;"> -->
								<button class="btn btn-primary" type="button">등록</button>
								<button class="btn btn-primary" type="button">수정</button>
								<button class="btn btn-primary" type="button">삭제</button>
								<button class="btn btn-primary" type="button">엑셀다운로드</button>
							</div>
							<!-- END 교육 modify 버튼 부분-->
						</div>
						<div class="panel-body">
							<div class="form-group row">
								<b>부서</b>
								<input type="text" class="form-control" placeholder="text field" name="dept">
								<b>직원명/직원번호</b>
								<input type="text" class="form-control" placeholder="text field" name="emp">
								<button class="btn btn-primary" type="button">조회</button>
							</div>
						</div>
						<div class="panel-body">
							<div class="form-group row">
								<b>부서</b>
								<input type="text" class="form-control" placeholder="text field" name="dept">
								<b>직원명/직원번호</b>
								<input type="text" class="form-control" placeholder="text field" name="emp">
								<button class="btn btn-primary" type="button">조회</button>
							</div>
						</div>
					<div class="well">
						<table>
							<tbody>
								<tr>
									<td>
										교육분류
									</td>
									<td>
										<select class="form-control" style="text-align: left;">
											<option value="outedu">외부교육</option>
											<option value="inedu">내부교육</option>
											<option value="seminar">세미나</option>
										</select>
									</td>
									<td>
										과목명
									</td>
									<td>
										<input class="form-control" type="text" style="text-align: left;" value="과정명 입력하세요">
									</td>
									<td>
										<button type="button" class="btn btn-primary">조회</button>
									</td>
								</tr>
							</tbody>
						</table>								
					</div>			

					<div class="panel">
						
						<div class="table-responsive">
							<!-- 교육 조회 결과 리스트-->
							<table class="table table-hover">
								<tbody style="vertical-align: center;">
									<tr>
										<th style="width: 5px";><input type="checkbox"></th>
										<th style="width: 65px;">No</th>
										<th style="width: 15px;">교육분류</th>
										<th style="width: 15px;">과목코드</th>
										<th style="width: 15px;">과목명</th>
										<th style="width: 15px;">기관</th>
										<th style="width: 15px;">차수관리</th>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>1</td>
										<td>외부교육</td>
										<td>OTEDU001</td>
										<td style="text-align:left">업무에 바로쓰는 SQL활용실습</td>										
										<td>멀티캠퍼스</td>
										<td><button type="button" class="btn btn-primary">차수추가</button></td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>2</td>
										<td>내부교육</td>
										<td>OTEDU002</td>
										<td style="text-align:left">업무에 바로쓰는 컴파일러 명령어</td>										
										<td>멀티캠퍼스</td>
										<td><button type="button" class="btn btn-primary">차수추가</button></td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>3</td>
										<td>세미나</td>
										<td>OTEDU007</td>
										<td style="text-align:left">고가용성에 대한 다양한 사례 공유</td>										
										<td>레드햇</td>
										<td><button type="button" class="btn btn-primary">차수추가</button></td>
									</tr>									
								</tbody>
							</table>
							<!-- END 교육 조회 결과 리스트-->
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