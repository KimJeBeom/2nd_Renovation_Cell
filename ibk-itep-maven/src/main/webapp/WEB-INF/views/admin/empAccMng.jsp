<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<!-- Start 사용자 계정관리-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png" height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">&nbsp;&nbsp;<b>사용자 계정관리</b></h1>
						</div>
					</div>
					<!-- End 사용자 계정관리-대제목 -->
					<!-- Start 사용자 계정관리-본문 -->
					<div class="panel">
						<div class="panel-body" style="padding-top:20px">
							
							<!--Start-직원관련 inputline1 부분-->
							<div class="well col-md-12" style="display: table; padding: 10px; margin-top: 10px">
								<div style="display: table-cell; vertical-align: middle">
									<table>
										<tbody>
											<tr>
												<td style="width: 100px"><b>부서</b></td>
												<td style="width: 200px">
													<select id="brcd" class="form-control" style="text-align: left;">
														<option value="ALL">전체</option>
														<c:forEach items="${cmbList }" var="cmblist">
															<option value=${cmblist.brcd }>${cmblist.brnm }</option>		
														</c:forEach>
													</select>
												</td>
												<td style="width: 200px; padding-left:20px;"><b>직원명/직원번호</b></td>
												<td style="width: 200px">
													<input id="userIdNm" class="form-control" type="text" style="text-align: left;">
												</td>
												<td style="width: 110px; padding-left:10px;"><b>권한</b></td>
												<td style="width: 150px">
													<select id="athrCd" class="form-control" style="text-align: left;">
														<option value="ALL">전체</option>
														<c:forEach items="${claList }" var="clalist">
															<option value=${clalist.athrCd }>${clalist.athrNm }</option>		
														</c:forEach>
													</select>
												</td>
												<td>
													<div class="form-group col-md-12" style="margin:10px 0px 10px 50px; width:80px;">
														<button type="button" class="btn btn-primary" onclick="search()">조회</button>
													</div>
												</td>
												<td>
													<div class="form-group col-md-12" style="margin:10px 0px 10px 10px; width:100px;">
														<button type="button" class="btn btn-primary" onclick="excelDownload()">엑셀다운로드</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<form id="excelForm" role="form" method="post" enctype="multipart/form-data">
										<input type="hidden" id="eBrcd" name="brcd" value="">
										<input type="hidden" id="eUserIdNm" name="userIdNm" value="">
										<input type="hidden" id="eAthrCd" name="athrCd" value="">
									</form>
								</div>
							</div>
							<!--End-직원관련 inputline1 부분-->

							<!-- Start-직원 조회 리스트 부분-->
								<table class="table table-hover tbl-type2">
									<thead>
										<tr>
											<th style="width:70px;">직원번호</th>
											<th style="width:70px;">직원명</th>
											<th style="width:70px;">직책</th>
											<th style="width:70px;">행내전화</th>
											<th style="width:70px;">부서명</th>
											<th style="width:100px;">권한</th>
										</tr>
									</thead>
									
									<tbody id="empAccTBody">
										<c:forEach items="${empAccList }" var="empacclist" varStatus="status">
											<tr>
												<td>${empacclist.userId }</td>
												<td>${empacclist.userNm }</td>
												<td>${empacclist.userJtm }</td>
												<td>${empacclist.userTpn }</td>
												<td>${empacclist.brnm }</td>
												<td style="display:none;">${empacclist.athrCd }</td>
												<td>
													<select class="form-control athrSelBox" style="text-align: left; width:80%; margin-left:30px;"> 
													<!--<select class="form-control" style="text-align:left;">-->
														<c:forEach items="${claList }" var="clalist"> 
															<option value="${clalist.athrCd }" 
																<c:if test="${clalist.athrCd eq empacclist.athrCd }"> selected</c:if>>
																${clalist.athrNm }
															</option>		
														</c:forEach>
													</select>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- nextPage설정 -->
								<div id="page" style="text-align:center">
									<button class="btn btn-primary btn-xs" id='prvsPage' onclick="search('prvs');">◀</button>
									&nbsp;
									<input type="text" id="pageNum" value=1 style="width:30px; text-align:center">&nbsp;/
									<label id="listCnt" style="width:30px; text-align:center" >${listSize}</label>
									<!-- <button class="btn btn-default btn-xs" id='movePage' onclick="search('move');">이동</button> --> 
									<button class="btn btn-primary btn-xs" id='nextPage' onclick="search('next');">▶</button>
								</div> 
						</div>
						<!-- End-직원 조회 리스트 부분-->
					</div>
					<!-- Start 사용자 계정관리-본문 -->
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	
	<script>
	
		// Enter 키 눌렀을 때 검색
		$("#brcd").keyup(function(e){if(e.keyCode == 13)  search(); });
		$("#userIdNm").keyup(function(e){if(e.keyCode == 13)  search(); });
		$("#athrCd").keyup(function(e){if(e.keyCode == 13)  search(); });
		$("#pageNum").keyup(function(e){if(e.keyCode==13) search('move'); });
		
		// 검색
		function search(ctrlPage) {
			var pageNum = parseInt($('#pageNum').val());
			var listSize = parseInt('${listSize}');
			
			if(ctrlPage=="prvs"){
		  		pageNum = pageNum-1;
				if(pageNum <= 0){
					alert("이전페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="next"){
				pageNum = pageNum+1;
				if(pageNum > listSize){
					alert("다음페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="move"){
				if(pageNum > listSize){
					alert("이동값이 전체 페이지보다 클수 없습니다.");
					return;
				}
			}else {
				pageNum = -1;
			}
			
			// 검색창에 입력된값 
			var brcd = $('#brcd option:selected').val();
			var userIdNm = $('#userIdNm').val();
			var athrCd = $('#athrCd option:selected').val();
			
			$.ajax({
		    	url:"/itep/views/admin/empAccMngSearch", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"brcd" : brcd,
					   "userIdNm" : userIdNm,
					   "athrCd" : athrCd,
						"pageNum" : pageNum}, //넘겨줄 데이터
				
				success: function (result) {
					reDrawTable(result.list, result.claList, result.listSize, pageNum);
				},
				error: function (xhr, status, error) { alert("통신실패"); }
			});
		}	
		
		// 권한 변경 처리
		$(document).on("change",".athrSelBox", function(ctrlPage){
			var pageNum = parseInt($('#pageNum').val());
			var listSize = parseInt('${listSize}');
			
			if(ctrlPage=="prvs"){
		  		pageNum = pageNum-1;
				if(pageNum <= 0){
					alert("이전페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="next"){
				pageNum = pageNum+1;
				if(pageNum > listSize){
					alert("다음페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="move"){
				if(pageNum > listSize){
					alert("이동값이 전체 페이지보다 클수 없습니다.");
					return;
				}
			}else {
				pageNum = -1;
			}
			
			var athrCdTobe = this.value; // 변경 후 권한코드
			var athrCdAsis = $(this).parent().parent().children().eq(6).text();
			var userId = $(this).parent().parent().children().eq(1).text(); // 권한 변경할 직원 번호

			// 검색창에 입력된값 
			var brcd = $('#brcd option:selected').val();
			var userIdNm = $('#userIdNm').val();
			var athrCd = $('#athrCd option:selected').val();
			
			if (confirm("변경하시겠습니까?") == true){
				$.ajax({
					url:"/itep/views/admin/updateEmpAccMng", //데이터를  넘겨줄 링크 설정
				    type:"POST", // post 방식
					data: {"userId" : userId,
						   "athrCdTobe" : athrCdTobe,
						   "brcd" : brcd,
						   "userIdNm" : userIdNm,
						   "athrCd" : athrCd,
						   "pageNum" : pageNum}, //넘겨줄 데이터
						
					success: function (result) {
						confirm("변경되었습니다.");
						reDrawTable(result.list, result.claList, result.listSize, pageNum);
					},
					error: function (xhr, status, error) { alert("통신실패"); }
				});
			 } else {
				 $(this).val(athrCdAsis).prop("selected", true); // 변경 전 권한 보여줌
				 return false;
			 } 
		});
		
		// 사용자 테이블 다시 그리는 함수
		function reDrawTable(list, claList, listSize, pageNum) {
			var str = '';
			str += '<tbody id=\"empAccTBody\">';
			if(list.length != 0) {
				$.each(list, function(i, list) {
					str += '<tr>';
					str += '<td>'+list.userId+'</td>';
					str += '<td>'+list.userNm+'</td>';
					str += '<td>'+list.userJtm+'</td>';
					str += '<td>'+list.userTpn+'</td>';
					str += '<td>'+list.brnm+'</td>';
					str += '<td style="display:none;">'+list.athrCd+'</td>';
					str += '<td>';
					str += '<select class="form-control athrSelBox" style="text-align: left;">';
					// 권한 셀렉트박스 출력
					$.each(claList, function(j, clalist) {
						if(clalist.athrCd == list.athrCd) 
							str += '<option value='+clalist.athrCd+' selected>'+clalist.athrNm+'</option>';
						else
							str += '<option value='+clalist.athrCd+'>'+clalist.athrNm+'</option>';
					})
					str += '</select>';
					str += '</td>';
					str += '</tr>';
				});
				$('#page').show();
			} else {
				str += '<tr height="100">';
				str += '<td colspan="8" class="txt_center"><h4>조회 결과가 없습니다.</h4></td>';
				str += '</tr>';
				$('#page').hide();
			}
			str += '</tbody>';
			$('#empAccTBody').replaceWith(str);
			
			if(pageNum == -1) {
				$('#pageNum').val(1);
				$('#listCnt').html(listSize);
			} else 
				$('#pageNum').val(pageNum);
		}
		
		function excelDownload() {		
			// 검색창에 입력된값 
			var brcd = $('#brcd option:selected').val();
			var userIdNm = $('#userIdNm').val();
			var athrCd = $('#athrCd option:selected').val();
			
			$("#eBrcd").attr("value", brcd);
			$("#eUserIdNm").attr("value", userIdNm);
			$("#eAthrCd").attr("value", athrCd);
			
			var formObj = $("#excelForm");
			formObj.attr("action", "/itep/views/admin/EmpAccMngExcelDown");
			formObj.submit();
		}
	</script>