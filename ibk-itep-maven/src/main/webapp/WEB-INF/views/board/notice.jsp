<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 게시판>공지사항 -->
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
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/board-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>공지사항</b>
							</h1>
						</div>
					</div>
						<div class="panel">
							<div class="panel-body">
								<br>
								<!-- 검색 BAR -->
								<div class="well">
									<table>
										<tbody>
											<tr>
												<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 제 목</b></td>
												<td style="width: 300px; padding-right: 40px">
													<div>
														<input class="form-control" id="ttl" type="text" name="ttl"/>
													</div>
												</td>
												<td style="width: 10%; text-align: left;">
													<button class="btn btn-primary" type="button"  onclick="search();">조회</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							<c:if test ="${athrCd eq 'GRM' || athrCd eq 'ADM' }">
							<div class="form-group row" style="text-align: right; padding-right: 15px;">
								<button class="btn btn-primary" type="button" onclick="showPopup('board','noticeRegPop');">등 록</button>
							</div>
							</c:if>
							<!-- 조회 목록 -->
							<div class="table-responsive" style="overflow-x:hidden; height:570px;">
								<table class="table table-hover">
									<thead>
										<tr>
											<!-- <th style="text-align:center; width:10%;" id="1">No.</th> -->
											<th style="text-align:center; width:15%;" id="2">구분</th>
											<th style="text-align:center; width:45%;" id="3">제목</th>
											<th style="text-align:center; width:15%;" id="4">등록일</th>
											<th style="text-align:center; width:15%;" id="5">등록자</th>
										</tr>
									</thead>
									<tbody id="noticeList">
										<c:forEach items="${list}" var="noti" varStatus="status">
										<tr onclick="showPopup('board','noticeModPop?pbnsId=${noti.pbnsId}');">
	 										<%-- <td style="text-align:center">${noti.pbnsId}</td> --%>
											<td style="text-align:center">${noti.edctClsfNm}</td>
											<td style="text-align:  left">${noti.ttl}</td>
											<td style="text-align:center">${noti.rgsnTs}</td>
											<td style="text-align:center">${noti.userNm}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- nextPage설정 -->
							<div style="text-align:center">
								<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
								&nbsp;
								<input type="text" id="pageNum" value=1 style="width:30px; text-align:center">&nbsp;/
								<label id="listCnt" style="width:30px; text-align:center" >${listSize}</label>
								<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
							</div> 
						</div>
					</div>
				</div>
			</div>
			
	
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<!-- <p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p> -->
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

<script>
//Enter클릭시  수행 스크립트
$("#ttl").keyup(function(e){if(e.keyCode==13) search(); });
$("#pageNum").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });


//(조회)제목을 필드값을 가져와 URL에 세팅하여 화면을 재수행한다.
function search() {
	var ttl = $('input[name=ttl]').val();	
	var pageNum = "1";
	
    $.ajax({
	        url:"/itep/views/board/notice", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			data: {ttl : ttl, pageNum : pageNum},
	    	    
	         success: function (responseData) {
					if(responseData.length == 0){
						alert("조회결과가 없습니다");
						return;
					}

					var str = '';
					str += '<tbody id="noticeList">'; //탭 선택값에 맞는 테이블 id로 설정
					$.each(responseData, function(i) {
						str += '<tr onclick="showPopup(\'board\',\'noticeModPop?pbnsId=\''+responseData[i].pbnsId+'\');">';
						str += '<td style="text-align:center">'+responseData[i].edctClsfNm+'</td>';
						str += '<td style="text-align:  left">'+responseData[i].ttl+'</td>';
						str += '<td style="text-align:center">'+responseData[i].rgsnTs+'</td>';
						str += '<td style="text-align:center">'+responseData[i].userNm+'</td>';
						str += '</tr>';
					});
					str += '</tbody>';
					$("#noticeList").replaceWith(str);	
					$('#pageNum').val("1");
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
    $.ajax({
        url:"/itep/views/board/notice", //데이터를  넘겨줄 링크 설정
		type:"POST", // post 방식
		data: {ttl : ttl, pageNum : "-1"},
    	    
         success: function (responseData) {
     		if(responseData.length == 0){
    			return;
    		}
        	 var listSize = (responseData.length/10);
        	 var listCnt = Math.ceil(listSize);
        	 //현재탭의 총 탭수()
        	 $('#listCnt').html(listCnt);
          },
         error: function (xhr, status, error) {
        	 	alert("조회실패");
          }
	}); 
	
}		

//조회버튼 클릭시 function
function pageCtrl(ctrlPage) {
	
	var pageNum = parseInt($('#pageNum').val());
	var listSize = parseInt('${listSize}');
	
  	if(ctrlPage=="prvs"){
  		pageNum = pageNum-1;
		if(pageNum <= 0){
			alert("이전페이지가 없습니다.");
			return;
		}
	}else if(ctrlPage=="next"){
		pageNum = pageNum+1;
		if(pageNum > listSize){
			alert("다음페이지가 없습니다.");
			return;
		}
	}else if(ctrlPage=="move"){
		if(pageNum > listSize){
			alert("이동값이 전체 페이지보다 클수 없습니다.");
			return;
		}
	}
  	var ttl = $('input[name=ttl]').val();
	
    $.ajax({
	        url:"/itep/views/board/notice", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			data: {ttl : ttl, pageNum : pageNum},
	    	    
	         success: function (responseData) {
					if(responseData.length == 0){
						alert("조회결과가 없습니다");
						return;
					}
					var str = '';
					str += '<tbody id="noticeList">'; //탭 선택값에 맞는 테이블 id로 설정
					$.each(responseData, function(i) {
						str += '<tr onclick="showPopup(\'board\',\'noticeModPop?pbnsId='+responseData[i].pbnsId+'\');">';
						str += '<td style="text-align:center">'+responseData[i].edctClsfNm+'</td>';
						str += '<td style="text-align:  left">'+responseData[i].ttl+'</td>';
						str += '<td style="text-align:center">'+responseData[i].rgsnTs+'</td>';
						str += '<td style="text-align:center">'+responseData[i].userNm+'</td>';
						str += '</tr>';
					});
					str += '</tbody>';
					$("#noticeList").replaceWith(str);	
					$('#pageNum').val(pageNum);
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
}
</script>