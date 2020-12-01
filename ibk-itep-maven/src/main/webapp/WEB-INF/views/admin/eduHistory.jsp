<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 수강 이력-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>수강 이력</b>
							</h1>
						</div>
					</div>
					<!-- End 수강 이력-대제목 -->
					<div class="row">
						<div class="panel">
							<div class="panel-body" style="padding-top: 20px">
								<!-- Start 수강이력-조회바 -->
								<div class="well col-md-12"
									style="display: table; padding: 10px; vertical-align: middle">
									<div style="display: table-cell; vertical-align: middle">
										<table>
											<tbody>
												<tr>
													<td style="width: 100px;"><b>기간</b></td>
													<td style="width: 130px; text-align: left">
														<div class="ui calendar" id="edctRangeStart">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i> <input
																	id="edctSttgYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</td>
													<td style="width: 50px;"><b>~</b></td>
													<td style="width: 130px; text-align: left">
														<div class="ui calendar" id="edctRangeEnd">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i> <input
																	id="edctFnshYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</td>
													<td style="width: 150px"><b>교육분류</b></td>
													<td style="width: 150px"><select class="form-control"
														id="edctClsfCd" style="text-align: left;">
															<option value="ALL">전체</option>
															<c:forEach items="${cldVoList }" var="cldVo">
																<option value=${cldVo.edctClsfCd }>${cldVo.edctClsfNm }</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr style="height: 10px"></tr>
												<tr>
													<td style="width: 100px"><b>부서</b></td>
													<td colspan="3"><input class="form-control" id="brnm"
														type="text" style="text-align: left;" placeholder="부서명">
													</td>
													<td style="width: 150px"><b>직원명</b></td>
													<td style="width: 150px"><input class="form-control" id="userNm"
														type="text" style="text-align: left;" placeholder="직원명"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div
										style="display: table-cell; padding-right: 10px; vertical-align: middle">
										<button id="btnSearch" type="button" class="btn btn-primary"
											style="float: right; height: 50px">조회</button>
									</div>
								</div>
								<!-- End 수강이력-조회바 -->
								<!-- Start 수강이력 - 버튼바-->
								<div class="form-group row"
									style="text-align: right; padding-right: 20px;">
									<button id="btnMemoRegPop" class="btn btn-primary" type="button">참고사항 등록/수정</button>
									<button id="xlsDown" class="btn btn-primary" type="button">엑셀 다운로드</button>
								</div>
								<!-- End 수강이력 - 버튼바-->
								
								<form id="excelForm" role="form" method="post" enctype="multipart/form-data">
										<input type="hidden" id="eEdctSttgYmd" name="eEdctSttgYmd" value="">
										<input type="hidden" id="eEdctFnshmd" name="eEdctFnshmd" value="">
										<input type="hidden" id="eEdctClsfCd" name="eEdctClsfCd" value="">
										<input type="hidden" id="eBrnm" name="eBrnm" value="">
										<input type="hidden" id="eUserNm" name="eUserNm" value="">
								</form>
								
								<!-- Start 수강이력 - 리스트 -->
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width: 50px">구분</th>
											<th style="width: 50px">이력ID</th>
											<th>교육분류</th>
											<th>부서명</th>
											<th>팀명</th>
											<th>직원명</th>
											<th>직원번호</th>
											<th>교육ID</th>
											<th>교육명</th>
											<th>교육기관</th>
											<th>교육기간</th>
											<th>예산</th>
											<th>참고</th>
										</tr>
									</thead>
									<tbody id="eduHistoryTbody">
									</tbody>
								</table>
								<!-- End 수강이력 - 리스트 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			selectEduHistory();
		});
		//조회버튼 클릭시
		$(document).on("click","#btnSearch",function(){
			selectEduHistory();
		})
		//참고사항 등록 버튼 클릭
		$(document).on("click","#btnMemoRegPop",function(){
			var radioVal = $('input[name="chkEdctAplcId"]:checked').val();
			if(radioVal != null){
				showPopup('admin','memoRegPop?edctAplcId='+radioVal);	
			}else{
				alert("참고사항 등록할 이력을 선택해 주세요");
			}
		})
		//엑셀 다운로드 클릭
		$(document).on("click","#xlsDown",function(){
			excelDownload();
		})
		//캘린더 구현부
		$('#edctRangeStart').calendar({
			type: 'date',
			endCalendar: $('#edctRangeEnd'),
			formatter: {
				date: function (date, settings) {
					if (!date) return '';
					var day = date.getDate();
					var month = date.getMonth() + 1;
					var year = date.getFullYear();
					return year + '/' + month + '/' + day;
				}}
		});
		$('#edctRangeEnd').calendar({
			type: 'date',
			startCalendar: $('#edctRangeStart'),
			formatter: {
				date: function (date, settings) {
					if (!date) return '';
						var day = date.getDate();
						var month = date.getMonth() + 1;
						var year = date.getFullYear();
						return year + '/' + month + '/' + day;
					}}
		});
		function selectEduHistory() {
			var edctClsfCd = $("#edctClsfCd").val();
			var userNm = $("#userNm").val();
			var brnm = $("#brnm").val();
			var edctSttgYmd = $('#edctSttgYmd').val();
			var edctFnshYmd = $('#edctFnshYmd').val();
		    $.ajax({
		    	url:"/itep/views/admin/selectEduHistory", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {	"edctClsfCd"	: $("#edctClsfCd").val(),
						"userNm"		: $("#userNm").val(),
						"brnm"			: $("#brnm").val(),
						"edctFnshYmd"	: $('#edctFnshYmd').val(),
						"edctSttgYmd"	: $('#edctSttgYmd').val()}, //넘겨줄 데이터
				success: function (responseData) {
					var str = '';
					str += '<tbody  id=\"eduHistoryTbody\">'
					$.each(responseData, function (i){
						str += '<tr>'
						str += '<td><label class=\"fancy-radio\"><input type=\"radio\" name=\"chkEdctAplcId\" value=\"'+responseData[i].edctAplcId+'\"><span><i style=\"margin-top:7px;\"></i></span></label></td>';
						//str += '<td><input type="radio" name="chkEdctAplcId" value='+responseData[i].edctAplcId+'></td>'
						str += '<td>'+responseData[i].edctAplcId+'</td>'
						str += '<td>'+responseData[i].edctClsfNm+'</td>'
						str += '<td>'+responseData[i].brnm+'</td>'
						str += '<td>'+responseData[i].teamNm+'</td>'
						str += '<td>'+responseData[i].userNm+'</td>'
						str += '<td>'+responseData[i].userId+'</td>'
						str += '<td>'+responseData[i].edctId+'</td>'
						str += '<td>'+responseData[i].edctNm+'</td>'
						str += '<td>'+responseData[i].edinNm+'</td>'
						str += '<td>'+responseData[i].edctSttgYmd.replace(/-/g,'.')+'~'+responseData[i].edctFnshYmd.replace(/-/g,'.')+'</td>'
						str += '<td>'+responseData[i].edex+'</td>'
						str += '<td>'+responseData[i].rfrcCon+'</td>'
						str += '</tr>'
					});
					str += '</tbody>'
					$("#eduHistoryTbody").replaceWith(str);
				},
				error: function (xhr, status, error) {
					alert("error");					
				}
			});
		}
		
		function excelDownload() {		
			// 검색창에 입력된값 
			var edctSttgYmd = $('#edctSttgYmd').val();
			var edctFnshYmd = $('#edctFnshYmd').val();
			var edctClsfCd = $('#edctClsfCd option:selected').val();
			var brnm = $('#brnm').val();
			var userNm = $('#userNm').val();
			
			$("#eEdctSttgYmd").attr("value", edctSttgYmd);
			$("#eEdctFnshmd").attr("value", edctFnshYmd);
			$("#eEdctClsfCd").attr("value", edctClsfCd);
			$("#eBrnm").attr("value", brnm);
			$("#eUserNm").attr("value", userNm);
			
			var formObj = $("#excelForm");
			formObj.attr("action", "/itep/views/admin/EduHistoryExcelDown");
			formObj.submit();
		}
	</script>