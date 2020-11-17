<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- 대제목 Start -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/myclass-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>수강 신청한 교육</b>
							</h1>
						</div>
					</div>
					<!-- 대제목 End -->
					<!-- 본문 Start -->
					<div class="row">
						<div class="panel">
							<!-- Start 과정개설 신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<b>▶ &nbsp;&nbsp;과정개설 신청목록</b>
								</h4>
							</div>
							<!-- End 과정개설 신청목록-소제목 -->
							<!-- Start 과정개설 신청목록-리스트 -->
							<div class="panel-body" style="overflow-x:hidden; height:250px;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>담당자 확인여부</th>
										</tr>
									</thead>
									<tbody>
							<c:choose>
								<c:when test="${not empty eduNewList}">
									<c:forEach items="${eduNewList}" var="eduNewList">
										<c:set var="sum" value="${sum+1}"/>
										<tr>
											<td>${sum}</td>
											<td>${eduNewList.edctNm }</td>
											<td>${eduNewList.edinNm }</td>
											<td>${eduNewList.edctSttgYmd } ~ ${eduNewList.edctFnshYmd }</td>
											<td>${eduNewList.aplcTs }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="window.open('/itep/views/myClass/pop/newEduInfoPop?aplcId='+${eduNewList.aplcId},'newEduInfoPop','_blank');">확인</button>
											</td>
											<td>${eduNewList.cnfaYn }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr height="130">
										<td colspan="7" class="txt_center"><h4>개설 신청한 과정이 없습니다.</h4></td>
									</tr>
								</c:otherwise>
							</c:choose>
									</tbody>
								</table>
							</div>
							<!-- End 과정개설 신청목록-리스트 -->
							<!-- Start 수강신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<br><b>▶&nbsp;&nbsp; 수강신청 목록</b>
								</h4>
							</div>
							<!-- End 수강신청목록-소제목 -->
							<div class="panel-body" style="overflow-x:hidden; height:250px;">
								<!-- Start 수강신청목록-리스트 -->
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th style="width: 150px;">과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>결재진행</th>
											<th>취소</th>
										</tr>
									</thead>
									<tbody>
							<c:choose>
								<c:when test="${not empty eduReadyList}">
									<c:forEach items="${eduReadyList}" var="eduReadyList">
										<c:set var="cnt" value="${cnt+1}"/>
										<tr>
											<td>${cnt }</td>
											<td>${eduReadyList.edctNm }</td>
											<td>${eduReadyList.edinNm }</td>
											<td>${eduReadyList.edctSttgYmd } ~ ${eduReadyList.edctFnshYmd }</td>
											<td>${eduReadyList.aplcTs }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="window.open('/itep/views/myClass/pop/eduInfoPop?edctAplcId='+${eduReadyList.edctAplcId},'eduInfoPop','_blank');">확인</button>
											</td>
											<td>${eduReadyList.aplcStgNm }</td>
											<td id="edctAplcId" style="display:none">${eduReadyList.edctAplcId}</td>
											<td>
												<button type="button" class="btn btn-default btn-xs" onclick="button_event(${eduReadyList.edctAplcId});">취소요청</button>
											</td>
										</tr>	
									</c:forEach>
									</c:when>
								<c:otherwise>
									<tr height="150">
										<td colspan="8" class="txt_center"><h4>수강 신청한 과정이 없습니다.</h4></td>
									</tr>
								</c:otherwise>
							</c:choose>
									</tbody>
								</table>
								<!-- End 수강신청목록-리스트 -->
							</div>
						</div>
					</div>
					<!--End 본문-->
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	
		<script type="text/javascript">

		function button_event(edctAplcId) {
		
		if (confirm("해당 교육을 취소하시겠습니까?") == true){  
	    $.ajax({
	    	url:"/itep/views/myClass/eduReady/cancel", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터
			
			success: function (responseData) {						
				// apprDetail 결과값을 테이블에 동적으로 반영
				$('#edctNm').html(responseData.edctNm);
				$('#edinNm').html(responseData.edinNm);
				$('#edctYmd').html(responseData.edctSttgYmd+' ~ '+responseData.edctFnshYmd);
				$('#aplcTs').html(responseData.aplcTs);
				$('#aplcStgNm').html(responseData.aplcStgNm);
			},
			error: function (xhr, status, error) {
			}
		});
	}else{   //취소
 		return;
	}
		}

</script>