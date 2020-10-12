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
			 <h3 class="page-title"><b>자료실 등록</b></h3>
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
								<th>제목</th>
								<td>
									<input type="title" name="title" class="form-control" value="">                                    
								</td>
								<th>등록일</th>
								<td>
									<input type="reg" name="reg" class="form-control" value="2020-09-25">                                    
								</td>
							 </tr>
							 <tr>
								<th>첨부파일</th>
								<td colspan="3">
									<input multiple="multiple" type="file" name="file" class="form-control" value="">
									<!--
								   <span>
									   <span class="input-group-btn"><button class="btn btn-default btn-xs" type="button">첨부</button></span>
								   </span>
								   -->
								</td>
							 </tr>
							 <tr>
								<td class="txt-long" colspan="4">
									<form>
										<p><textarea placeholder="공지내용을 입력하세요" style="width:100%; height: 200px;"></textarea></p>
									</form>
								</td>
							 </tr>
						  </tbody>
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
 <!-- Javascript -->
 <script>
	/* 팝업 */
    function showEduApplyPop() {
       window.open('eduApplyPop.jsp', 'eduApplyPop', 'location=no, width=750, height=600, left=100, top=100');
    };
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
