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
											<c:if test ="${vo.snctTgtYn eq 'Y' && modType eq 'insert'}">
											<td style="width: 5%; text-align: center; padding-bottom: 10px;"><b>■ 부서 결재자</b></td>
											<td style="width: 5%; padding-bottom: 10px;">
												<div>
													<select class="form-control" id="dpmid">														
													<c:forEach items="${dpmList}" var="dpmList">
														<option value="${dpmList.userId}">${dpmList.userNm}</option>
													</c:forEach>
													</select>
												</div>
											</td>
											</c:if>
											<td style="width: 10%; padding-left: 5px; text-align: right; padding-bottom: 10px;">
												<c:choose>
													<c:when test="${modType eq 'insert'}">
														<button style="text-align:right;" type="button" class="btn btn-primary" onclick="fstApply();">결재요청</button>	 
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
										   <th>첨부파일</th>
										   <td colspan="3">
												<input multiple="multiple" type="file" id="file" class="form-control" value="">
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
<script>
function fstApply(){
   	var conf = confirm('등록하시겠습니까?');
   	if(conf==true){
   	   	var edctCntId = '${vo.edctCntId}'; //교육차수id
		var dpmAthzId = $("#dpmid").val(); //부서결제자
		var	apndDat = $("#file").val(); //첨부파일
		var	snctTgtYn = '${vo.snctTgtYn}'; //결제여부
		
		/* if(apndDat==""){
       		alert("전체 내용을 입력해주세요");
		} */
		
 	     $.ajax({
		        url:"/itep/views/board/pop/noticeRegPop", //데이터를  넘겨줄 링크 설정
				type:"POST", // post 방식
				data: 
		    	    {"edctCntId" : edctCntId
		    	    ,"dpmAthzId" : dpmAthzId
		    	    ,"apndDat" : apndDat
		    	    ,"snctTgtYn" : snctTgtYn
		    	    ,"modAct" : "insert"},
				
		         success: function (responseData) {
		        	 //화면 재호출시(작업완료) 제어를 위한 sctipt
		        	 if(responseData=='success'){
		        		 alert("처리완료");
		        		 opener.parent.location.reload();
		        	 	 window.close();
		        	 }else if(responseData=='fail'){
		        		 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
		        	 }else{
		        		 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
		        	 }
		          },
		         error: function (xhr, status, error) {
		        	 alert("등록에 실패 하였습니다. 다시 시도하여 주세요 \n"+ xhr +" // " + status +" // "+error);
		          }
			});
   	}
   	
}

</script>

<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

