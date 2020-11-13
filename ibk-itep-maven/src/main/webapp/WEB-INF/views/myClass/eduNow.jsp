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
					<!-- Start 수강중인 교육-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/myclass-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>수강 중인 교육</b>
							</h1>
						</div>
					</div>
					<!-- End 수강중인 교육-대제목 -->
					<!-- Start 수강중인 교육-본문 -->
					<div class="row">
						<div class="panel">
							<!-- Start 수강중인 교육-리스트 -->
							<div class="panel-body" style="padding-top:20px">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>상세확인</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="edulist">
										<c:set var="sum" value="${sum+1}"/>
										<tr>
											<td>${sum}</td>
											<td>${edulist.edctNm}</td>
											<td>${edulist.edinNm }</td>
											<td>${edulist.edctSttgYmd } ~ ${edulist.edctFnshYmd }</td>
											<td>
												<button type="button" class="btn btn-primary btn-xs"
													onclick="showPopup('myClass','eduInfoPop');">확인</button>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- End 수강중인 교육-리스트 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />