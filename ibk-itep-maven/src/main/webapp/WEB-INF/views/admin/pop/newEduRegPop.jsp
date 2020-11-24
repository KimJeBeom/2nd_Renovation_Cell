<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<button id="btnRegEdu" type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom; ">등록</button><br><br>
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
												<select class="form-control" id="edctClsfCd" style="text-align: left;">
													<c:forEach items="${cldVoList }" var="cldVo">
														<option value=${cldVo.edctClsfCd }>${cldVo.edctClsfNm }</option>		
													</c:forEach>
												</select>
											</td>
											<th>결재대상</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 20px;">
													<input name="snctTgtYn" value="Y" type="radio" checked>
													<span><i></i>Y</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="snctTgtYn" value="N" type="radio">
													<span><i></i>N</span>
												</label>
											</td>
										</tr>
										<tr>
											<th>과목명</th>
											<td colspan="3">
												<input id="edctNm" type="text" class="form-control" placeholder="과목명을 입력하세요">
											</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">
												<textarea id="edctCon" class="form-control" placeholder="과목내용을 입력하세요" rows="4"></textarea>
											</td>
										</tr>
										<tr>
											<th>교육기관</th>
											<td colspan="3">
												<select id="edinCd" class="form-control" onchange="showEduInstBox();" style="width: 60%; float: left;">
													<c:forEach items="${cliVoList }" var="cliVo">
														<option value=${cliVo.edinCd }>${cliVo.edinNm }</option>		
													</c:forEach>
													<!-- <option value="etc">기타</option> -->
												</select> 
											</td>
										</tr>
<!-- 										<tr id="etcInputForm"  style="display: none;">
											<th>교육기관코드</th>
											<td><input id="edinCdInput" type="text" class="form-control" placeholder=""></td>
											<th>교육기관명</th>
											<td><input id="edinNmInput" type="text" class="form-control" placeholder=""></td>										
										</tr>
										<tr>
											<th>교육기관코드</th>
											<td><input type="text" class="form-control" placeholder=""></td>
											<th>교육기관명</th>
											<td><input type="text" class="form-control" placeholder=""></td>										
										</tr> -->
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
													<input name="inbkEdctYn" value="Y" type="radio">
													<span><i></i>행내</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="inbkEdctYn" value="N" type="radio">
													<span><i></i>행외</span>
												</label>
											</td>
											<th>고용보험 적용</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 20px;">
													<input name="eginAplyYn" value="Y" type="radio">
													<span><i></i>Y</span>
												</label>
												<label class="fancy-radio" style="width: 40%; float: left;">
													<input name="eginAplyYn" value="N" type="radio">
													<span><i></i>N</span>
												</label>
											</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>
												<label class="fancy-radio" style="width: 40%; float: left; margin-left: 5px;">
													<input name="onlEdctYn" value="Y" type="radio">
													<span><i></i>온라인</span>
												</label>
												<label class="fancy-radio" style="width: 50%; float: left; margin-left: 10px;">
													<input name="onlEdctYn" value="N" type="radio">
													<span><i></i>오프라인</span>
												</label>
											</td>
											<th>교육수준</th>
											<td>
												<label class="fancy-radio" style="width: 30%; float: left; margin-left: 10px">
													<input name="edctLevl" value="상" type="radio">
													<span><i></i>상</span>
												</label>
												<label class="fancy-radio" style="width: 30%; float: left;">
													<input name="edctLevl" value="중" type="radio">
													<span><i></i>중</span>
												</label>
												<label class="fancy-radio" style="width: 30%; float: left;">
													<input name="edctLevl" value="하" type="radio">
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
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
<script type="text/javascript">

	/* 교육분류 값에 따른 결재대상, 과목코드 자동 입력 */
