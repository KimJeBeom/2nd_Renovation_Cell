<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 교육 신청 현황-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png" height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">&nbsp;&nbsp;<b>교육 신청 현황</b></h1>
						</div>
					</div>
					<!-- End 교육 신청 현황-대제목 -->
					<!-- Start 교육 신청 현황-본문 panel -->
					<div class="panel">
						<div class="panel-body" style="padding-top: 20px">
							<!-- Start 교육 신청 현황 - 탭 바 -->
							<div>
								<ul class="nav nav-tabs">
									<li class="active"><a class="nav-link" href="#tab1" data-toggle="tab">수강신청현황</a></li>
									<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">개설신청현황</a></li>
								</ul>
							</div>
							<!-- End 교육 신청 현황 - 탭 바 -->
							
							<!-- Start 교육 신청 현황 - 탭  내용 panel -->
							<div class="tab-content px-1 pt-2">
								<!-- Start 교육 신청 현황 - 탭1 내용 - 수강신청 현황 -->
								<div class="tab-pane active" id="tab1">
									<!-- Start 교육 신청 현황 - 탭1. 수강신청 현황 - 조회바 -->
									<div class="well col-md-12" style="display: table; padding: 10px">
										<div style="vertical-align: middle">
											<table>
												<tbody>
													<tr>
														<td style="width: 130px;"><b>교육기간</b></td>
														<td style="width: 450px;">
															<div class="ui form">
																<div class="two fields" style="margin-bottom: 0px">
																	<div class="field">
																		<div class="ui calendar" id="rangestart">
																			<div class="ui input left icon">
																				<i class="calendar icon" style="font-size: 14px;"></i>
																				<input id="sttgYmd" type="text" style="height: 35px; font-size: 14px;">
																			</div>
																		</div>
																	</div>
																	<label style="padding-top: 7px; height: 7px;">&nbsp; ~ &nbsp; </label>
																	<div class="field">
																		<div class="ui calendar" id="rangeend">
																			<div class="ui input left icon">
																				<i class="calendar icon" style="font-size: 14px;"></i>
																				<input id="fnshYmd" type="text" style="height: 35px; font-size: 14px;">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</td>
														<td style="width: 130px; padding-left:20px;"><b>교육분류</b></td>
														<td style="width: 200px">
															<select id="edctClsfCd" class="form-control" style="text-align: left;">
																<option value="ALL">전체</option>
																<c:forEach items="${cldList }" var="cldlist">
																	<option value=${cldlist.edctClsfCd }>${cldlist.edctClsfNm }</option>		
																</c:forEach>
															</select>
														</td>
														<td style="width: 120px; padding-left:20px;"><b>교육명</b></td>
														<td style="width: 200px">
															<input id="edctNm" class="form-control" type="text" style="text-align: left;">
														</td>
														<td>
															<div style="text-align: center; padding-top:2px; width:200px;">
																<button type="button" class="btn btn-primary" onclick="searchEduReadyStat();">조회</button>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- End 교육 신청 현황 - 탭1. 수강신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭1. 수강신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
										<table class="table table-hover">
											<thead style="vertical-align: center;">
												<tr>
													<th style="width:5px;">차수ID</th>
													<th style="width:40px;">교육분류</th>
													<th>학습기간</th>
													<th style="width:200px;">교육명</th>
													<th>교육기관</th>
													<th style="width:40px;">신청인원</th>
													<th style="width:20px; padding-left:0px;">상세확인</th>
												</tr>
											</thead>
											<tbody id="eduReadyStatTBody" style="vertical-align: center;">
												<c:choose>
													<c:when test="${not empty ersList}">
														<c:forEach items="${ersList }" var="erslist" varStatus="status">
															<tr>
																<td>${erslist.edctCntId }</td>
																<td>${erslist.edctClsfNm }</td>
																<td>${erslist.edctSttgYmd } ~ ${erslist.edctFnshYmd }</td>
																<td>${erslist.edctNm }</td>
																<td>${erslist.edinNm }</td>
																<td>${erslist.edctAplcIdCnt }</td>
																<td style="padding-left:0px;">
																	<c:choose>
																		<c:when test="${erslist.fnshYn eq 'Y'}">
																			<button type="button" class="btn btn-xs"
																				onclick="showPopup('admin','eduEmpListPop?edctCntId=${erslist.edctCntId }');">확인</button>
																		</c:when>
																		<c:otherwise>
																			<button type="button" class="btn btn-success btn-xs"
																				onclick="showPopup('admin','eduEmpListPop?edctCntId=${erslist.edctCntId }');">확인</button>
																		</c:otherwise>
																	</c:choose>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr height="100">
															<td colspan="7" class="txt_center"><h4>수강신청 내역이 없습니다.</h4></td>
														</tr>
													</c:otherwise>
												</c:choose>	
											</tbody>
										</table>
									</div>
									<!-- End 교육 신청 현황 - 탭1. 수강신청 현황 - 조회결과 -->
									
									<!-- nextPage설정 -->
									<div id="ersPage" style="text-align:center">
										<button class="btn btn-primary btn-xs" id='prvsPage' onclick="searchEduReadyStat('prvs');">◀</button>
										&nbsp;
										<input type="text" id="ersPageNum" value=1 style="width:30px; text-align:center">&nbsp;/
										<label id="ersListCnt" style="width:30px; text-align:center" >${ersSize}</label>
										<!-- <button class="btn btn-default btn-xs" id='movePage' onclick="search('move');">이동</button> --> 
										<button class="btn btn-primary btn-xs" id='nextPage' onclick="searchEduReadyStat('next');">▶</button>
									</div> 
								</div>
								
								
								<!-- Start 교육 신청 현황 - 탭2. 내용 - 개설 신청 현황 -->
								<div class="tab-pane" id="tab2">
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<div class="well col-md-12" style="display: table; padding: 10px;">
										<div style="vertical-align: middle;">
											<table>
												<tbody>
													<tr>
														<td style="width: 130px;"><b>과정개설 신청</b></td>
														<td style="width: 200px">
															<select id="cnfaYnO" class="form-control">
																<option value="ALL">전체</option>
																<option value="Y">확인</option>
																<option value="N">미확인</option>
															</select>
														</td>
														<td style="width: 170px; padding-left:20px;"><b>직원명/직원번호</b></td>
														<td style="width: 200px">
															<input id="userIdNmO" class="form-control" type="text" style="text-align: left;">
														</td>
														<td style="width: 100px; padding-left:20px;"><b>교육명</b></td>
														<td style="width: 200px">
															<input id="edctNmO" class="form-control" type="text" style="text-align: left;">
														</td>
														<td>
															<div style="text-align: center; padding-top:2px; width:200px;">
																<button id="searchEdo" type="button" class="btn btn-primary" onclick="searchEdo();">조회</button>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- End 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
										<table class="table table-hover">
											<thead style="vertical-align: center;">
												<tr>
													<th style="width:5px;">신청ID</th>
													<th>부서명</th>
													<th>직원번호</th>
													<th>직원명</th>
													<th style="width:200px;">교육명</th>
													<th>교육기관</th>
													<th>학습기간</th>
													<th>상세확인</th>
												</tr>
											</thead>
											<tbody id="eduOpenReadyStatTBody" style="vertical-align: center;">
												<c:choose>
													<c:when test="${not empty edoList}">
														<c:forEach items="${edoList }" var="edolist" varStatus="status">
															<tr>
																<td>${edolist.aplcId }</td>
																<td>${edolist.brnm }</td>
																<td>${edolist.userId }</td>
																<td>${edolist.userNm }</td>
																<td>${edolist.edctNm }</td>
																<td>${edolist.edinNm }</td>
																<td>${edolist.edctSttgYmd } ~ ${edolist.edctFnshYmd }</td>
																<td>
																	<c:choose>
																		<c:when test="${edolist.cnfaYn eq 'Y'}">
																			<button type="button" class="btn btn-xs"
																				onclick="showPopup('admin','newEduInfoPop?aplcId=${edolist.aplcId }');">확인</button>
																		</c:when>
																		<c:otherwise>
																			<button type="button" class="btn btn-success btn-xs"
																				onclick="showPopup('admin','newEduInfoPop?aplcId=${edolist.aplcId }');">확인</button>
																		</c:otherwise>
																	</c:choose>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr height="100">
															<td colspan="7" class="txt_center"><h4>과정개설신청 내역이 없습니다.</h4></td>
														</tr>
													</c:otherwise>
												</c:choose>	
											</tbody>
										</table>
									</div>
									<!-- End 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회결과 -->
									<!-- nextPage설정 -->
									<div id="edoPage" style="text-align:center">
										<button class="btn btn-primary btn-xs" id='prvsPage' onclick="searchEdo('prvs');">◀</button>
										&nbsp;
										<input type="text" id="edoPageNum" value=1 style="width:30px; text-align:center">&nbsp;/
										<label id="edoListCnt" style="width:30px; text-align:center" >${edoSize}</label>
										<!-- <button class="btn btn-default btn-xs" id='movePage' onclick="search('move');">이동</button> --> 
										<button class="btn btn-primary btn-xs" id='nextPage' onclick="searchEdo('next');">▶</button>
									</div> 
									
								</div>
								<!-- End 교육 신청 현황 - 탭2. 내용 - 개설 신청 현황 -->
							</div>
							<!-- End 교육 신청 현황 - 탭  내용 panel -->
						</div>
					</div>
					<!-- End 교육 신청 현황-본문 panel -->
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

	<script type="text/javascript">	
		// 엔터 입력 시 조회버튼 클릭
		//$("#sttgYmd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#fnshYmd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#edctClsfCd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#edctNm").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#ersPageNum").keyup(function(e){if(e.keyCode==13) searchEduReadyStat('move'); });

		$("#cnfaYnO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		$("#userIdNmO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		$("#edctNmO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		$("#edoPageNum").keyup(function(e){if(e.keyCode==13) searchEdo('move'); });
				
		// 수강신청현황 페이지 전환
		function searchEduReadyStat(ctrlPage) {
			var pageNum = parseInt($('#ersPageNum').val());
			var listSize = parseInt('${ersSize}');
			
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
			}else {
				pageNum = -1;
			}
			
			// 검색 데이터
			var sttgYmd = $('#sttgYmd').val();
			var fnshYmd = $('#fnshYmd').val();
			var edctClsfCd = $('#edctClsfCd').val();
			var edctNm = $('#edctNm').val();
			
			if(sttgYmd == "" && fnshYmd != "") {
				alert("시작 날짜를 입력해주세요.");
				return;
			} else if(sttgYmd != "" && fnshYmd == "") {
				alert("종료 날짜를 입력해주세요.");
				return;
			} 
			
			$.ajax({
		    	url:"/itep/views/admin/eduReadyStatSearch", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"sttgYmd" : sttgYmd,
						"fnshYmd" : fnshYmd,
						"edctClsfCd" : edctClsfCd,
						"edctNm" : edctNm,
						"pageNum" : pageNum}, //넘겨줄 데이터
				
				success: function (result) {
					var str = '';
					str += '<tbody id=\"eduReadyStatTBody\" style=\"vertical-align: center;\">';
					if(result.list.length != 0) {
						$.each(result.list, function(i) {
							str += '<tr data-toggle=\"tab\" data-target=\"#table\">';
							str += '<td>'+result.list[i].edctCntId+'</td>';
							str += '<td>'+result.list[i].edctClsfNm+'</td>';
							str += '<td>'+result.list[i].edctSttgYmd+' ~ '+result.list[i].edctFnshYmd+'</td>';
							str += '<td>'+result.list[i].edctNm+'</td>';
							str += '<td>'+result.list[i].edinNm+'</td>';
							str += '<td>'+result.list[i].edctAplcIdCnt+'</td>';
							if(result.list[i].fnshYn == "Y")
								str += '<td style=\"padding-left:0px;\"><button type=\"button\" class=\"btn btn-xs\" onclick=\"showPopup(\'admin\',\'eduEmpListPop?edctCntId='+result.list[i].edctCntId+'\');\">확인</button></td>';
							else
								str += '<td style=\"padding-left:0px;\"><button type=\"button\" class=\"btn btn-success btn-xs\" onclick=\"showPopup(\'admin\',\'eduEmpListPop?edctCntId='+result.list[i].edctCntId+'\');\">확인</button></td>';
							str += '</tr>';
						});
						$('#ersPage').show();
					} else {
						str += '<tr height="100">';
						str += '<td colspan="7" class="txt_center"><h4>조회 결과가 없습니다.</h4></td>';
						str += '</tr>';
						$('#ersPage').hide();
					}
					str += '</tbody>';
					$('#eduReadyStatTBody').replaceWith(str);
					
					if(pageNum == -1) {
						$('#ersPageNum').val(1);
						$('#ersListCnt').html(result.listSize);
					} else 
						$('#ersPageNum').val(pageNum);
					
				},
				error: function (xhr, status, error) { alert("통신실패");
				}
			});
		}
		
		
		function searchEdo(ctrlPage) {
			var pageNum = parseInt($('#edoPageNum').val());
			var listSize = parseInt('${edoSize}');
			
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
			}else {
				pageNum = -1;
			}
			
			var cnfaYn = $('#cnfaYnO').val();
			var userIdNm = $('#userIdNmO').val();
			var edctNm = $('#edctNmO').val();	
				
			$.ajax({
		    	url:"/itep/views/admin/eduOpenReadyStatSearch", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"cnfaYn" : cnfaYn,
						"userIdNm" : userIdNm,
						"edctNm" : edctNm,
						"pageNum" : pageNum}, //넘겨줄 데이터
				
				success: function (result) {
					var str = '';
					str += '<tbody id=\"eduOpenReadyStatTBody\" style=\"vertical-align: center;\">';
					if(result.list.length != 0) {
						$.each(result.list, function(i) {
							str += '<tr data-toggle=\"tab\" data-target=\"#table\">';
							str += '<td>'+result.list[i].aplcId+'</td>';
							str += '<td>'+result.list[i].brnm+'</td>';
							str += '<td>'+result.list[i].userId+'</td>';
							str += '<td>'+result.list[i].userNm+'</td>';
							str += '<td>'+result.list[i].edctNm+'</td>';
							str += '<td>'+result.list[i].edinNm+'</td>';
							str += '<td>'+result.list[i].edctSttgYmd+' ~ '+result.list[i].edctFnshYmd+'</td>';
							if(result.list[i].cnfaYn == "Y")
								str += '<td><button type=\"button\" class=\"btn btn-xs\" onclick=\"showPopup(\'admin\',\'newEduInfoPop?aplcId='+result.list[i].aplcId+'\');\">확인</button></td>';
							else
								str += '<td><button type=\"button\" class=\"btn btn-success btn-xs\" onclick=\"showPopup(\'admin\',\'newEduInfoPop?aplcId='+result.list[i].aplcId+'\');\">확인</button></td>';
							str += '</tr>';
						});
						$('#edoPage').show();
					} else {
						str += '<tr height="100">';
						str += '<td colspan="8" class="txt_center"><h4>조회 결과가 없습니다.</h4></td>';
						str += '</tr>';
						$('#edoPage').hide();
					}
					str += '</tbody>';
					$('#eduOpenReadyStatTBody').replaceWith(str);
					
					if(pageNum == -1) {
						$('#edoPageNum').val(1);
						$('#edoListCnt').html(result.listSize);
					} else 
						$('#edoPageNum').val(pageNum);
				},
				error: function (xhr, status, error) { alert("통신실패");
				}
			});
		}
	</script>