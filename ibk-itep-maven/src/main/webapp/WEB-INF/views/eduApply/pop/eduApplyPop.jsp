<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
   <!-- WRAPPER -->
   <div id="wrapper">
	<!-- MAIN -->
	<div class="main">
	   <!-- MAIN CONTENT -->
	   <div class="main-content">
		  <div class="container-fluid">
			 <h3 class="page-title"><b>교육 안내 및 신청</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
				   <div class="panel-body panel-popup">
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
							   <th>교육내용</th>
							   <td class="txt-long" colspan="3">
								  <br >
								  ${vo.edctCon}
								  <br >
							   </td>
							</tr>
							<tr>
							   <th>교육기관</th>
							   <td>${vo.edinNm}</td>
							   <th>교육비용</th>
							   <td>${vo.edex}</td>
							</tr>
							<tr>
							   <th>교육기간</th>
							   <td>${vo.edctTrm}일</td>
							   <th>이수시간</th>
							   <td>${vo.ctcrTim}시간</td>
							</tr>
							<tr>
							   <th>교육방식</th>
							   <c:choose>
									<c:when test="${vo.onlEdctYn eq 'Y'}">
										<td>온라인</td>	 
									</c:when>
									<c:otherwise>
										<td>오프라인</td>
									</c:otherwise>
							   </c:choose>
							   <th>교육수준</th>
							   <td>${vo.edctLevl}</td>
							</tr>
						 </tbody>
					  </table>
					  <table class="table table-bordered tbl-type2">
					  <thead>
						 <tr>
							<th>No</th>
							<th>학습기간</th>
							<th>신청기간</th>
							<th style="width: 25%;">신청</th>
						 </tr>
					  </thead>
					  <tbody>
						<c:forEach items="${list}" var="cntList" varStatus="status">
						<tr>
							<td style="text-align:center">${fn:length(list)-status.count+1}
							<td style="text-align:center">${cntList.edctSttgYmd} ~ ${cntList.edctFnshYmd}
							<td style="text-align:center">${cntList.aplcSttgYmd} ~ ${cntList.aplcFnshYmd}
							<c:choose>
								<c:when test="${cntList.aplcAbleYn eq 'Y'}">
									<td style="text-align:center"><button type="button" class="btn btn-primary btn-toastr" onclick="showPopup('eduApply','eduInfoPop?edctCntId=${cntList.edctCntId}&&modType=insert&&snctTgtYn=${vo.snctTgtYn}');">교육신청</button></td>	 
								</c:when>
								<c:otherwise>
									<td style="text-align:center"><button type="button" class="btn btn-default btn-toastr" disabled="disabled">신청마감</button></td>
								</c:otherwise>
							</c:choose>
						</tr>						
						</c:forEach>
					  </tbody>
					  </table>
				   </div>
				   </div>
				   <!-- END INPUTS -->
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
function showApplyPopup(menu, name, edctCntId, modType, snctTgtYn) {
	var size = '';
	
	// 교육신청 결재 요청 팝업
	if (name == 'eduInfoPop')
		size = 'location=no, width=750, height=430, left=200, top=200';

	window.open('/itep/views/'+menu+'/pop/'+name+'?edctCntId='+edctCntId+'&&modType='+modType+'&&snctTgtYn='+snctTgtYn, '_blank', size); 
}	
</script>
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
