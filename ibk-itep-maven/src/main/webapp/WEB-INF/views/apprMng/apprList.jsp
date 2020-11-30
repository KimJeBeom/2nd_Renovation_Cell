<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 결재할 문서
 -->

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
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle"><img src="/itep/assets/itep/img/icon/apprmng-icon-big.png" height="36px" ></div>
						<div style="display: table-cell; vertical-align: middle"><h1 class="page-title" style="vertical-align: middle;">&nbsp;&nbsp;<b>결재 할 문서</b></h1></div>						 	
					</div>
					<div class="row">
					
						<div id="toastr-demo" class="panel">
						
							<!-- 결재 목록 -->
							<div class="panel-heading">
								<h4 class="pannel-title"><b>▶ &nbsp;&nbsp;결재 목록</b></h4>
							</div>
							<div class="panel-body" style="overflow-x:hidden; height:350px;">
								<!-- <h4 class="panel-title" style="float:left;"><b>▶ 결재 목록</b></h4> -->
								
								<!-- 상단 버튼 -->
								<button type="button" class="btn btn-primary btn-toastr btn-top" onclick="apprRej();">반려</button>
								<button type="button" class="btn btn-primary btn-toastr btn-top" onclick="apprConf();">승인</button>
							
								<!-- 결재 목록 테이블 (TOGGLE 적용)-->
								<table class="table table-hover tbl-type2">
									<thead>
										<tr>
											<th>
												<label class="fancy-checkbox" onclick="event.cancelBubble=true">
													<input type="checkbox" name="checkAll"><span></span>
												</label>
											</th>
											<th style="width: 10px;">NO</th>
											<th>부서명</th>
											<th>직원명</th>
											<th style="width: 200px;">신청교육</th>
											<th>신청일시</th>
										</tr>
									</thead>
									<tbody id="apprListBody">
										<c:choose>
											<c:when test="${not empty apprList}">
												<c:forEach items="${apprList }" var="apprlist" varStatus="status">
													<tr data-toggle="tab" data-target="#table" onclick="showDetail(this, ${apprlist.edctAplcId });">
														<td>
															<label class="fancy-checkbox" onclick="event.cancelBubble=true">
																<input type="checkbox" name="checkbox"><span></span>
															</label>
														</td>
														<td>${status.count }</td>
														<td>${apprlist.brnm }</td>
														<td>${apprlist.userNm }</td>
														<td>${apprlist.edctNm }</td>
														<td>${apprlist.aplcTs }</td>
														<!-- 체크된 row의 교육신청ID를 넘겨주기 위한 숨겨진 요소 -->
														<td style="display:none">${apprlist.edctAplcId }</td>
													</tr>
											    </c:forEach>
										    </c:when>
											<c:otherwise>
											<tr height="200">
												<td colspan="7" class="txt_center"><h4>결재 할 문서가 없습니다.</h4></td>
											</tr>
											</c:otherwise>
										</c:choose>	
									</tbody>
								</table>
								
								<br>
								
								<!-- apprList가 하나도 없으면 apprDetail == null (Controller에서 지정) -->
								<!-- apprDetail 이 not null일 때만 아래 화면 보여줌 -->
								<c:if test="${not empty apprDetail}">
									<div class="panel-heading">
										<h4 class="pannel-title"><b>▶ &nbsp;&nbsp;결재 내용</b></h4>
									</div>
									<!-- <h4 class="panel-title" style="float:left;"><b>▶ 상세내용</b></h4> -->
									<!-- 위의 결재항목별 교육상세설명 테이블 (TOGGLE 적용) -->
									<div id="tab-content" class="tab-content">
										<!-- 테이블 1 -->
										<div class="tab-pane fade in active" id="table" style="padding:0px 0px 10px 0px;">
											<div class="table-responsive">
												<table class="table tbl-type1">
													<tbody>
														<tr>
															<th>과목명</th>
															<td colspan="3" id="edctNm">${apprDetail.edctNm }</td>
														</tr>
														<tr>
															<th>교육내용</th>
															<td class="txt-long" colspan="3" id="edctCon"><br>${apprDetail.edctCon }<br><br></td>
														</tr>
														<tr>
															<th>교육기관</th>
															<td colspan="3" id="edinNm">${apprDetail.edinNm }</td>
														</tr>
														<tr>
															<th>교육방식</th>
															<td id="onlEdctYn">${apprDetail.onlEdctYn }</td>
															<th>교육수준</th>
															<td id="edctLevl">${apprDetail.edctLevl }</td>
														</tr>
														<tr>
															<th>학습기간</th>
															<td id="edctYmd">${apprDetail.edctSttgYmd } ~ ${apprDetail.edctFnshYmd}</td>
															<th>신청기간</th>
															<td id="aplcYmd">${apprDetail.aplcSttgYmd } ~ ${apprDetail.aplcFnshYmd}</td>
														</tr>
														<tr>
															<th>제출파일</th>
															<td colspan="3" id="apndDat">${apprDetail.apndDat }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>																	
								</c:if>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		var tbody = document.getElementById('apprListBody');
		var trs = tbody.getElementsByTagName('tr');
	
		HighLightTableTr(trs[0]);	
	});
	
	// 결재건 클릭 시 상세내역 동적변경을 위한 함수
	function showDetail(target, edctAplcId) {
		HighLightTableTr(target);
		
	    $.ajax({
	    	url:"/itep/views/apprMng/apprListDetail", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터
			
			success: function (responseData) {						
				// apprDetail 결과값을 테이블에 동적으로 반영
				$('#edctNm').html(responseData.edctNm);
				$('#edctCon').html('<br>'+responseData.edctCon+'<br><br>');
				$('#edctLevl').html(responseData.edctLevl);
				$('#onlEdctYn').html(responseData.onlEdctYn);
				$('#edctYmd').html(responseData.edctSttgYmd+' ~ '+responseData.edctFnshYmd);
				$('#aplcYmd').html(responseData.aplcSttgYmd+' ~ '+responseData.aplcFnshYmd);
				$('#apndDat').html(responseData.apndDat);
			},
			error: function (xhr, status, error) { }
		});
	}		
	
	// 결재 승인
	function apprConf() {
		var checkbox = $('input[name="checkbox"]:checked'); // 선택된 체크박스
		var checkedLength = checkbox.length; // 선택된 체크박스의 개수
		
		// 체크된게 하나도 없으면 에러메세지 띄움
		if(checkedLength == 0) {
			alert("선택된 결재건이 없습니다.");
		} 
		
		// 체크된 결재건의 승인처리
		// 체크된 row의 교육신청ID를 배열에 담아 넘김
		else {
			
			 if (confirm("승인하시겠습니까?") == true){
				 var aplcIdArr = new Array(); // 선택된 교육신청ID를 담기위한 배열
				 
				// 체크된 체크박스 값을 하나씩 가져온다
				checkbox.each(function(i) {
					var tr = checkbox.parent().parent().parent().eq(i); // checkbox의 부모의 부모의 부모는 tr
					var td = tr.children(); // tr의 자식은 td들
					
					aplcIdArr.push(td.eq(6).text());
				});
			       
			    $.ajax({ 
	            	url:"/itep/views/apprMng/apprConf", //데이터를  넘겨줄 링크 설정
	    		    type:"POST", // post 방식
	    			data: {"aplcIdArr" : aplcIdArr}, //넘겨줄 데이터
			        	
			        success: function (responseData) {		
			        	if(responseData == 1) {
			        		confirm("승인이 완료되었습니다"); // 결과가 1이면 정상적으로 승인처리 완료
			        		window.location.href = "/itep/views/apprMng/apprList";
			        	} else {
			        		confirm("실패하였습니다. 다시 시도해주십시오."); // 1이 아니면 승인 실패
			        		window.location.href = "/itep/views/apprMng/apprList";
			        	}
					},
					error: function (xhr, status, error) {}
			 	});
			 }else{
			     return false;
			 }
		}
	}
		
	// 결재반려 
	function apprRej() {
		var checkedLength = $('input[name="checkbox"]:checked').length; // 선택된 체크박스의 개수
					
		if(checkedLength != 0) { // 체크된게 하나라도 있으면 결재반려 팝업 띄움
			showPopup('apprMng','apprRejectPop');
		} 
		else { // 체크된게 하나도 없으면 에러메세지 띄움
			alert("선택된 결재건이 없습니다.");
		}
	}
	
</script>