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
					<button type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom;" onclick="addEduCd();">등록</button><br><br>

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
													<option value="CLI">교육기관</option>
													<option value="CLD">교육분류</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>코드ID</th>
											<td>
												<input id="cd" type="text" class="form-control" placeholder="코드ID">
											</td>
										</tr>
										<tr>
											<th>코드명</th>
											<td>
												<input id="nm" type="text" class="form-control" placeholder="코드명">
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

<script>
	function addEduCd() {
		if(confirm("등록하시겠습니까?") == true){
			var eduCdType = $('#eduCdType').val(); // 코드분류
			var cd = $('#cd').val(); // 코드ID
			var nm = $('#nm').val(); // 코드명	
			alert(eduCdType+" "+cd+" "+nm);
			
			$.ajax({
			   	url:"/itep/views/admin/pop/addEduCd", //데이터를  넘겨줄 링크 설정
			    type:"POST", // post 방식
				data: {"eduCdType": eduCdType, //넘겨줄 데이터
					   "cd": cd,
					   "nm": nm},				
				success: function (result) {
					if(result == 1) {
			       		alert("완료되었습니다.");
				       	window.close();
				       	opener.parent.location.reload();
					} else if(result == -1){
						alert("코드ID가 이미 존재합니다.");
					} else {
						alert("실패하였습니다. 다시 시도해주십시오.");
				       	window.close();
				       	opener.parent.location.reload();
					}
				},
				error: function (xhr, status, error) { alert("통신실패"); }
			}); 
		} else {
			return false;
		}
	}
</script>