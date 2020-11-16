<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<div style="display: table-cell; vertical-align: middle"><img src="/itep/assets/itep/img/icon/apprmng-icon-big.png" height="36px" ></div>
						<div style="display: table-cell; vertical-align: middle"><h1 class="page-title" style="vertical-align: middle;">&nbsp;&nbsp;<b>진행 및 완료 문서</b></h1></div>						 	
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
																<i class="calendar icon" style="font-size:14px;"></i>
																<input id="sttgYmd" type="text" style="height:35px; font-size:14px;">
															  </div>
															</div>
														</div>
														<label style="padding-top: 7px; height: 7px;"> &nbsp; ~ &nbsp; </label>
														<div class="field">
															<div class="ui calendar" id="rangeend">
															  <div class="ui input left icon">
																<i class="calendar icon" style="font-size:14px;"></i>
																<input id="fnshYmd" type="text" style="height:35px; font-size:14px;">
															  </div>
															</div>
														  </div>
														</div>
													</div>
												</td>
												<td style="width: 100px;"><b>결재상태</b></td>
												<td style="width: 200px;">
													<select id="aplcStg" class="form-control" style="width:100%;">
														<option value="all">전체</option>
														<option value="fin">결재완료</option>
														<option value="apr">결재중</option>
														<option value="rej">반려</option>
													</select>
												</td>
												<td style="width: 30%;"><button type="button" class="btn btn-primary btn-toastr" style="margin-right: 20px;" onclick="search()">조회</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<br>


							
								<!-- 결재 현황 테이블 -->
								<div class="panel-body">
									<h4 class="panel-title" style="margin-bottom: 10px"><b>▶ 결재 현황</b></h4>
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
											<c:forEach items="${apprStat }" var="apprStatCurrentItem" varStatus="status">
												<tr data-toggle="tab" data-target="#table" onclick="showDetail(this, ${status.index })">
													<td>${status.count }</td>
													<td>${apprStatCurrentItem.brnm }</td>
													<td>${apprStatCurrentItem.userNm }</td>
													<td>${apprStatCurrentItem.edctNm }</td>
													<td>${apprStatCurrentItem.aplcTs }</td>
													<td>${apprStatCurrentItem.aplcStg }</td>
													<td>${apprStatCurrentItem.apprNm }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</div>
								</div>
 
 
								<!-- 결재 이력 테이블 -->
								<div class="panel-body">
									<h4 class="panel-title"><b>▶ 결재 이력</b></h4>
									
									<!-- 위의 결재항목별 교육상세설명 테이블 (TOGGLE 적용) -->
									<div class="tab-content">
										<!-- 테이블 1 -->
										<div class="tab-pane fade in active" id="table" style="padding-top:10px;">
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
															<td id="brnm">${apprStat[0].brnm}</td>
															<td id="userNm">${apprStat[0].userNm}</td>
															<td id="apprCon">결재요청</td>
															<td id="aplcTs">${apprStat[0].aplcTs}</td>
														</tr>
														<tr>
															<td id="rowNum">2</td>
															<td id="dpmAthzDvcd">${apprStat[0].dpmAthzDvcd}</td>
															<td id="dpmAthzNm">${apprStat[0].dpmAthzNm}</td>
															<td id="dpmAthzCon">${apprStat[0].dpmAthzCon }</td>
															<td id="dpmAthzTs">${apprStat[0].dpmAthzTs }</td>
														</tr>
														<tr>
															<td id="rowNum">3</td>
															<td id="grmAthzDvcd">${apprStat[0].grmAthzDvcd}</td>
															<td id="grmAthzNm">${apprStat[0].grmAthzNm}</td>
															<td id="grmAthzCon">${apprStat[0].grmAthzCon }</td>
															<td id="grmAthzTs">${apprStat[0].grmAthzTs }</td>
														</tr>
													</tbody>
												</table>
											</div>
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
	<!-- END WRAPPER -->
	
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		var tbody = document.getElementById('apprStatBody');
		var trs = tbody.getElementsByTagName('tr');
	
		HighLightTableTr(trs[0]);	
	});
	
	function showDetail(target, index) {
		HighLightTableTr(target);
		
		//alert(${list[i].userNm});r
		/*
		$('#brnm').text(${apprStat[i].brnm});
		$('#userNm').text(${apprStat[i].userNm});
		$('#aplcTs').text(${apprStat[i].aplcTs});
		$('#dpmAthzDvcd').val(${apprStat[i].dpmAthzDvcd});
		$('#dpmAthzNm').val(${apprStat[i].dpmAthzNm});
		$('#dpmAthzCon').val(${apprStat[i].dpmAthzCon});
		$('#dpmAthzTs').val(${apprStat[i].dpmAthzTs});
		$('#grmAthzDvcd').val(${apprStat[i].grmAthzDvcd});
		$('#grmAthzNm').val(${apprStat[i].grmAthzNm});
		$('#grmAthzCon').val(${apprStat[i].grmAthzCon});
		$('#grmAthzTs').val(${apprStat[i].grmAthzTs});
		*/
		/*
		$.ajax({
	    	url:"/itep/views/apprMng/apprStatDetail", //데이터를  넘겨줄 링크 설정
	        type:"POST", // post 방식
			data: {"i" : i,
					"a" : a}, //넘겨줄 데이터
			
			success: function (responseData) {	alert("통신성공");
			},
			error: function (xhr, status, error) { alert("통신실패");
				
			}
		});
		*/
	}		
	
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
					str += '<td>'+i+'</td>';
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
					
					// 결재현황 테이블 첫번째 요소 하이라이트
					var tbody = document.getElementById('apprStatBody');
					var trs = tbody.getElementsByTagName('tr');
					HighLightTableTr(trs[0]);	
					
					// 결재이력 조회
					$('#brnm').html(responseData[0].brnm);
					$('#userNm').html(responseData[0].userNm);
					$('#aplcTs').html(responseData[0].aplcTs);
					$('#dpmAthzDvcd').html(responseData[0].dpmAthzDvcd);
					$('#dpmAthzNm').html(responseData[0].dpmAthzNm);
					$('#dpmAthzCon').html(responseData[0].dpmAthzCon);
					$('#dpmAthzTs').html(responseData[0].dpmAthzTs);
					$('#grmAthzDvcd').html(responseData[0].grmAthzDvcd);
					$('#grmAthzNm').html(responseData[0].grmAthzNm);
					$('#grmAthzCon').html(responseData[0].grmAthzCon);
					$('#grmAthzTs').html(responseData[0].grmAthzTs);
						$('#apprStatDetailDiv').show();
				}
			},
			error: function (xhr, status, error) { alert("통신실패");
				
			}
		});
	}
</script>

