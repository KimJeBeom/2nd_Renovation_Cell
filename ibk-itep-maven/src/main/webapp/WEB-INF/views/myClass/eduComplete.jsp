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
				<!-- page title -->
					<div class="row"> 
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"><b>수강완료한 교육</b></h3>
							</div>
							<div class="panel-body">
								<h3 class="panel-title" style="margin-bottom: 10px;"><b>▶ 수료한 교육</b></h3>
								<div class="panel-body">
								<b>
									기간&nbsp;
									<input type='date' name='startdate' value='2020-09-22'/>
									&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type='date' name='enddate' value='2020-09-22'/>
								</b>
							</div>
								<table class="table table-hover">
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>상세확인</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>
												<button type="button" class="btn btn-primary" onclick="showPopup('eduApply','eduInfoPop');">확인</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>현민지의 3병이 제일 쉬웠어요</td>
											<td>주작cmp</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>
												<button type="button" class="btn btn-primary" onclick="showPopup('eduApply','eduInfoPop ');">확인</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>	
						</div> 
					</div>			
				</div>
				<!-- end page title -->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
