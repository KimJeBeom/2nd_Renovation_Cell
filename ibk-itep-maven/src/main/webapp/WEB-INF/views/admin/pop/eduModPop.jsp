<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	관리자 > 교육 등록 및 수정 > 교육 내용 수정 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title" style="float: left;"><b>교육 내용 수정</b></h3>

					<!-- 상단 버튼 -->
					<button id="btnConfirm" type="button" class="btn btn-primary btn-toastr" style="float: right; vertical-align: bottom; ">수정</button><br><br>

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
													<input name="snctTgtYn" value="Y" type="radio">
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
												<select id="edinCd" class="form-control" style="width: 60%; float: left;">
													<c:forEach items="${cliVoList }" var="cliVo">
														<option value=${cliVo.edinCd }>${cliVo.edinNm }</option>		
													</c:forEach>
												</select> 
											</td>
										</tr>
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
<script>
$(document).ready(function(){
	setEdmValue();	
});
$(document).on("click","#btnConfirm",function(){
 	var edctId = ${param.edctId };
 	var edctNm =  $("#edctNm").val();
		if(verifyValue()){
			if(confirm("\""+edctNm+"\"\n교육을 수정하시겠습니까?")){
				updateEduRegMod();	
			} 			
		}
});
function verifyValue(){
	var edctClsfCd = $("#edctClsfCd").val();
	var edctNm = $("#edctNm").val();
	var edctCon = $("#edctCon").val();
	var edinCd = $("#edinCd").val();
	var inbkEdctYn = $('input[name="inbkEdctYn"]:checked').val();
	var eginAplyYn = $('input[name="eginAplyYn"]:checked').val();
	var onlEdctYn = $('input[name="onlEdctYn"]:checked').val();
	var edctLevl = $('input[name="edctLevl"]:checked').val();
	var snctTgtYn = $('input[name="snctTgtYn"]:checked').val();
	if(edctClsfCd == "" || edctClsfCd == null|| edctClsfCd == "undefined"){
		alert("교육 분류 코드를 선택해주세요");return false;
	}
	if(edctNm == "" || edctNm == null || edctNm == "undefined" ){
		alert("교육명을 입력해주세요");return false;				
	}
	if(edctCon == "" || edctCon == null || edctCon == "undefined"){
		alert("교육내용을 입력해주세요");return false;				
	}
	if(edinCd == "" || edinCd == null || edinCd == "undefined"){
		alert("교육기관 코드를 선택해주세요");return false;				
	}
	if(!(inbkEdctYn == "Y" || inbkEdctYn == "N")){
		alert("행내교육여부를 선택해주세요");return false;				
	}
	if(!(eginAplyYn == "Y" || eginAplyYn == "N")){
		alert("고용보험적용 여부를 선택해주세요");return false;				
	}
	if(!(onlEdctYn == "Y" || onlEdctYn == "N")){
		alert("온라인 교육여부를 선택해주세요");return false;				
	}
	if(!(edctLevl == "상" || edctLevl == "중" || edctLevl == "하")){
		alert("교육 레벨을 선택해주세요");return false;				
	}
	if(!(snctTgtYn != "Y" || snctTgtYn != "N")){
		alert("결재 대상 여부를 선택해주세요");return false;				
	}
	return true;
}
function setEdmValue(){
	$("#edctClsfCd").val("${eduRegModVo.edctClsfCd }");
	$("#eginAplyYn").val("${eduRegModVo.eginAplyYn }");
	$("#edctNm").val("${eduRegModVo.edctNm }");
	$("#edctCon").val("${eduRegModVo.edctCon }");
	$("#edinCd").val("${eduRegModVo.edinCd }");
	$('input[name="inbkEdctYn"]').each(function() {
		if($(this).val() == "${eduRegModVo.inbkEdctYn }"){
			$(this).prop('checked', true);	
		}else
		$(this).prop('checked', false);
	});
	$('input[name="snctTgtYn"]').each(function() {
		if($(this).val() == "${eduRegModVo.snctTgtYn }"){
			$(this).prop('checked', true);	
		}else
		$(this).prop('checked', false);
	});
	$('input[name="eginAplyYn"]').each(function() {
		if($(this).val() == "${eduRegModVo.eginAplyYn }"){
			$(this).prop('checked', true);	
		}else
		$(this).prop('checked', false);
	});
	$('input[name="onlEdctYn"]').each(function() {
		if($(this).val() == "${eduRegModVo.onlEdctYn }"){
			$(this).prop('checked', true);	
		}else
		$(this).prop('checked', false);
	});
	$('input[name="edctLevl"]').each(function() {
		if($(this).val() == "${eduRegModVo.edctLevl }"){
			$(this).prop('checked', true);	
		}else
		$(this).prop('checked', false);
	});
};

function updateEduRegMod(){
    $.ajax({
		url : "/itep/views/admin/pop/updateEduRegMod", //데이터를  넘겨줄 링크 설정
		type : "POST", // post 방식
		data : {
			"edctId" 		: ${param.edctId },
			"edctClsfCd" 	: $("#edctClsfCd").val(),
			"edctNm" 		: $("#edctNm").val(),
			"edctCon" 		: $("#edctCon").val(),
			"edinCd" 		: $("#edinCd").val(),
			"snctTgtYn" 	: $('input[name="snctTgtYn"]:checked').val(),
			"inbkEdctYn" 	: $('input[name="inbkEdctYn"]:checked').val(),
			"eginAplyYn" 	: $('input[name="eginAplyYn"]:checked').val(),
			"onlEdctYn" 	: $('input[name="onlEdctYn"]:checked').val(),
			"edctLevl" 		: $('input[name="edctLevl"]:checked').val()			
		}, //넘겨줄 데이터
		success: function (responseData) {
			alert("정상 수정 되었습니다.");
			opener.location.reload();
			window.open("about:blank", "_self").close();
		},
		error: function (xhr, status, error) {
			alert("수정 error");					
		}
	});
}


</script>


