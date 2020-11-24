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
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">&nbsp;&nbsp;<b>교육 신청 현황</b>
							</h1>
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
									<div class="well col-md-12"
										style="display: table; padding: 10px">
										<div style="display: table-cell; vertical-align: middle">
											<table>
												<tbody>
													<tr>
														<td style="width: 130px;"><b>교육기간</b></td>
														<td style="width: 450px; padding-right: 20px">
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
														<td style="width: 130px;"><b>교육분류</b></td>
														<td style="width: 200px">
															<select id="edctClsfCd" class="form-control" style="text-align: left;">
																<option value="ALL">전체</option>
																<c:forEach items="${cldList }" var="cldlist">
																	<option value=${cldlist.edctClsfCd }>${cldlist.edctClsfNm }</option>		
																</c:forEach>
															</select>
														</td>
														<td style="width: 130px"><b>교육명</b></td>
														<td style="width: 200px">
															<input id="edctNm" class="form-control" type="text" style="text-align: left;">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div style="display: table-cell; text-align: left; padding-top:2px; width:200px;">
											<button type="button" class="btn btn-primary" onclick="searchEduReadyStat();">조회</button>
										</div>
									</div>
									<!-- End 교육 신청 현황 - 탭1. 수강신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭1. 수강신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
										<table class="table table-hover">
											<thead style="vertical-align: center;">
												<tr>
													<th style="width:5px;">No</th>
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
													<c:when test="${not empty eduReadyStatList}">
														<c:forEach items="${eduReadyStatList }" var="edureadystatlist" varStatus="status">
															<tr data-toggle="tab" data-target="#table">
																<td>${status.count }</td>
																<td>${edureadystatlist.edctClsfNm }</td>
																<td>${edureadystatlist.edctSttgYmd } ~ ${edureadystatlist.edctFnshYmd }</td>
																<td>${edureadystatlist.edctNm }</td>
																<td>${edureadystatlist.edinNm }</td>
																<td>${edureadystatlist.edctAplcIdCnt }</td>
																<td style="padding-left:0px;">
																	<button type="button" class="btn btn-primary" 
																		onclick="showPopup('admin','eduEmpListPop?edctCntId=${edureadystatlist.edctCntId }');">확인
																	</button>
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
								</div>
								
								
								<!-- Start 교육 신청 현황 - 탭2. 내용 - 개설 신청 현황 -->
								<div class="tab-pane" id="tab2">
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<div class="well col-md-12" style="display: table; padding: 10px;">
										<div style="display: table-cell; vertical-align: middle;">
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
														<td style="width: 200px;"><b>직원명/직원번호</b></td>
														<td style="width: 200px">
															<input id="userIdNmO" class="form-control" type="text" style="text-align: left;">
														</td>
														<td style="width: 150px"><b>교육명</b></td>
														<td style="width: 200px">
															<input id="edctNmO" class="form-control" type="text" style="text-align: left;">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div style="display: table-cell; text-align: left; padding-top:2px; width:200px;">
											<button id="searchEdo" type="button" class="btn btn-primary" onclick="searchEdo();">조회</button>
										</div>
									</div>
									<!-- End 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회바 -->
									<!-- Start 교육 신청 현황 - 탭2 - 개설 신청 현황 - 조회결과 -->
									<div class="table-responsive col-md-12" style="padding: 0px">
										<table class="table table-hover">
											<thead style="vertical-align: center;">
												<tr>
													<th style="width:5px;">No</th>
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
															<tr data-toggle="tab" data-target="#table">
																<td>${status.count }</td>
																<td>${edolist.brnm }</td>
																<td>${edolist.userId }</td>
																<td>${edolist.userNm }</td>
																<td>${edolist.edctNm }</td>
																<td>${edolist.edinNm }</td>
																<td>${edolist.edctSttgYmd } ~ ${edolist.edctFnshYmd }</td>
																<td>
																	<c:choose>
																		<c:when test="${edolist.cnfaYn eq 'Y'}">
																			<button type="button" class="btn btn-default"
																				onclick="showPopup('admin','newEduInfoPop?aplcId=${edolist.aplcId }');">확인</button>
																		</c:when>
																		<c:otherwise>
																			<button type="button" class="btn btn-primary"
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
		$("#sttgYmd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#fnshYmd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#edctClsfCd").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });
		$("#edctNm").keyup(function(e){if(e.keyCode == 13)  searchEduReadyStat(); });

		$("#cnfaYnO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		$("#userIdNmO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		$("#edctNmO").keyup(function(e){if(e.keyCode == 13)  searchEdo(); });
		
		// 수강신청현황 검색
		function searchEduReadyStat() {
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
						"edctNm" : edctNm}, //넘겨줄 데이터
				
				success: function (responseData) {
					var str = '';
					str += '<tbody id=\"eduReadyStatTBody\" style=\"vertical-align: center;\">';
					if(responseData.length != 0) {
						$.each(responseData, function(i) {
							str += '<tr data-toggle=\"tab\" data-target=\"#table\">';
							str += '<td>'+(i+1)+'</td>';
							str += '<td>'+responseData[i].edctClsfNm+'</td>';
							str += '<td>'+responseData[i].edctSttgYmd+' ~ '+responseData[i].edctFnshYmd+'</td>';
							str += '<td>'+responseData[i].edctNm+'</td>';
							str += '<td>'+responseData[i].edinNm+'</td>';
							str += '<td>'+responseData[i].edctAplcIdCnt+'</td>';
							str += '<td style=\"padding-left:0px;\"><button type=\"button\" class=\"btn btn-primary\" onclick=\"showPopup(\'admin\',\'eduEmpListPop?edctCntId='+responseData[i].edctCntId+'\');\">확인</button></td>';
							str += '</tr>';
						});
					} else {
						str += '<tr height="100">';
						str += '<td colspan="7" class="txt_center"><h4>조회 결과가 없습니다.</h4></td>';
						str += '</tr>';
					}
					str += '</tbody>';
					$('#eduReadyStatTBody').replaceWith(str);
				},
				error: function (xhr, status, error) { alert("통신실패");
				}
			});
		}
		
		function searchEdo() {
			var cnfaYn = $('#cnfaYnO').val();
			var userIdNm = $('#userIdNmO').val();
			var edctNm = $('#edctNmO').val();	
				
			$.ajax({
		    	url:"/itep/views/admin/eduOpenReadyStatSearch", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"cnfaYn" : cnfaYn,
						"userIdNm" : userIdNm,
						"edctNm" : edctNm}, //넘겨줄 데이터
				
				success: function (responseData) {
					var str = '';
					str += '<tbody id=\"eduOpenReadyStatTBody\" style=\"vertical-align: center;\">';
					if(responseData.length != 0) {
						$.each(responseData, function(i) {
							str += '<tr data-toggle=\"tab\" data-target=\"#table\">';
							str += '<td>'+(i+1)+'</td>';
							str += '<td>'+responseData[i].brnm+'</td>';
							str += '<td>'+responseData[i].userId+'</td>';
							str += '<td>'+responseData[i].userNm+'</td>';
							str += '<td>'+responseData[i].edctNm+'</td>';
							str += '<td>'+responseData[i].edinNm+'</td>';
							str += '<td>'+responseData[i].edctSttgYmd+' ~ '+responseData[i].edctFnshYmd+'</td>';
							if(responseData[i].cnfaYn == "Y")
								str += '<td><button type=\"button\" class=\"btn btn-default\" onclick=\"showPopup(\'admin\',\'newEduInfoPop?aplcId='+responseData[i].aplcId+'\');\">확인</button></td>';
							else
								str += '<td><button type=\"button\" class=\"btn btn-primary\" onclick=\"showPopup(\'admin\',\'newEduInfoPop?aplcId='+responseData[i].aplcId+'\');\">확인</button></td>';
							str += '</tr>';
						});
					} else {
						str += '<tr height="100">';
						str += '<td colspan="8" class="txt_center"><h4>조회 결과가 없습니다.</h4></td>';
						str += '</tr>';
					}
					str += '</tbody>';
					$('#eduOpenReadyStatTBody').replaceWith(str);
				},
				error: function (xhr, status, error) { alert("통신실패");
				}
			});
		}
	</script>