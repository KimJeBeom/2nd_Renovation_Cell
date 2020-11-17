<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	결재관리 > 진행 및 완료 문서
 -->

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
							<img src="/itep/assets/itep/img/icon/apprmng-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title" style="vertical-align: middle;">
								&nbsp;&nbsp;<b>진행 및 완료 문서</b>
							</h1>
						</div>
					</div>
					<div class="row">

						<!-- 상단 검색 패널 -->
						<div class="panel">
							<div class="panel-body">
								<div class="well" style="margin-bottom: 0px; padding-top: 15px;">
									<table>
										<tbody>
											<tr>
												<td style="width: 130px; padding-left: 5px;"><b>결재요청일</b></td>
												<td style="width: 600px; padding-right: 20px">
													<div class="ui form">
														<div class="two fields" style="margin-bottom: 0px">
															<div class="field">
																<div class="ui calendar" id="rangestart">
																	<div class="ui input left icon">
																		<i class="calendar icon" style="font-size: 14px;"></i>
																		<input id="sttgYmd" type="text"
																			style="height: 35px; font-size: 14px;">
																	</div>
																</div>
															</div>
															<label style="padding-top: 7px; height: 7px;">
																&nbsp; ~ &nbsp; </label>
															<div class="field">
																<div class="ui calendar" id="rangeend">
																	<div class="ui input left icon">
																		<i class="calendar icon" style="font-size: 14px;"></i>
																		<input id="fnshYmd" type="text"
																			style="height: 35px; font-size: 14px;">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
												<td style="width: 100px;"><b>결재상태</b></td>
												<td style="width: 200px;"><select id="aplcStg"
													class="form-control" style="width: 100%;">
														<option value="all">전체</option>
														<option value="fin">결재완료</option>
														<option value="apr">결재중</option>
														<option value="rej">반려</option>
												</select></td>
												<td style="width: 30%;"><button type="button"
														class="btn btn-primary btn-toastr"
														style="margin-right: 20px;" onclick="search()">조회</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<br>



							<!-- 결재 현황 테이블 -->
							<div class="panel-body">
								<h4 class="panel-title" style="margin-bottom: 10px">
									<b>▶ 결재 현황</b>
								</h4>
								<div class="table-responsive">
									<table class="table table-hover tbl-type2">
										<thead>
											<tr>
												<th>NO</th>
												<th>부서명</th>
												<th>직원명</th>
												<th style="width: 200px;">신청교육</th>
												<th>신청일자</th>
												<th>결재상태</th>
												<th>결재자</th>
											</tr>
										</thead>
										<tbody id="apprStatBody">
											<!-- 컨트롤러에서 가져온 리스트에서 VO 하나씩 꺼내서 출력 -->
											<c:forEach items="${apprStat }" var="apprstat" varStatus="status">
												<tr data-toggle="tab" data-target="#table" onclick="showDetail(this, ${apprstat.edctAplcId })">
													<td>${status.count }</td>
													<td>${apprstat.brnm }</td>
													<td>${apprstat.userNm }</td>
													<td>${apprstat.edctNm }</td>
													<td>${apprstat.aplcTs }</td>
													<td>${apprstat.aplcStg }</td>
													<td>${apprstat.apprNm }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<!-- apprList가 하나도 없으면 apprDetail == null (Controller에서 지정) -->
							<!-- apprDetail 이 not null일 때만 아래 화면 보여줌 -->
							<c:if test="${not empty apprDetail}">
							
							<!-- 결재 이력 테이블 -->
							<div class="panel-body" id="apprStatDetailDiv">
								<h4 class="panel-title">
									<b>▶ 결재 이력</b>
								</h4>

								<!-- 위의 결재항목별 교육상세설명 테이블 (TOGGLE 적용) -->
								<div class="tab-content">
									<!-- 테이블 1 -->
									<div class="tab-pane fade in active" id="table"
										style="padding-top: 10px;">
										<div class="table-responsive">
											<table class="table table-hover tbl-type2">
												<thead>
													<tr>
														<th>NO</th>
														<th>부서명</th>
														<th>직원명</th>
														<th>결재의견</th>
														<th>결재일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td id="rowNum">1</td>
														<td id="brnm">${apprDetail.brnm}</td>
														<td id="userNm">${apprDetail.userNm}</td>
														<td id="apprCon">결재요청</td>
														<td id="aplcTs">${apprDetail.aplcTs}</td>
													</tr>
													<tr>
														<td id="rowNum">2</td>
														<td id="dpmAthzDvcd">${apprDetail.dpmAthzDvcd}</td>
														<td id="dpmAthzNm">${apprDetail.dpmAthzNm}</td>
														<td id="dpmAthzCon">${apprDetail.dpmAthzCon }</td>
														<td id="dpmAthzTs">${apprDetail.dpmAthzTs }</td>
													</tr>
													<tr>
														<td id="rowNum">3</td>
														<td id="grmAthzDvcd">${apprDetail.grmAthzDvcd}</td>
														<td id="grmAthzNm">${apprDetail.grmAthzNm}</td>
														<td id="grmAthzCon">${apprDetail.grmAthzCon }</td>
														<td id="grmAthzTs">${apprDetail.grmAthzTs }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<!-- END WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

	<script type="text/javascript">
	$(document).ready(function() {
		var tbody = document.getElementById('apprStatBody');
		var trs = tbody.getElementsByTagName('tr');
	
		HighLightTableTr(trs[0]);	
	});
	
	function search() {
		var sttgYmd = $('#sttgYmd').val();
		var fnshYmd = $('#fnshYmd').val();
		var aplcStg = $('#aplcStg').val();
		
		if(sttgYmd == "" && fnshYmd != "") {
			alert("시작 날짜를 입력해주세요.");
		} else if(sttgYmd != "" && fnshYmd == "") {
			alert("종료 날짜를 입력해주세요.");
		} 
		
		$.ajax({
	    	url:"/itep/views/apprMng/apprStatSearch", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"sttgYmd" : sttgYmd,
					"fnshYmd" : fnshYmd,
					"aplcStg" : aplcStg}, //넘겨줄 데이터
			
			success: function (responseData) {
				// 결재현황 조회
				var str = '';
				str += '<tbody id=\"apprStatBody\">';
				$.each(responseData, function(i) {
					str += '<tr data-toggle=\"tab\" data-target=\"#table\" onclick=\"showDetail(this, '+responseData[i].edctAplcId+')\">';
					str += '<td>'+(i+1)+'</td>';
					str += '<td>'+responseData[i].brnm+'</td>';
					str += '<td>'+responseData[i].userNm+'</td>';
					str += '<td>'+responseData[i].edctNm+'</td>';
					str += '<td>'+responseData[i].aplcTs+'</td>';
					str += '<td>'+responseData[i].aplcStg+'</td>';
					str += '<td>'+responseData[i].apprNm+'</td>';
					str += '</tr>';
				});
				str += '</tbody>';
				$('#apprStatBody').replaceWith(str);
				
				if(responseData.length == 0) {
					$('#apprStatDetailDiv').hide(); // 결재현황 리스트가 없으면 하단 결재이력 테이블이 안보이게
				} else {
					var tbody = document.getElementById('apprStatBody');
					var trs = tbody.getElementsByTagName('tr');
					showDetail(trs[0], responseData[0].edctAplcId); // 결재이력 조회
				}
			},
			error: function (xhr, status, error) { alert("통신실패");
				
			}
		});
	}
	
	function showDetail(target, edctAplcId) {
		HighLightTableTr(target);
		
		$.ajax({
	    	url:"/itep/views/apprMng/apprStatDetail", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"edctAplcId" : edctAplcId}, //넘겨줄 데이터
			
			success: function (responseData) {		
				// apprDetail 결과값을 테이블에 동적으로 반영
				$('#brnm').html(responseData.brnm);
				$('#userNm').html(responseData.userNm);
				$('#aplcTs').html(responseData.aplcTs);
				$('#dpmAthzDvcd').html(responseData.dpmAthzDvcd);
				$('#dpmAthzNm').html(responseData.dpmAthzNm);
				$('#dpmAthzCon').html(responseData.dpmAthzCon);
				$('#dpmAthzTs').html(responseData.dpmAthzTs);
				$('#grmAthzDvcd').html(responseData.grmAthzDvcd);
				$('#grmAthzNm').html(responseData.grmAthzNm);
				$('#grmAthzCon').html(responseData.grmAthzCon);
				$('#grmAthzTs').html(responseData.grmAthzTs);
				$('#apprStatDetailDiv').show();
			},
			error: function (xhr, status, error) {
			}
		});
	}		
</script>