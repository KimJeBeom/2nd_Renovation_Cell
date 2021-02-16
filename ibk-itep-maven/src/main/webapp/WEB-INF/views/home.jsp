<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- HEADER -->
<jsp:include page="./cmm/common-header.jsp" />
<style>
  *{margin:0;padding:0;}
  ul,li{list-style:none;}
  #slide{height:610px;width:90%;position:relative;overflow:hidden}
  #slide ul{width:400%;height:100%;transition:1s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%;}
  #slide li:nth-child(1){background:#FFFFFF;}
  #slide li:nth-child(3){background:#FFFFFF;}
  #slide li:nth-child(3){background:#FFFFFF;}
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
</style>

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
					<div class="panel panel-headline" style="height:640px;">
						<div class="panel-heading">
							<!-- 메인이미지 슬라이딩 -->
							<div id="slide">
							  <input type="radio" name="pos" id="pos1" value="1" onclick="clearTmg();" checked >
							  <input type="radio" name="pos" id="pos2" value="2" onclick="clearTmg();">
							  <input type="radio" name="pos" id="pos3" value="3" onclick="clearTmg();">
							  <ul style="float:center">
								<li><img src="/itep/assets/itep/img/itepintro.png"  style="width :inherit; height:100%; width:80%;margin: 0px auto; display:block;"/></li>
								<li><img src="/itep/assets/itep/img/deptTop-main.png"  style="width :inherit; height:100%; width:80%;margin: 0px auto; display:block;"/></li>
								<li><img src="/itep/assets/itep/img/eduCurric-main.png"  style="width :inherit; height:100%; width:80%;margin: 0px auto; display:block;"/></li>
							  </ul>
							  <p class="pos">
							    <label for="pos1"></label>
							    <label for="pos2"></label>
							    <label for="pos3"></label>
							  </p>
							</div>	
						</div>
					</div>

					<div class="row">
						<!-- 공지사항 패널 -->
						<div class="col-md-6" >
							<div class="panel" style="height:260px;">
								<div class="panel-heading">
									<h3 class="panel-title">
									<img src="/itep/assets/itep/img/icon/board-icon-big.png" height="15px">
									&nbsp;<b>공지사항</b>
									</h3>
									<div class="right">
										<a href="/itep/views/board/notice"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-right"></i></button></a>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-hover">
										<tbody>
											<c:forEach items="${bdnList }" var="bdnlist" varStatus="status">
												<tr onclick="showPopup('board','noticeModPop?pbnsId=${bdnlist.pbnsId}');">
													<td style="text-align:center; width:10%;">${status.count}</td>
													<td style="text-align:Left  ; width:55%;">${bdnlist.ttl }</td>
													<td style="text-align:center; width:10%;">${bdnlist.userNm }</td>
													<td style="text-align:center; width:15%;">${fn:substring(bdnlist.rgsnTs,0,10) }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 수강중인 교육 패널-->
						<div class="col-md-6">
							<div class="panel" style="height:260px;">
								<div class="panel-heading">
									<h3 class="panel-title">
									<img src="/itep/assets/itep/img/icon/myclass-icon-big.png" height="15px">
									&nbsp;<b>수강중인 교육</b>
									</h3>
									<div class="right">
										<a href="/itep/views/myClass/eduNow"><button type="button" class="btn-toggle-collapse_"><i class="lnr lnr-chevron-right"></i></button></a>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled activity-list">
										<c:forEach items="${eduNowList }" var="edunowlist">
											<li onclick="showPopup('myClass','eduInfoPop?edctAplcId=${edunowlist.edctAplcId}');">
												<a>${edunowlist.edctNm }
														<span class="timestamp">${edunowlist.edctSttgYmd } ~ ${edunowlist.edctFnshYmd }</span>
												</a>
											</li>
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
		<div style="position:fixed; right:48px; top:85px;">
			<a href="javascript:showImgWin('deptTop')"><img src="/itep/assets/itep/img/icon/deptTop-icon.png" style="width:45px; height:60px;"/></a>
		</div>
		<div style="position:fixed; right:26px; top:153px;">
			<a href="javascript:showImgWin('eduCurric')"><img src="/itep/assets/itep/img/icon/eduCurric-icon.png" style="width:85px; height:90px;"/></a>
		</div>
			
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="./cmm/common-footer.jsp" />

<script>
	
	//메인화면 이미지 자동 슬라이딩 기능(타이머)
	var myInsterval = setInterval(function(){slideImg();},5000); //5초
	function slideImg() {
		var radioVal = $('input[name="pos"]:checked').val(); //현재체크값
		var addFileCnt = $("input[name=pos]").length; //페이지개수
		var nextVal = String(parseInt(radioVal)+1); //다음체크값
		if(parseInt(radioVal) < addFileCnt){
			$("input:radio[name='pos']:radio[id='pos"+nextVal+"']").prop('checked', true); // 선택하기
		}else if(parseInt(radioVal) >= addFileCnt){
			$("input:radio[name='pos']:radio[id='pos1']").prop('checked', true); // 선택하기			
		}
	}
	//메인화면 전환시 타이머 초기화
	function clearTmg(){
		clearInterval(myInsterval);
		myInsterval = setInterval(function(){slideImg();},5000); //5초
	}

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