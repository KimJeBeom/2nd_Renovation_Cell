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
									<c:forEach items="${list}" var="newEdulist">
										<c:set var="sum" value="${sum+1}"/>
										<tr>
											<td>${sum}</td>
											<td>${newEdulist.edctNm }</td>
											<td>${newEdulist.edinNm }</td>
											<td>${newEdulist.edctSttgYmd } ~ ${newEdulist.edctFnshYmd }</td>
											<td>${newEdulist.aplcTs }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('myClass','newEduInfoPop');">확인</button>
											</td>
											<td>${newEdulist.cnfaYn }</td>
										</tr>
									</c:forEach>
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
							<div class="panel-body">
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
									<c:forEach items="${list1}" var="EduReadylist">
										<c:set var="cnt" value="${cnt+1}"/>
										<tr>
											<td>${cnt }</td>
											<td>${EduReadylist.edctNm }</td>
											<td>${EduReadylist.edinNm }</td>
											<td>${EduReadylist.edctSttgYmd } ~ ${EduReadylist.edctFnshYmd }</td>
											<td>${EduReadylist.aplcTs }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('myClass','eduInfoPop');">확인</button>
											</td>
											<td>${EduReadylist.aplcStgNm }</td>
											<td>
												<button type="button" class="btn btn-default btn-xs" onclick="button_event();">취소요청</button>
											</td>
										</tr>	
									</c:forEach>
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

	<script type="text/javascript">

	function button_event(){
		if (confirm("해당 교육을 취소하시겠습니까?") == true){ 
			document.form.submit();
		}else{
			 return;
		}
	  }

</script>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />