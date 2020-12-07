<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />
<style>
	.badge{
		vertical-align:center;
		margin-right:5px;
	}
	.badge.bg-info{
		background-color: #5bc0de;
	}
</style>
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
					<br>
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/eduapply-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>교육 목록</b>
							</h1>
						</div>
					</div>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<!-- 검색창 -->
							<div class="well">
								<table>
									<tbody>
										<tr>
											<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 검 색 </b></td>
											<td style="width: 100px; padding-right: 40px">
												<div>
													<select class="form-control" id="schType">
														<option value="edctNm">과목명</option>
														<option value="edinCd">기관명</option>
														<option value="edctId">순번</option>
													</select>
												</div>
											</td>
											<td style="width: 300px; padding-right: 40px">
												<div>
													<input class="form-control" type="text" id="schValue">
												</div>
											</td>
											<td style="width: 10%; text-align: left;"><button type="button" class="btn btn-primary" style="float: right; margin-right: 20px;" onclick="search();">조회</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- tabs -->
							<div>	
								 <ul class="nav nav-tabs" id="tabValue">
									<li class="active" id='tot' value='TOTAL' onclick="a('TOTAL');">
										<a class="nav-link" href="#tab1" data-toggle="tab">전체</a>
									</li>
									<li class="nav-item" id='ote' value='OTEDU'  onclick="a('OTEDU');">
										<a class="nav-link" href="#tab2" data-toggle="tab">외부교육</a>
									</li>
									<li class="nav-item" id='tre' value='TREDU'  onclick="a('TREDU');">
										<a class="nav-link" href="#tab3" data-toggle="tab">신전입교육</a>
									</li>
									<li class="nav-item" id='sem' value='SEMIN'  onclick="a('SEMIN');">
										<a class="nav-link" href="#tab4" data-toggle="tab">세미나</a>
									</li>
									<li class="nav-item" id='ext' value='EXTRA'  onclick="a('EXTRA');">
										<a class="nav-link" href="#tab5" data-toggle="tab">기타</a>
									</li>
								</ul>
							</div>
							<div class="tab-content px-1 pt-2">
								<!-- 테이블 1 : 전체 -->
								<div class="tab-pane active" id="tab1">
									<div class="col-md-12">
										<div class="table-responsive" style="overflow-x:hidden; height:570px;">
											<table class="table table-hover table-sm first">
												<thead>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">기관명</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
												</thead>
												<tbody id="TOTAL">
													<c:forEach items="${list}" var="eduList" varStatus="status">
													<tr>
				 										<td style="text-align:center">${eduList.edctCntId}
														<td style="text-align:  left">
															<c:choose>
																<c:when test="${eduList.edctLevl eq '상'}"><span class="badge bg-danger"></c:when>
																<c:when test="${eduList.edctLevl eq '중'}"><span class="badge bg-success"></c:when>
																<c:when test="${eduList.edctLevl eq '하'}"><span class="badge bg-info"></c:when>
															</c:choose>
															${eduList.edctLevl}</span>${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- nextPage설정 -->
										<div style="text-align:center">
											<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
											&nbsp;
											<input type="text" id="pageNum_TOTAL" value=1 style="width:30px; text-align:center">&nbsp;/
											<label id="listCnt_TOTAL" style="width:30px; text-align:center" >${listSize}</label> 
											<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
										</div> 
									</div>
								</div>
								<!-- 테이블 2 : 외부교육 -->
								<div class="tab-pane" id="tab2">
									<div class="col-md-12">
										<div class="table-responsive" style="overflow-x:hidden; height:540px;">
											<table class="table table-hover table-sm first">
												<thead>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">기관명</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
												</thead>
												<tbody id="OTEDU">
												</tbody>
											</table>
										</div>
										<!-- nextPage설정 -->
										<div style="text-align:center">
											<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
											&nbsp;
											<input type="text" id="pageNum_OTEDU" value=1 style="width:30px; text-align:center">&nbsp;/
											<label id="listCnt_OTEDU" style="width:30px; text-align:center" ></label> 
											<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
										</div> 
									</div>
								</div>
								<!-- 테이블 3 : 신전입교육 -->
								<div class="tab-pane" id="tab3">
									<div class="col-md-12">
										<div class="table-responsive" style="overflow-x:hidden; height:540px;">
											<table class="table table-hover table-sm first">
												<thead>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">기관명</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
												</thead>
												<tbody id="TREDU">
												</tbody>
											</table>
										</div>
										<!-- nextPage설정 -->
										<div style="text-align:center">
											<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
											&nbsp;
											<input type="text" id="pageNum_TREDU" value=1 style="width:30px; text-align:center">&nbsp;/
											<label id="listCnt_TREDU" style="width:30px; text-align:center" ></label> 
											<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
										</div> 
									</div>
								</div>
								<!-- 테이블 4 : 세미나 -->
								<div class="tab-pane" id="tab4">
									<div class="col-md-12">
										<div class="table-responsive" style="overflow-x:hidden; height:540px;">
											<table class="table table-hover table-sm first">
												<thead>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">기관명</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
												</thead>
												<tbody id="SEMIN">
												</tbody>
											</table>
										</div>
										<!-- nextPage설정 -->
										<div style="text-align:center">
											<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
											&nbsp;
											<input type="text" id="pageNum_SEMIN" value=1 style="width:30px; text-align:center">&nbsp;/
											<label id="listCnt_SEMIN" style="width:30px; text-align:center" ></label>
											<!-- <button class="btn btn-default btn-xs" id='movePage' onclick="search('move');">이동</button> --> 
											<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
										</div> 
									</div>
								</div>
								<!-- 테이블 5 : 기타 -->
								<div class="tab-pane" id="tab5">
									<div class="col-md-12">
										<div class="table-responsive" style="overflow-x:hidden; height:540px;">
											<table class="table table-hover table-sm first">
												<thead>
													<tr>
														<th style="text-align:center; width:10%;" id="th1">순번</th>
														<th style="text-align:center; width:40%;" id="th2">교육명</th>
														<th style="text-align:center; width:15%;" id="th3">기관명</th>
														<th style="text-align:center; width:20%;" id="th4">접수기간</th>
														<th style="text-align:center; width:15%;" id="th5">바로가기</th>
													</tr>
												</thead>
												<tbody id="EXTRA">
												</tbody>
											</table>
										</div>
										<!-- nextPage설정 -->
										<div style="text-align:center">
											<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
											&nbsp;
											<input type="text" id="pageNum_EXTRA" value=1 style="width:30px; text-align:center">&nbsp;/
											<label id="listCnt_EXTRA" style="width:30px; text-align:center" ></label>
											<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
										</div> 
									</div>
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
		<footer>
			<div class="container-fluid">
				<!-- <p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a> </p>-->
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
<script type="text/javascript">

//Enter클릭시 search(); 수행 스크립트
$("#schValue").keyup(function(e){if(e.keyCode==13) search(); });
//페이지 수기 입력 이동 pageCtrl();수행 스크립트
$("#pageNum_TOTAL").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });
$("#pageNum_OTEDU").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });
$("#pageNum_TREDU").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });
$("#pageNum_SEMIN").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });
$("#pageNum_EXTRA").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });

//tab 선택시 테이블 조회 function
function a(tabValue){
	var	schType = $("#schType").val(); //검색기준
	var	schValue = $("#schValue").val();//검색값
	
	var pageNum = $('#pageNum_'+tabValue).val();
	
    $.ajax({
	        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			async:false,
			data: 
	    	    {"schType" : schType
	    	    ,"schValue" : schValue	    	    
	    	    ,"tabValue" : tabValue
	    	    ,"pageNum" : pageNum},
	    	    
	         success: function (responseData) {
	        	 
					if(responseData.length == 0)
						alert("조회결과가 없습니다");
	        	 
					var str = '';
					str += '<tbody id=\"'+tabValue+'\">';
					$.each(responseData, function(i) {
							str += '<tr>';
							str += '<td style="text-align:center">'+responseData[i].edctCntId+'</td>';
							str += '<td style="text-align:  left">';
							if(responseData[i].edctLevl == '상')
								str += '<span class="badge bg-danger">';
							else if(responseData[i].edctLevl == '중')
								str += '<span class="badge bg-success">';
							else if(responseData[i].edctLevl == '하')
								str += '<span class="badge bg-info">';
							str += responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							//str += '<td style="text-align:  left"><span class="badge badge-primary">'+responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].edinNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].aplcSttgYmd+' ~ '+responseData[i].aplcFnshYmd+'</td>';
							str += '<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup(\'eduApply\',\'eduApplyPop?edctCntId='+responseData[i].edctCntId+'\');">안내 및 신청</button></td>';
							str += '</tr>';
					});
					str += '</tbody>';
					$("#"+tabValue).replaceWith(str);
					$('#pageNum_'+tabValue).val(pageNum);
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
    //조회시 전체 페이지 재조회 필요로 인한 페이지 재계산 로직 수행
    $.ajax({
        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
		type:"POST", // post 방식
		data: 
    	    {"schType" : schType
    	    ,"schValue" : schValue
    	    ,"tabValue" : tabValue
    	    ,"pageNum" : "-1" }, //-1일 경우 OffSet없이 SQL수행됨
    	    
         success: function (responseData) {
        	 var listSize = (responseData.length/10);
        	 var listCnt = Math.ceil(listSize);
        	 //현재탭의 총 탭수(span)
        	 $('#listCnt_'+tabValue).html(listCnt);
         }   
    }); 
	
}

//조회버튼 클릭시 function
function search() {
	
	var	schType = $("#schType").val(); //검색기준
	var	schValue = $("#schValue").val();//검색값
    var tabValue = $(".nav-tabs .active").attr('value'); //탭선택값
    var pageNum = "1";
    
    $.ajax({
	        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			data: 
	    	    {"schType" : schType
	    	    ,"schValue" : schValue
	    	    ,"tabValue" : tabValue
	    	    ,"pageNum" : pageNum},
	    	    
	         success: function (responseData) {
	        	 
					if(responseData.length == 0){
						alert("조회결과가 없습니다");
						return;
					}						
					var str = '';
					str += '<tbody id=\"'+tabValue+'\">'; //탭 선택값에 맞는 테이블 id로 설정
					$.each(responseData, function(i) {
							str += '<tr>';
							str += '<td style="text-align:center">'+responseData[i].edctCntId+'</td>';
							str += '<td style="text-align:  left">';
							if(responseData[i].edctLevl == '상')
								str += '<span class="badge bg-danger">';
							else if(responseData[i].edctLevl == '중')
								str += '<span class="badge bg-success">';
							else if(responseData[i].edctLevl == '하')
								str += '<span class="badge bg-info">';
							str += responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							//str += '<td style="text-align:  left"><span class="badge badge-primary">'+responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].edinNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].aplcSttgYmd+' ~ '+responseData[i].aplcFnshYmd+'</td>';
							str += '<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup(\'eduApply\',\'eduApplyPop?edctCntId='+responseData[i].edctCntId+'\');">안내 및 신청</button></td>';
							str += '</tr>';
					});
					str += '</tbody>';
					$("#"+tabValue).replaceWith(str);
					$('#pageNum_'+tabValue).val("1");
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
    //조회시 전체 페이지 재조회 필요로 인한 페이지 재계산 로직 수행
    $.ajax({
        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
		type:"POST", // post 방식
		data: 
    	    {"schType" : schType
    	    ,"schValue" : schValue
    	    ,"tabValue" : tabValue
    	    ,"pageNum" : "-1" }, //-1일 경우 OffSet없이 SQL수행됨
    	    
         success: function (responseData) {
			if(responseData.length == 0){
				alert("조회결과가 없습니다");
				return;
			}		
        	 var listSize = (responseData.length/10);
        	 var listCnt = Math.ceil(listSize);
        	 //현재탭의 총 탭수()
        	 $('#listCnt_'+tabValue).html(listCnt);
         }
    	    
    }); 
}

//페이지 클릭시 수행 function
function pageCtrl(ctrlPage) {
	
	var	schType = $("#schType").val(); //검색기준
	var	schValue = $("#schValue").val();//검색값
    var tabValue = $(".nav-tabs .active").attr('value'); //탭선택값
	
    var pageNum = parseInt($('#pageNum_'+tabValue).val()); //현재탭의 페이지넘버
    
	var listSize = parseInt($('#listCnt_'+tabValue).html()); //현재탭에 총 페이지
	
	//패이지 이동 검증 로직
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
    
    $.ajax({
	        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			data: 
	    	    {"schType" : schType
	    	    ,"schValue" : schValue
	    	    ,"tabValue" : tabValue
	    	    ,"pageNum" : pageNum},
	    	    
	         success: function (responseData) {
	        	 
					if(responseData.length == 0){
						alert("조회결과가 없습니다");
						return;
					}
						
					var str = '';
					str += '<tbody id=\"'+tabValue+'\">'; //탭 선택값에 맞는 테이블 id로 설정
					$.each(responseData, function(i) {
							str += '<tr>';
							str += '<td style="text-align:center">'+responseData[i].edctCntId+'</td>';
							str += '<td style="text-align:  left">';
							if(responseData[i].edctLevl == '상')
								str += '<span class="badge bg-danger">';
							else if(responseData[i].edctLevl == '중')
								str += '<span class="badge bg-success">';
							else if(responseData[i].edctLevl == '하')
								str += '<span class="badge bg-info">';
							str += responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							//str += '<td style="text-align:  left"><span class="badge badge-primary">'+responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].edinNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].aplcSttgYmd+' ~ '+responseData[i].aplcFnshYmd+'</td>';
							str += '<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup(\'eduApply\',\'eduApplyPop?edctCntId='+responseData[i].edctCntId+'\');">안내 및 신청</button></td>';
							str += '</tr>';
					});
					str += '</tbody>';
					$("#"+tabValue).replaceWith(str);
					//이동된 페이지를 화면에 적용
				    $('#pageNum_'+tabValue).val(pageNum);
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
}
</script>


