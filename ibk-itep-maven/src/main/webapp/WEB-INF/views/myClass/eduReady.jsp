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
							<!-- Start 수강신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<br><b>▶&nbsp;&nbsp; 수강신청 목록</b>
								</h4>
							</div>
							<!-- End 수강신청목록-소제목 -->
							<div id="eduReadyListdiv" class="panel-body" style="overflow-x:hidden; height:300px;">
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
									<tbody  id="eduReadyListTbody" >
									<c:choose>
								<c:when test="${not empty eduReadyList}">
									<c:forEach items="${eduReadyList}" var="eduReadyList">
										<c:set var="cnt" value="${cnt+1}"/>
										<tr>
											<td id="cnt">${cnt }</td>
											<td id="edctNm">${eduReadyList.edctNm }</td>
											<td id="edinNm">${eduReadyList.edinNm }</td>
											<td id="edctYmd">${eduReadyList.edctSttgYmd } ~ ${eduReadyList.edctFnshYmd }</td>
											<td id="aplcTs">${eduReadyList.aplcTs }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('myClass','eduInfoPop?edctAplcId='+${eduReadyList.edctAplcId}+'&&modType=ready');">확인</button>
											</td>
											<td id="aplcStgNm">${eduReadyList.aplcStgNm }</td>
											<td id="aplcStgCd" style="display:none">${eduReadyList.aplcStgCd}</td>
											<td id="edctAplcId" style="display:none">${eduReadyList.edctAplcId}</td>
											<td>
										 <c:choose>
											 <c:when test="${eduReadyList.aplcStgCd eq 'REJDPM' || eduReadyList.aplcStgCd eq 'REJGRM' || eduReadyList.aplcStgCd eq 'APRDPM'}">
												<button type="button" class="btn btn-default btn-xs" onclick="cancel(${eduReadyList.edctAplcId});">취소요청</button>
											 </c:when>
											  <c:otherwise>
												<button type="button" class="btn btn-default btn-xs" onclick="cancel(${eduReadyList.edctAplcId});" disabled>취소요청</button>
											 </c:otherwise>
										  </c:choose>
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
							</div>
						<!-- End 수강신청목록-리스트 -->
													<!-- Start 과정개설 신청목록-소제목 -->
							<div class="panel-heading">
								<h4 class="pannel-title">
									<b>▶ &nbsp;&nbsp;과정개설 신청목록</b>
								</h4>
							</div>
							<!-- End 과정개설 신청목록-소제목 -->
							<!-- Start 과정개설 신청목록-리스트 -->
							<div class="panel-body" style="overflow-x:hidden; height:300px;">
								<table id="eduNewListTb" class="table table-hover">
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
													onclick="showPopup('myClass','newEduInfoPop?aplcId='+${eduNewList.aplcId});">확인</button>
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
							<br>
							<!-- End 과정개설 신청목록-리스트 -->
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
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/floatthead/2.2.1/jquery.floatThead.js"></script>
	<script type="text/javascript">

		$(document).ready(function() {
			var tbody = document.getElementById('eduReadyListTbody');
			var trs = tbody.getElementsByTagName('tr');	
		});
		
		function cancel(edctAplcId) {

		if (confirm("해당 교육을 취소하시겠습니까?") == true){  
			$.ajax({
		    	url:"/itep/views/myClass/eduReady/cancel", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터

				success: function (responseData) {
					var str = '';
					str += '<tbody id=\"eduReadyListTbody\">';
					if(responseData.length != 0) {
					$.each(responseData, function(i) {
						str += '<tr>';
						str += '<td>'+(i+1)+'</td>';
						str += '<td>'+responseData[i].edctNm+'</td>';
						str += '<td>'+responseData[i].edinNm+'</td>';
						str += '<td>'+responseData[i].edctSttgYmd + '~' + responseData[i].edctFnshYmd+'</td>';
						str += '<td>'+responseData[i].aplcTs+'</td>';
						str += '<td><button type=\"button\" class=\"btn btn-primary bts-xs\" onclick=\"showPopup(\'myClass\',\'eduInfoPop?edctAplcId='+responseData[i].edctAplcId+'\');\">확인</button></td>'
						str += '<td>'+responseData[i].aplcStgNm+'</td>';
						if(responseData[i].aplcStgCd == "REJDPM" || responseData[i].aplcStgCd == "REJGRM"  || responseData[i].aplcStgCd == "APRDPM" ){
						str += '<td><button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"cancel('+responseData[i].edctAplcId+');\">취소요청</button></td>'
						}else{
							str += '<td><button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"cancel('+responseData[i].edctAplcId+');\" disabled>취소요청</button></td>'
						}
						str += '</tr>';
					});
					} else {
						str += '<tr height="130">';
						str += '<td colspan="8" class="txt_center"><h4>개설 신청한 과정이 없습니다.</h4></td>';
						str += '</tr>';
				}
					str += '</tbody>';
					$('#eduReadyListTbody').replaceWith(str);
					
				},
				error: function (xhr, status, error) { alert("왜때문에그런거니~");
					
				}
			});
	}else{
			return;
		}
	}

		
</script>