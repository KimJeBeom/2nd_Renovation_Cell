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
								<div class="col-md-12" style="vertical-align:center; text-align: center; ">
									<img src="/itep/assets/itep/img/itepintro.png" style="height:70%; max-width:100%; margin: 0px auto; display:block;"/>
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
												<tr onclick="showPopup('board','noticeModPop?pbnsId=${bdnlist.pbnsId}');"><td>${bdnlist.ttl }</td></tr>
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
											<li onclick="showPopup('myClass','eduInfoPop?edctAplcId=${edunowlist.edctAplcId}');"><a><p>${edunowlist.edctNm }<span class="timestamp">${edunowlist.edctSttgYmd } ~ ${edunowlist.edctFnshYmd }</span></p></a></li>
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
		
		<!-- 오른쪽 아래 아이콘 -->
		<div style="position:fixed; right:41px; top:70px;">
			<a href="javascript:showImgWin('deptTop')"><img src="/itep/assets/itep/img/icon/deptTop-icon.png" style="width:33px; height:43px;"/></a>
		</div>
		<div style="position:fixed; right:24px; top:123px;">
			<a href="javascript:showImgWin('eduCurric')"><img src="/itep/assets/itep/img/icon/eduCurric-icon.png"/></a>
		</div>
			
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="./cmm/common-footer.jsp" />

<script>
	/* $(document).ready(function(){
		$('#menuApprList').click(function(){
			$('.main').load("/itep/views/apprMng/apprList");
		});
	}); */
	/* $(document).ready(function(){
		alert("1");
		var nowFolder = $('#menuApprList').parent().parent().parent().parent().eq(0); 
		alert("2");
		nowFolder.className = "active";
		alert("3");
		$('#menuApprList').className = "active";
		alert("4");
	}); */

	function showImgWin(imgName) {
		var url = "/itep/assets/itep/img/" + imgName + ".png";
			var imgObj = new Image();
		imgObj.src = url;
			var img_width = 1100;
		var win_width = 1070;
		var height = 900;
		
		var OpenWindow = window.open('','_blank','width='+img_width+', height='+height+', menubars=no, scrollbars=1, resizable=1');
		OpenWindow.document.write("<img src='"+url+"' width='"+win_width+"'>");
	}
	
	function showNotice(pbnsId) {
		
	}
</script>	