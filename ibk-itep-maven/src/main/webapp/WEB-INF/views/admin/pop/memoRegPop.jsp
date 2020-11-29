<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h3 class="page-title">
						<b>참고사항 등록</b>
					</h3>
					<div class="row">
						<div class="col-md-9 col-popup">
							<!-- INPUTS -->
							<div class="panel panel-headline">
								<div class="panel-body panel-popup">
									<div style="text-align: right; padding-bottom: 10px;">
										<button id="btnConfirm" type="button" class="btn btn-primary btn-toastr">등록</button>
									</div>
									<table class="table table-bordered tbl-type1">
										<tbody>
											<tr>
												<th>부서명</th>
												<td id="brnm"></td>
												<th>직원명</th>
												<td id="userNm"></td>
											</tr>
											<tr>
												<th>과목명</th>
												<td colspan="3" id="edctNm"></td>
											</tr>
											<tr>
												<th>교육기간</th>
												<td id="edctRangeYmd"></td>
												<th>교육기관</th>
												<td id="edinNm"></td>
											</tr>
											<tr>
												<th colspan="4">참고사항등록</th>
											</tr>
											<tr>
												<td class="txt-long" colspan="4"><textarea id="rfrcCon"
														placeholder="참고사항을 입력하세요"
														style="width: 100%; height: 200px;"></textarea> </td>
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

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	<script type="text/javascript">
	$(document).ready(function() {
		setEdaValue();
	});
	$(document).on("click","#btnConfirm",function(){
		if(confirm("참고사항을 등록 하시겠습니까?")){
			updateRfrcCon();	
		}		
	})
	function setEdaValue(){
		var edctSttgYmd = "${eduHistoryVo.edctSttgYmd }";
		var edctFnshYmd = "${eduHistoryVo.edctFnshYmd }";
		$("#brnm").text("${eduHistoryVo.brnm }");
		$("#userNm").text("${eduHistoryVo.userNm }");
		$("#edctNm").text("${eduHistoryVo.edctNm }");
		$("#edctRangeYmd").text(edctSttgYmd.replace(/-/g,'.')+'~'+edctFnshYmd.replace(/-/g,'.'));
		$("#edinNm").text("${eduHistoryVo.edinNm }");
		$("#rfrcCon").val("${eduHistoryVo.rfrcCon}");		
	}
	function updateRfrcCon(){
	    $.ajax({
	    	url:"/itep/views/admin/pop/updateRfrcCon", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data:{	"edctAplcId"	: ${param.edctAplcId },
					"rfrcCon"		: $('#rfrcCon').val()			}, //넘겨줄 데이터
			success: function (responseData) {
					alert("정상적으로 등록 되었습니다");
					opener.location.reload();
					window.open("about:blank", "_self").close();
			},
			error: function (xhr, status, error) {
				alert("등록 에러입니다");
				
			}
		});	
	}	
	</script>