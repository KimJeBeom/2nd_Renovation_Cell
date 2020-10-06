<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="./cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">

		<!-- 사이드메뉴 -->
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
								<div class="col-md-9">
									<img class="headline-chart" src="/assets/itep/img/computer.jpg" />
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- 공지사항 패널 -->
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">공지사항</h3>
									<div class="right">
										<a href="notifications.html"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-up"></i></button></a>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-hover">
										<tbody>
											<tr onclick="window.location.href='notifications.html'"><td>공지사항1</td></tr>
											<tr onclick="window.location.href='notifications.html'"><td>공지사항2</td></tr>
											<tr onclick="window.location.href='notifications.html'"><td>공지사항3</td></tr>
											<tr onclick="window.location.href='notifications.html'"><td>공지사항4</td></tr>
											<tr onclick="window.location.href='notifications.html'"><td>공지사항5</td></tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 수강중인 교육 패널-->
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">수강중인 교육</h3>
									<div class="right">
										<a href="elements.html"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-up"></i></button></a>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled activity-list">
										<li><a href="elements.html" class=""><p>교육1<span class="timestamp">2020.07.17 ~ 2020.10.17</span></p></a></li>
										<li><a href="elements.html" class=""><p>교육2<span class="timestamp">2020.07.17 ~ 2020.10.17</span></p></a></li>
										<li><a href="elements.html" class=""><p>교육3<span class="timestamp">2020.07.17 ~ 2020.10.17</span></p></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!-- 팝업샘플 패널 -->
					<div class="row">
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">팝업샘플</h3>
								</div>
								<div class="panel-body">
									<p class="demo-button">
										<button type="button" class="btn btn-default" onclick="showPopup('eduApply','eduInfoPop');">교육설명</button>
										<button type="button" class="btn btn-primary" onclick="showPopup('admin','newEduRegPop');">신규교육등록</button>
										<button type="button" class="btn btn-primary" onclick="showPopup('admin','eduModPop');">교육내용수정</button>
										<button type="button" class="btn btn-primary" onclick="showPopup('admin','addEduRndPop');">차수추가</button>
										<button type="button" class="btn btn-primary" onclick="showPopup('admin','newEduInfoPop');">과정개설신청현황확인</button>
									</p>
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
>>>>>>> branch 'master' of https://github.com/KimJeBeom/2nd_Renovation_Cell.git
