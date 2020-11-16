<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="./cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">

		<!-- 사이드메뉴  -->
		<jsp:include page="./cmm/common-sidebar.jsp" />

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

					<!-- 메인 이미지 패널 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12" style="text-align:center;">
									<img src="/itep/assets/itep/img/itepintro.png" style="height:100%; max-width:100%; display:block;"/>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- 공지사항 패널 -->
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>공지사항</b></h3>
									<div class="right">
										<a href="/itep/views/board/notice"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-right"></i></button></a>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-hover">
										<tbody>
											<c:forEach items="${bdnList }" var="bdnlist">
												<tr><td>${bdnlist.ttl }</td></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 수강중인 교육 패널-->
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>수강중인 교육</b></h3>
									<div class="right">
										<a href="/itep/views/myClass/eduNow"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-right"></i></button></a>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled activity-list">
										<c:forEach items="${eduNowList }" var="edunowlist">
											<li><a href="elements.html" class=""><p>${edunowlist.edctNm }<span class="timestamp">${edunowlist.edctSttgYmd } ~ ${edunowlist.edctFnshYmd }</span></p></a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
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
<jsp:include page="./cmm/common-footer.jsp" />