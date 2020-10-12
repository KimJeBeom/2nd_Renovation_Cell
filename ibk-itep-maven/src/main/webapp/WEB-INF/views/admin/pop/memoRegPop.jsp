<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
   <!-- WRAPPER -->
   <div id="wrapper">
	<!-- MAIN -->
	<div class="main">
	   <!-- MAIN CONTENT -->
	   <div class="main-content">
		  <div class="container-fluid">
			 <h3 class="page-title"><b>참고사항 등록</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
				   <div class="panel-body panel-popup">
					<div style="text-align:right; padding-bottom: 10px;">
						<button type="button" class="btn btn-primary btn-toastr">등록</button>
					</div>
					  <table class="table table-bordered tbl-type1">
						 <tbody>
							<tr>
							   <th>부서명</th>
							   <td>IT기획부</td>
							   <th>직원명</th>
							   <td>김기은</td>
							</tr>
							<tr>
							   <th>과목명</th>
							   <td colspan="3">R을 이용한 데이터분석</td>
							</tr>
							<tr>
							   <th>교육기간</th>
							   <td>2019-11-11 ~ 2019-11-15</td>
							   <th>교육기관</th>
							   <td>멀티캠퍼스</td>
							</tr>
							<tr>
								<th colspan="4">참고사항등록</th>
							</tr>
							<tr>
								<td class="txt-long" colspan="4">
									<textarea placeholder="참고사항을 입력하세요" style="width:100%; height: 200px;"></textarea>
								</tb>
							</tr>
						 </tbody
						 >
					  </table>
				   </div>
				   </div>
				   <!-- END INPUTS -->
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
