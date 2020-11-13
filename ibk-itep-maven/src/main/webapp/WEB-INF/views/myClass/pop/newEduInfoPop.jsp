<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	내학습실 > 과정개설신청현황 > 과정개설 신청 상세확인 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

					<!-- 상단 버튼 -->
					<button type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom; ">확인</button><br><br>
					
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 과정개설신청 상세내역 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>부서명</th>
											<td>IT금융개발부</td>
											<th>직원명</th>
											<td>장기은</td>
										</tr>
										<tr>
											<th>교육구분</th>
											<td>행외</td>
											<th>교육기관</th>
											<td colspan="3">Amazon</td>
										</tr>
										<tr>
											<th>과목명</th>
											<td colspan="3">AWS SUMMIT SEOUL</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">AWS를 이용한 클라우드 구축 사례</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>20200917 ~ 20200918</td>
											<th>신청기간</th>
											<td>20200901 ~ 20200910</td>
										</tr>
										<tr>
											<th>교육시간</th>
											<td>09:00 ~ 17:00</td>
											<th>교육비용</th>
											<td>50,000원</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>오프라인</td>
											<th>교육수준</th>
											<td>중급</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td class="txt-long" colspan="3">AWS SUMMIT SEOUL(SAVE THE DATE) 소개.pdf</td>
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

