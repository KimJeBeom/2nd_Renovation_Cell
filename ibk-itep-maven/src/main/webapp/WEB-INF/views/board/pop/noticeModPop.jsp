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
			 <h3 class="page-title"><b>공지사항(상세)</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
				   <div class="panel-body panel-popup">
					<div style="text-align:right; padding-bottom: 10px;">
						<button type="button" class="btn btn-success btn-toastr" onclick="actMod('update',${vo.pbnsId});">수정</button>
						<button type="button" class="btn btn-danger btn-toastr">삭제</button>
					</div>
					  <table class="table table-bordered tbl-type1">
						<tbody>
						   <tr>
							  <th>제목</th>
							  <td>
								  <input type="title" name="title" class="form-control" value="${vo.ttl}">
							   </td>
							  <th>등록일</th>
							  <td>
								  <input type="reg" name="reg" class="form-control" value="${vo.rgsnTs}" disabled>
							   </td>
						   </tr>
						   <tr>
							  <th>첨부파일</th>
							  <td colspan="3">
								   <input multiple="multiple" type="file" name="file" class="form-control" value="${vo.apndDat}">
								   <!--
								  <span>
									  <span class="input-group-btn"><button class="btn btn-default btn-xs" type="button">첨부</button></span>
								  </span>
								  -->
							   </td>
						   </tr>
							<tr>
							   <td class="txt-long" colspan="4">
								   <!--
								<br >
								- 다형성과 Loose Coupling 개념을 개발기간 뿐만 아니라 유지보수 및 확장시 개발자가 어떻게 적용할 수 있는지 학습합니다. <br >
								- 디자인 패턴 등 현장의 개발자에게 필요하지만 어려운 개념을 쉽고 구체적으로 접근합니다.
								<br ><br >
								-->
								<textarea readonly style="width:100%; height: 200px;">${vo.con}</textarea>
							   </td>
							</tr>
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
 <!-- Javascript -->
 <script>
	/* 팝업 */
    function showEduApplyPop() {
       window.open('eduApplyPop.jsp', 'eduApplyPop', 'location=no, width=750, height=600, left=100, top=100');
    };
    function actMod(modType,pbnsId) {
    	if(modtype!=null){
    		location.href='/itep/views/board/pop/noticeModPop?pbnsId='+pbnsId+'modType='+modType;
    	}else{
    		location.href='/itep/views/board/pop/noticeModPop?pbnsId='+pbnsId;
    	} 
    }	
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
