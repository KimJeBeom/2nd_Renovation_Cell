<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 등록 및 수정 > 신규 교육 등록 팝업
 -->
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title" style="float: left;"><b>신규 교육 등록</b></h3>

					<!-- 상단 버튼 -->
					<button type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom; ">등록</button><br><br>

					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 신규 교육 등록 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>교육분류</th>
											<td>
												<select id="eduType" class="form-control" onchange="showEduType();">
													<option value="exedu">외부교육</option>
													<option value="inedu">신전입교육</option>
													<option value="seminar">세미나</option>
													<option value="etc">기타</option>
												</select>
											</td>
											<th>결재대상</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 20px;">
													<input name="appr" value="apprY" type="radio" checked>
													<span><i></i>Y</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="appr" value="apprN" type="radio">
													<span><i></i>N</span>
												</label>
											</td>
										</tr>
										<!-- 과목코드 채번방식 변경으로 조회대상 제외				
										<tr>
											<th>과목코드</th>
											<td colspan="3">
												<input id="eduTypeCode" type="text" class="form-control" placeholder="OTEDU" style="width: 30%; float: left;">
												<input type="text" class="form-control" placeholder="0006" style="width: 30%; float: left; margin-left: 5px;">
											</td>
										</tr> 
										-->
										<tr>
											<th>과목명</th>
											<td colspan="3">
												<input type="text" class="form-control" placeholder="IT Governance 핵심 이해">
											</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">
												<textarea class="form-control" placeholder="IT Governance 핵심을 이해하고 비즈니스 전략을 수립" rows="4"></textarea>
											</td>
										</tr>
										<tr>
											<th>교육기관</th>
											<td colspan="3">
												<select id="eduInst" class="form-control" onchange="showEduInstBox();" style="width: 60%; float: left;">
													<option value="ibk" selected="selected">IBK</option>
													<option value="multicampus">멀티캠퍼스</option>
													<option value="fastcampus">패스트캠퍼스</option>
													<option value="kosta">한국소프트웨어기술진흥협회</option>
													<option value="fsec">금융보안원</option>
													<option value="kpc">한국생산성본부</option>
													<option value="oracle">Oracle</option>
													<option value="webtime">웹타임</option>
													<option value="hp">HP</option>
													<option value="ibm">IBM</option>
													<option value="etc">기타</option>
												</select> 
												<input id="eduInstTextBox" type="text" class="form-control" placeholder="" style="display: none;">
											</td>
										</tr>
										<!-- 										
										<tr>
											<th>교육기간</th>
											<td><input type="text" class="form-control" placeholder="1일"></td>
											<th>이수시간</th>
											<td><input type="text" class="form-control" placeholder="2시간"></td>
										</tr> 
										-->
										<!-- 
										<th>교육비용</th>
											<td><input type="text" class="form-control" placeholder="350,000" style="width: 80%; float: left;">
												<span><i></i>(원)</span></td>										 
										-->
										<tr>
											<th>교육구분</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 15px;">
													<input name="gender" value="in" type="radio">
													<span><i></i>행내</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="gender" value="ex" type="radio">
													<span><i></i>행외</span>
												</label>
											</td>
											<th>고용보험 적용</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 20px;">
													<input name="gender1" value="y" type="radio">
													<span><i></i>Y</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="gender1" value="n" type="radio">
													<span><i></i>N</span>
												</label>
											</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 5px;">
													<input name="gender2" value="online" type="radio">
													<span><i></i>온라인</span>
												</label>
												<label class="fancy-radio" style="width: 50%; float: left; margin-left: 10px;">
													<input name="gender2" value="offline" type="radio">
													<span><i></i>오프라인</span>
												</label>
											</td>
											<th>교육수준</th>
											<td>
												<label class="fancy-radio" style="width: 30%; float: left; margin-left: 10px">
													<input name="gender3" value="hard" type="radio">
													<span><i></i>상</span>
												</label>
												<label class="fancy-radio" style="width: 30%; float: left;">
													<input name="gender3" value="normal" type="radio">
													<span><i></i>중</span>
												</label>
												<label class="fancy-radio" style="width: 30%; float: left;">
													<input name="gender3" value="easy" type="radio">
													<span><i></i>하</span>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
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
	</div>
	<!-- END WRAPPER -->

<script>

	/* 교육분류 값에 따른 결재대상, 과목코드 자동 입력 */
	function showEduType() {
		var state = document.getElementById("eduType").value; // 선택된 교육분류 select option
		var eduTypeCode = document.getElementById("eduTypeCode"); // 과목코드 text box
		var appr = document.getElementsByName("appr"); // 결재대상 radio button

		/* 
			외부교육 - 과목코드 OTEDU, 결재대상 Y
			신전입교육 - 과목코드 TREDU, 결재대상 N
			세미나 - 과목코드 SEMIN, 결재대상 N
			기타 - 과목코드 EXTRA, 결재대상 선택
		 */
		if(state == 'exedu') {
			//eduTypeCode.value = 'OTEDU';
			appr[0].checked = true;
		}
		else if(state == 'inedu') {
			//eduTypeCode.value = 'TREDU';
			appr[1].checked = true;
		}
		else if(state == 'seminar') {
			//eduTypeCode.value = 'SEMIN';
			appr[1].checked = true;
		}
		else if(state == 'etc') {
			//eduTypeCode.value = 'EXTRA';
			appr[0].checked = false;
			appr[1].checked = false;
		}
	}

	/* 교육기관 '기타' 선택에 따른 textbox 활성화 */
	function showEduInstBox() {
		var state = document.getElementById("eduInst").value;
		var eduInstTextBox = document.getElementById("eduInstTextBox");

		if(state == 'etc') 
			eduInstTextBox.style.display = 'block'; // textbox 보여줌
		else 
			eduInstTextBox.style.display = 'none'; // textbox 숨김
	}
	
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

