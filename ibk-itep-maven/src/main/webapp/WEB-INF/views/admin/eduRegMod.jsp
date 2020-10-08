<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

	<style>
		.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
			text-align: center;
			vertical-align: middle;
		}/*  hover table 내의 td 들 가운데 정렬 필요 */
	</style>

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
							<h1 class="page-title" style="margin-bottom: 0px"><b>교육 등록 및 수정</b></h1>
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
						<div class="panel-body">
							<!-- 교육 modify 버튼 부분-->
							<div class="form-group row" style="text-align: right; padding-right: 25px;">
								<button class="btn btn-primary" type="button" onclick="showPopup('admin','newEduRegPop');">등록</button>
								<button class="btn btn-primary" type="button" onclick="showPopup('admin','eduModPop');">수정</button>
								<button class="btn btn-primary" type="button">삭제</button>
								<button class="btn btn-primary" type="button">엑셀업로드</button>
								<button class="btn btn-primary" type="button">엑셀다운로드</button>
							</div>
							<!-- END 교육 modify 버튼 부분-->
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
										<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>2</td>
										<td>내부교육</td>
										<td>OTEDU002</td>
										<td style="text-align:left">업무에 바로쓰는 컴파일러 명령어</td>										
										<td>멀티캠퍼스</td>
										<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>3</td>
										<td>세미나</td>
										<td>OTEDU007</td>
										<td style="text-align:left">고가용성에 대한 다양한 사례 공유</td>										
										<td>레드햇</td>
										<td><button type="button" class="btn btn-primary" onclick="showPopup('admin','addEduRndPop');">차수추가</button></td>
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
</footer>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />