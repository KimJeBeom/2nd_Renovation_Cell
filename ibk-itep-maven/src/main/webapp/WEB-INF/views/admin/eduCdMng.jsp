<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 코드 관리-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png" height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title"> &nbsp;&nbsp;<b>코드 관리</b></h1>
						</div>
					</div>
					<!-- End 코드 관리-대제목 -->
					<!-- Start 코드 관리-본문 panel -->
					<div class="panel">
						<div class="panel-body" style="padding-top: 20px; padding-bottom:0px;">
							<!-- Start 코드 관리  -조회바 -->
							<div class="well col-md-12" style="display: table; padding: 10px; margin-bottom:10px;">
								<div style="display: table-cell; vertical-align: middle">
									<table>
										<tbody>
											<tr>
												<td style="width: 100px;"><b>분류</b></td>
												<td style="width: 200px">
													<select id="cmmSelect" class="form-control" style="text-align: left;">
														<option value="ALL">전체</option>
														<option value="CLI">교육기관</option>
														<option value="CLD">교육분류</option>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End 코드 관리 - 조회바 -->
						<!-- Start 버튼바-->
						<div class="form-group row" style="text-align: right; padding-right: 42px; margin-bottom:0px;">
							<button class="btn btn-primary" type="button" onclick="showPopup('admin','batchPagePop');">배치실행</button>
							<button class="btn btn-primary" type="button" onclick="updateCmm();">수정</button>
							<button class="btn btn-primary" type="button" onclick="showPopup('admin','addEduCdPop');">추가</button>
							<br>
						</div>
						<!-- End 버튼바-->
						<!-- Start 코드 관리 - 조회결과 -->
						<div id="cldHead" class="panel-heading" style="padding-top: 0px; padding-bottom:0px;">
							<h4 class="pannel-title"><b>▶ &nbsp;&nbsp;교육 분류</b></h4>
						</div>
						<div id="cldBody" class="panel-body">
							<div class="table-responsive col-md-12" style="padding: 0px">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>코드분류</th>
											<th>코드ID</th>
											<th>코드명</th>
											<th>사용여부</th>
										</tr>
									</thead>
									<tbody id="cldTBody" style="vertical-align: center;">
										<c:forEach items="${cldList }" var="cldlist" varStatus="status">
											<tr>
												<td>${status.count }</td>
												<td>교육분류</td>
												<td>${cldlist.edctClsfCd }</td>
												<td>
													<input class="form-control" type="text" style="text-align: center;" value="${cldlist.edctClsfNm }">
												</td>
												<td style="text-align:center;">
													<label class="fancy-radio" style="display:inline-block">
														<input name="cldUse${status.count }" value="Y" type="radio" <c:if test="${cldlist.useYn eq 'Y' }">checked</c:if>>
														<span><i></i>Y</span>
													</label> 
													<label class="fancy-radio" style="display:inline-block; margin-left: 50px;">
														<input name="cldUse${status.count }" value="N" type="radio" <c:if test="${cldlist.useYn eq 'N' }">checked</c:if>>
														<span><i></i>N</span>
													</label>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div id="cliHead" class="panel-heading" style="padding-top: 0px; padding-bottom:0px;">
							<h4 class="pannel-title"><b>▶ &nbsp;&nbsp;교육 기관</b></h4>
						</div>
						<div id="cliBody" class="panel-body">
							<div class="table-responsive col-md-12" style="padding: 0px">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>코드분류</th>
											<th>코드ID</th>
											<th>코드명</th>
											<th>사용여부</th>
										</tr>
									</thead>
									<tbody id="cliTBody" style="vertical-align: center;">
										<c:forEach items="${cliList }" var="clilist" varStatus="status">
											<tr>
												<td>${status.count }</td>
												<td>교육기관</td>
												<td>${clilist.edinCd }</td>
												<td>
													<input class="form-control" type="text" style="text-align: center;" value="${clilist.edinNm }">
												</td>
												<td style="text-align:center;">
													<label class="fancy-radio" style="display:inline-block;">
														<input name="cliUse${status.count }" value="Y" type="radio" <c:if test="${clilist.useYn eq 'Y' }">checked</c:if>>
														<span><i></i>Y</span>
													</label> 
													<label class="fancy-radio" style="display:inline-block; margin-left: 50px;">
														<input name="cliUse${status.count }" value="N" type="radio" <c:if test="${clilist.useYn eq 'N' }">checked</c:if>>
														<span><i></i>N</span>
													</label>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- End 코드관리 결과 리스트-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	
	<script>
		$('#cmmSelect').change(function(){
			var cmmCd = $('#cmmSelect option:selected').val();
			
			if(cmmCd == "ALL") {
				$('#cldHead').show();
				$('#cldBody').show();
				$('#cliHead').show();
				$('#cliBody').show();
			} else if(cmmCd == "CLD") {
				$('#cldHead').show();
				$('#cldBody').show();
				$('#cliHead').hide();
				$('#cliBody').hide();
			} else if(cmmCd == "CLI") {
				$('#cldHead').hide();
				$('#cldBody').hide();
				$('#cliHead').show();
				$('#cliBody').show();
			} 
		});
		
		function updateCmm() {
			if(confirm("수정하시겠습니까?")) {
				// 교육분류, 교육기관 테이블의 tr 정보			
				var cldTr = $('#cldTBody tr');
				var cliTr = $('#cliTBody tr');
				
				// 교육분류 데이터 배열에 담기
				var cldData = "";
				cldTr.each(function(i) {
					var td = cldTr.eq(i).children();
					var edctClsfCd = td.eq(2).text(); // 코드ID
					var edctClsfNm = td.eq(3).find('input[type="text"]').val(); // 코드명
					var useYn = $('input[name="cldUse'+(i+1)+'"]:checked').val(); // 사용여부
					
					cldData += ","+edctClsfCd+","+edctClsfNm+","+useYn;
				}); 
				
				// 교육기관 데이터 배열에 담기
				var cliData = "";
				cliTr.each(function(i) {
					var td = cliTr.eq(i).children();
					var edinCd = td.eq(2).text(); // 코드ID
					var edinNm = td.eq(3).find('input[type="text"]').val(); // 코드명
					var useYn = $('input[name="cliUse'+(i+1)+'"]:checked').val(); // 사용여부
										
					cliData += ","+edinCd+","+edinNm+","+useYn;
				});
					
				$.ajax({
			    	url:"/itep/views/admin/updateCmm", //데이터를  넘겨줄 링크 설정
			        type:"POST", // post 방식
					data: {"cldData": cldData,
						   "cliData": cliData}, //넘겨줄 데이터
					success: function (responseData) {		
						alert("완료되었습니다.");
						reDrawCldTable(responseData.cldList);
						reDrawCliTable(responseData.cliList);
					},
					error: function (xhr, status, error) { alert("통신실패"); }
				});
			} else {
				return false;
			}
		}
	
		// 교육분류 테이블 다시 그리는 함수
		function reDrawCldTable(cldList) {
			var str = '<tbody id=\"cldTBody\" style=\"vertical-align: center;\">';
			$.each(cldList, function(i, cldlist) {
				str += '<tr>';
				str += '<td>'+(i+1)+'</td>';
				str += '<td>'+교육분류+'</td>';
				str += '<td>'+cldlist.edctClsfCd+'</td>';
				str += '<td><input class=\"form-control\" type=\"text\" style=\"text-align: center;\" value=\"'+cldlist.edctClsfNm+'\"></td>';
				str += '<td style=\"text-align:center;\"><label class=\"fancy-radio\" style=\"display:inline-block\">';
				if(cldlist.useYn.equals("Y")) {
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"Y\" type=\"radio\" checked><span><i></i>Y</span></label> ';
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"N\" type=\"radio\"><span><i></i>N</span></label> ';
				} else if(cldlist.useYn.equals("N")) {
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"Y\" type=\"radio\"><span><i></i>Y</span></label> ';
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"N\" type=\"radio\" checked><span><i></i>N</span></label> ';
				}
				str += '</td></tr>';
			});
			str += '</tbody>';
			$('#cldTBody').replaceWith(str);
		}
		
		// 교육기관 테이블 다시 그리는 함수
		function reDrawCliTable(cliList) {
			var str = '<tbody id=\"cliTBody\" style=\"vertical-align: center;\">';
			$.each(cliList, function(i, clilist) {
				str += '<tr>';
				str += '<td>'+(i+1)+'</td>';
				str += '<td>'+교육기관+'</td>';
				str += '<td>'+clilist.edinCd+'</td>';
				str += '<td><input class=\"form-control\" type=\"text\" style=\"text-align: center;\" value=\"'+clilist.edinNm+'\"></td>';
				str += '<td style=\"text-align:center;\"><label class=\"fancy-radio\" style=\"display:inline-block\">';
				if(clilist.useYn.equals("Y")) {
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"Y\" type=\"radio\" checked><span><i></i>Y</span></label> ';
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"N\" type=\"radio\"><span><i></i>N</span></label> ';
				} else if(clilist.useYn.equals("N")) {
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"Y\" type=\"radio\"><span><i></i>Y</span></label> ';
					str += '<input name=\"cldUse'+(i+1)+'\" value=\"N\" type=\"radio\" checked><span><i></i>N</span></label> ';
				}
				str += '</td></tr>';
			});
			str += '</tbody>';
			$('#cliTBody').replaceWith(str);
		}
	</script>