<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<b>엑셀 업로드 결과</b>
					</h3>

					<table class="table table-hover tbl-type2">
						<thead>
							<tr>
								<th style="width: 30px;">No</th>
								<th>직원번호</th>
								<th>직원명</th>
								<th>직책</th>
								<th>행내전화</th>
								<th>부서명</th>
								<th>권한</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${excelList }" var="excellist" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>${excellist.userId }</td>
									<td>${excellist.userNm }</td>
									<td>${excellist.userJtm }</td>
									<td>${excellist.userTpn }</td>
									<td>${excellist.brnm }</td>
									<td>${excellist.athrNm }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />