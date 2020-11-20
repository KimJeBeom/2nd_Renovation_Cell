<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

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
							<div class="well">
								<table>
									<tbody>
										<tr>
											<td style="width: 80px; padding-left: 5px; text-align: center;"><b>■ 검 색 </b></td>
											<td style="width: 100px; padding-right: 40px">
												<div>
													<select class="form-control" id="schType">
														<option value="edctNm">과목명</option>
														<option value="edinCd">유형</option>
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
						
							<br>
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
								<div class="tab-pane active" id="tab1">
									<div class="col-md-12">
										<div class="table-responsive">
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
														<td style="text-align:  left"><span class="badge badge-primary">${eduList.edctLevl}</span>&nbsp;${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="tab-pane" id="tab2">
									<div class="col-md-12">
										<div class="table-responsive">
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
													<c:forEach items="${list}" var="eduList" varStatus="status">
													<c:if test="${eduList.edctClsfCd eq 'OTEDU'}">
													<tr>
				 										<td style="text-align:center">${eduList.edctCntId}
														<td style="text-align:  left"><span class="badge badge-primary">${eduList.edctLevl}</span>&nbsp;${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="tab-pane" id="tab3">

									<div class="col-md-12">
										<div class="table-responsive">
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
													<c:forEach items="${list}" var="eduList" varStatus="status">
													<c:if test="${eduList.edctClsfCd eq 'TREDU'}">
													<tr>
				 										<td style="text-align:center">${eduList.edctCntId}
														<td style="text-align:  left"><span class="badge badge-primary">${eduList.edctLevl}</span>&nbsp;${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="tab-pane" id="tab4">

									<div class="col-md-12">
										<div class="table-responsive">
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
													<c:forEach items="${list}" var="eduList" varStatus="status">
													<c:if test="${eduList.edctClsfCd eq 'SEMIN'}">
													<tr>
				 										<td style="text-align:center">${eduList.edctCntId}
														<td style="text-align:  left"><span class="badge badge-primary">${eduList.edctLevl}</span>&nbsp;${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="tab-pane" id="tab4">

									<div class="col-md-12">
										<div class="table-responsive">
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
													<c:forEach items="${list}" var="eduList" varStatus="status">
													<c:if test="${eduList.edctClsfCd eq 'EXTRA'}">
													<tr>
				 										<td style="text-align:center">${eduList.edctCntId}
														<td style="text-align:  left"><span class="badge badge-primary">${eduList.edctLevl}</span>&nbsp;${eduList.edctNm}</td>
														<td style="text-align:center">${eduList.edinNm}</td>
														<td style="text-align:center">${eduList.aplcSttgYmd} ~ ${eduList.aplcFnshYmd}</td>
														<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup('eduApply','eduApplyPop?edctCntId=${eduList.edctCntId}');">안내 및 신청</button></td>
													</tr>
													</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation example" style="text-align: right;">
											<ul class="pagination">
												<li class="page-item"><a class="page-link" href="#">◀◀</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">▶</a></li>
											</ul>
										</nav>
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

function a(tabValue){
	
	var	schType = $("#schType").val(); //검색기준
	var	schValue = $("#schValue").val();//검색값

    $.ajax({
	        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			async:false,
			data: 
	    	    {"schType" : schType
	    	    ,"schValue" : schValue},
	         success: function (responseData) {
					var str = '';
					str += '<tbody id=\"'+tabValue+'\">';
					$.each(responseData, function(i) {
						if(responseData[i].edctClsfCd == tabValue || tabValue=="TOTAL"){
							str += '<tr>';
							str += '<td style="text-align:center">'+responseData[i].edctCntId+'</td>';
							str += '<td style="text-align:  left"><span class="badge badge-primary">'+responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].edinNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].aplcSttgYmd+'~'+responseData[i].aplcFnshYmd+'</td>';
							str += '<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup("eduApply","eduApplyPop?edctCntId='+responseData[i].edctCntId+');">안내 및 신청</button></td>';
							str += '</tr>';
						}
					});
					str += '</tbody>';
					$("#"+tabValue).replaceWith(str);	
					
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
	
}

function showApplyPop(menu, name, id) {
 	var size = '';
	
	// 결재요청(결재자지정) 팝업
	if (name == 'eduApplyPop') 
		size = 'location=no, width=750, height=700, left=100, top=100';

	window.open('/itep/views/'+menu+'/pop/'+name+'?edctCntId='+id, '_blank', size); 
}	

function search() {
	
	var	schType = $("#schType").val(); //검색기준
	var	schValue = $("#schValue").val();//검색값
    var tabValue = $(".nav-tabs .active").attr('value');
	if(schValue==""){
		alert("검색값을 입력 하세요");
	}else{
    $.ajax({
	        url:"/itep/views/eduApply/eduList", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			async:false,
			data: 
	    	    {"schType" : schType
	    	    ,"schValue" : schValue},
	         success: function (responseData) {
					var str = '';
					str += '<tbody id=\"'+tabValue+'\">';
					$.each(responseData, function(i) {
						if(responseData[i].edctClsfCd == tabValue || tabValue=="TOTAL"){
							str += '<tr>';
							str += '<td style="text-align:center">'+responseData[i].edctCntId+'</td>';
							str += '<td style="text-align:  left"><span class="badge badge-primary">'+responseData[i].edctLevl+'</span>'+responseData[i].edctNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].edinNm+'</td>';
							str += '<td style="text-align:center">'+responseData[i].aplcSttgYmd+'~'+responseData[i].aplcFnshYmd+'</td>';
							str += '<td style="text-align:center"><button class="btn btn-success align-bottom btn-xs" onclick="showPopup("eduApply","eduApplyPop?edctCntId='+responseData[i].edctCntId+');">안내 및 신청</button></td>';
							str += '</tr>';
						}
					});
					str += '</tbody>';
					$("#"+tabValue).replaceWith(str);	
					
	          },
	         error: function (xhr, status, error) {
	        	 	alert("조회실패");
	          }
		}); 
	}
}
</script>