/* 	function showEduType() {
		var state = document.getElementById("eduType").value; // 선택된 교육분류 select option
		var eduTypeCode = document.getElementById("eduTypeCode"); // 과목코드 text box
		var appr = document.getElementsByName("appr"); // 결재대상 radio button

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
 */
	/* 교육기관 '기타' 선택에 따른 textbox 활성화 */
/* 	function showEduInstBox() {
		var state = document.getElementById("cli").value;
		var etcInputForm = document.getElementById("etcInputForm");

		if(state == 'etc') 
			//etcInputForm.style.display = 'block'; // textbox 보여줌
		else 
			etcInputForm.style.display = 'none'; // textbox 숨김
	} */
	$(document).ready(function(){
		alert("레디는됨");
		$("#btnRegEdu").click(function(){
			alert("클릭은됨");
			insertNewEduRegPop();
		})
	});
	function insertNewEduRegPop(){
		var edctClsfCd = $("#edctClsfCd").val();
		var edctNm = $("#edctNm").val();
		var edctCon = $("#edctCon").val();
		var edinCd = $("#edinCd").val();
		var inbkEdctYn = $('input[name="inbkEdctYn"]:checked').val();
		var eginAplyYn = $('input[name="eginAplyYn"]:checked').val();
		var onlEdctYn = $('input[name="onlEdctYn"]:checked').val();
		var edctLevl = $('input[name="edctLevl"]:checked').val();
		var snctTgtYn = $('input[name="snctTgtYn"]:checked').val();
		if(edctClsfCd == "" || edctClsfCd == null){
			alert("교육 분류 코드를 선택해주세요");return;
		}
		if(edctNm == "" || edctNm == null){
			alert("교육명을 입력해주세요");return;				
		}
		if(edctCon == "" || edctCon == null){
			alert("교육내용을 입력해주세요");return;				
		}
		if(edinCd == "" || edinCd == null){
			alert("교육기관 코드를 선택해주세요");return;				
		}
		if(!(inbkEdctYn == "Y" || inbkEdctYn == "N")){
			alert("행내교육여부를 선택해주세요");return;				
		}
		if(!(eginAplyYn == "Y" || eginAplyYn == "N")){
			alert("고용보험적용 여부를 선택해주세요");return;				
		}
		if(!(onlEdctYn == "Y" || onlEdctYn == "N")){
			alert("온라인 교육여부를 선택해주세요");return;				
		}
		if(!(edctLevl == "상" || edctLevl == "중" || edctLevl == "하")){
			alert("교육 레벨을 선택해주세요");return;				
		}
		if(!(snctTgtYn != "Y" || snctTgtYn != "N")){
			alert("결재 대상 여부를 선택해주세요");return;				
		}
		/* alert("edctClsfCd"+edctClsfCd);
		alert("edctNm"+edctNm);
		alert("edctCon"+edctCon);
		alert("edinCd"+edinCd);
		alert("inbkEdctYn"+inbkEdctYn);
		ale	rt("eginAplyYn"+eginAplyYn);
		alert("onlEdctYn"+onlEdctYn);
		alert("edctLevl"+edctLevl);
		alert("snctTgtYn"+snctTgtYn); */
		alert("할당완료");
	    $.ajax({
			url : "/itep/views/admin/pop/insertNewEduRegPop", //데이터를  넘겨줄 링크 설정
			type : "POST", // post 방식
			data : {
				"edctClsfCd" : edctClsfCd,
				"edctNm" : edctNm,
				"edctCon" : edctCon,
				"edinCd" : edinCd,
				"inbkEdctYn" : inbkEdctYn,
				"eginAplyYn" : eginAplyYn,
				"onlEdctYn" : onlEdctYn,
				"edctLevl" : edctLevl,
				"snctTgtYn" : snctTgtYn
			}, //넘겨줄 데이터
			success: function (responseData) {
				alert("정상등록되었습니다.");
				window.open("about:blank", "_self").close();
			},
			error: function (xhr, status, error) {
				alert("등록 error");					
			}
		});
	}
</script>


