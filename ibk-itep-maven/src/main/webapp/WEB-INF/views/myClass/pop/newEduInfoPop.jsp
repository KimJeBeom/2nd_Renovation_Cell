<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	내학습실 > 과정개설신청현황 > 과정개설 신청 상세확인 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>과정개설 신청</b></h3>
						<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">

								<!-- 과정개설신청 상세내역 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>부서명</th>
											<td>${newEduInfoPop.brnm }</td>
											<th>직원명</th>
											<td>${newEduInfoPop.userNm }</td>
										</tr>
										<tr>
											<th>교육구분</th>
											<td>${newEduInfoPop.edctYn }</td>
											<th>교육기관</th>
											<td colspan="3">${newEduInfoPop.edinNm }</td>
										</tr>
										<tr>
											<th>과목명</th>
											<td colspan="3">${newEduInfoPop.edctNm}</td>
										</tr>
										<tr>
											<th>교육내용</th>
											<td class="txt-long" colspan="3">${newEduInfoPop.edctCon }</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>${newEduInfoPop.edctSttgYmd} ~ ${newEduInfoPop.edctFnshYmd }</td>
											<th>신청기간</th>
											<td>${newEduInfoPop.aplcSttgYmd } ~ ${newEduInfoPop.aplcFnshYmd }</td>
										</tr>
										<tr>
											<th>교육시간</th>
											<td>${newEduInfoPop.edctSttgTim } ~ ${newEduInfoPop.edctFnshTim }</td>
											<th>교육비용</th>
											<td>${newEduInfoPop.edex }</td>
										</tr>
										<tr>
											<th>교육방식</th>
											<td>${newEduInfoPop.onlEdctYn }</td>
											<th>교육수준</th>
											<td>${newEduInfoPop.edctLevl }</td>
										</tr>
										<tr>
											<th>첨부파일</th>
								   		   <td colspan="3">
								   			<section id="container">
												<form name="readForm" role="form" method="post">
													<input id="file_no" name="file_no" style="display:none" value="" > 
												</form>
													<c:forEach items="${fileVoList}" var="file">
														<c:if test="${file.del_yn == 'N'}">
															<div class="form-group" style="border: 1px solid #dbdbdb; text-align:Left;">
																<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)
															</div>
														</c:if>
													</c:forEach>
											</section>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

var fileNoArry = new Array();

function fn_fileDown(fileNo){
var formObj = $("form[name='readForm']");
$("#file_no").attr("value", fileNo);
formObj.attr("action", "/itep/views/cmm/fileDownload");
formObj.submit();
}

function fn_del(file_no){
	fileNoArry.push(file_no);
	$("#fileNoDel").attr("value", fileNoArry);
	$(document).on("click","#fileDel", function(){
	$(this).parent().remove();
});
	//alert(fileNoArry);
}

function fn_fileUpdate(){
	var formObj = $("form[name='updateForm']");
	formObj.submit();
}

$(document).ready(function(){
fn_addFile();
})
function fn_addFile(){
var fileIndex = 1;
$(".fileAdd_btn").on("click", function(){
	$("#fileIndex").append("<div><input type='file' style='float: left;width:90%;' name='file_"+(fileIndex++)+"'>"+"<button style='float: left' type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");	});
$(document).on("click","#fileDelBtn", function(){
	$(this).parent().remove();
	
});
}
</script>

