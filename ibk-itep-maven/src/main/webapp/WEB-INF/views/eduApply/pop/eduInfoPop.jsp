<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 
	교육 신청 > 교육 목록 > 교육 안내 및 신청 팝업
-->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>교육 신청</b></h3>
					<div class="row">
					<!-- 신청시 결재 대상인 교육일 경우 안내 매세지 및 부서결재자 정보 활성화 -->
	 				<c:if test ="${vo.snctTgtYn eq 'Y' && modType eq 'insert'}">
						<b>&nbsp;&nbsp;* 결재요청시 부서 관리자(기획팀장/기획서무 책임자)에게 전달 됩니다.</b><br>
					</c:if>
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
							<div class="panel-body panel-popup">
								<!--<div style="text-align:left; padding-bottom: 10px;">-->
								<table>
									<tbody>
										<tr>
											<!-- 신청시 결재 대상인 교육일 경우 안내 매세지 및 부서결재자 정보 활성화 -->
											<c:if test ="${vo.snctTgtYn eq 'Y' && modType eq 'insert'}">
											<td style="width: 8%; text-align: center; padding-bottom: 10px;"><b>■ 부서 결재자</b></td>
											<td style="width: 7%; padding-bottom: 10px;">
												<div>
													<select class="form-control" id="dpmid"  style="width:230px;">														
													<c:forEach items="${dpmList}" var="dpmList">
														<option value="${dpmList.userId}">${dpmList.brnm} ${dpmList.userNm}</option>
													</c:forEach>
													</select>
												</div>
											</td>
											</c:if>
											<!-- 신청시 이전화면에서 불러온 ModType에 따라 버튼 구분 -->
											<td style="width: 10%; padding-left: 5px; text-align: right; padding-bottom: 10px;">
												<c:choose>
													<c:when test="${modType eq 'insert'}">
														<button style="text-align:right;" type="button" class="btn btn-primary" onclick="fstApply('insert');">결재요청</button>	 
													</c:when>
													<c:when test="${modType eq 'update'}">
														<button style="text-align:right;" type="button" class="btn btn-primary">재요청</button>	 
													</c:when>
													<c:when test="${modType eq 'delete'}">
														<button style="text-align:right;" type="button" class="btn btn-primary">삭제</button>	 
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>											
											</td>
										</tr>
									</tbody>
								</table>
								<!-- 교육 안내 테이블 -->
								<table class="table table-bordered tbl-type1">
									<tbody>
										<tr>
											<th>교육분류</th>
							   				<td>${vo.edctClsfNm}</td>
											<th>결재대상</th>
											<c:choose>
												<c:when test="${vo.snctTgtYn eq 'Y'}">
													<td>결재대상</td>	 
												</c:when>
												<c:otherwise>
													<td>대상외</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<th>과목명</th>
							   				<td colspan="3">${vo.edctNm}</td>
										</tr>
										<tr>
											<th>교육기관</th>
							   				<td>${vo.edinNm}</td>
											<th>교육방식</th>
							   				<td>${vo.edctTrm}일</td>
										</tr>
										<tr>
											<th>학습기간</th>
											<td>2020-02-01 ~ 2020-02-05</td>
											<th>교육수준</th>
							   				<td>${vo.edctLevl}</td>
										</tr>
										<tr>
										   <th>첨부파일<br><button class="fileAdd_btn" type="button">파일추가</button></th>
										   <td colspan="3">
												<form name="writeForm"  id="excelForm" method="post" action="upload" enctype="multipart/form-data">
												<input type="text" name="code_nm" style="display:none" value="EDA">
												<input type="text" name="pbns_id" style="display:none" value="">
												<div id="fileIndex"></div>
												</form>
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
//최초교육 등록(insert)할 경우 수행되는 function
function fstApply(modAct){
	var addFileCnt = $('.addFile').length; //파일개수
   	var edctCntId = '${vo.edctCntId}'; //교육차수id
	var dpmAthzId = $("#dpmid").val(); //부서결제자
	var	snctTgtYn = '${vo.snctTgtYn}'; //결제여부
	
	if(addFileCnt==0){
		alert("파일첨부는 필수입니다."); return;
	}if(dpmAthzId==null || dpmAthzId=="" ){
		alert("부서결재자를 지정해주세요"); return;
	}
	
   	var conf = confirm('등록하시겠습니까?');
   	if(conf==true){

   		var form = $('#excelForm')[0];
	    // FormData 객체 생성
	    var formData = new FormData(form);
	    formData.append("edctCntId",edctCntId);
	    formData.append("dpmAthzId",dpmAthzId);
	    formData.append("snctTgtYn",snctTgtYn);
	    formData.append("modAct",modAct);
	    formData.append("addFileCnt",addFileCnt);
				
 	     $.ajax({
		        url:"/itep/views/eduApply/pop/eduInfoPop", //데이터를  넘겨줄 링크 설정
				type:"POST", // post 방식
		   	    enctype: 'multipart/form-data',
			   	processData: false,
			   	contentType: false,
		   	 	//dataType : 'json',
				data: formData,
				
		         success: function (responseData) {
		        	 //화면 재호출시(작업완료) 제어를 위한 sctipt
 		        	 if(responseData=='success'){
		        		 alert("처리완료");
		        	 	 window.close();
		        	 }else if(responseData=='fail'){
		        		 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
		        	 }else if(responseData=='disable'){
		        		 alert("기 신청건이 있습니다. 확인바랍니다.");
		        	 }else{
		        		 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
		        	 }
		          },
		         error: function (xhr, status, error) {
		        	 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
		          }
			});
   	}
   	
}

$(document).ready(function(){
	fn_addFile();
})
function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div class='addFile'><input type='file' style='float: left;width:95%;' name='file_"+(fileIndex++)+"'>"+"<img src='/itep/assets/itep/img/icon/delete-icon.png' style='width:22px; height:22px; float: left' id='fileDelBtn'></div>");	
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}
</script>

