<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 결재할 문서 > 결재반려 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main" style="padding-top: 10px;">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

					<!-- 상단 버튼 -->
					<button type="button" class="btn btn-primary btn-toastr btn-top" style="float: right; vertical-align: bottom;" onclick="apprRej();">등록</button><br><br>

					<!-- 반려사유 테이블 -->
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
								<div class="panel-body panel-popup">
									<table class="table table-bordered tbl-type3">
										<tbody>
											<tr>
												<th>반려사유</th>
												<td>
													<textarea class="form-control" rows="6" id="rtreCon"></textarea>
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
	</div>
	<!-- END WRAPPER -->
	
	<script type="text/javascript">
	
		//결재반려 처리
		function apprRej() {
			if( $('#rtreCon').val() == "") {
				confirm("반려사유를 입력해주세요.");
			}
			else {
				if (confirm("반려하시겠습니까?") == true) {
					var checkbox = $('input[name="checkbox"]:checked', opener.document); // 부모창에서 선택된 체크박스 (opener.document)
					var aplcIdArr = new Array(); // 선택된 교육신청ID를 담기위한 배열
						 
					// 부모창에서 체크된 체크박스 값을 하나씩 가져온다
					checkbox.each(function(i) {
						var tr = checkbox.parent().parent().parent().eq(i); // checkbox의 부모의 부모의 부모는 tr
						var td = tr.children(); // tr의 자식은 td들
						
						aplcIdArr.push(td.eq(6).text());
					});		
					
					$.ajax({ 
		            	url:"/itep/views/apprMng/apprRej", //데이터를  넘겨줄 링크 설정
		    		    type:"POST", // post 방식
		    			data: {"aplcIdArr" : aplcIdArr,
		    				   "rtreCon" : $('#rtreCon').val() }, //넘겨줄 데이터
				        	
				        success: function (responseData) {	
				        	if(responseData == 1) {
				        		confirm("반려되었습니다."); // 결과가 1이면 정상적으로 반려처리 완료
				        		window.close();
					     		window.opener.location.reload();
				        	} else {
				        		confirm("실패하였습니다. 다시 시도해주십시오."); // 1이 아니면 승인 실패
				        		window.close();
					     		window.opener.location.reload();
				        	}
						},
						error: function (xhr, status, error) {
							confirm("실패하였습니다. 다시 시도해주십시오."); // 1이 아니면 승인 실패
			        		window.close();
				     		window.opener.location.reload();
						}
				 	});
				} else {
				     return false;
				}
			}		
		}
	</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
