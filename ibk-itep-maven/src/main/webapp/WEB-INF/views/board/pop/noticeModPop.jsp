<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
 <script>
 if("${modType}"=="update"){
	 alert("수정완료");
 }else if("${modType}"=="delete"){
	 alert("삭제완료");
 	 window.close();
 }
 </script>
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
						<button type="button" class="btn btn-success btn-toastr" onclick="actMod('update','${vo.pbnsId}');">수정</button>
						<button type="button" class="btn btn-danger btn-toastr" onclick="actMod('delete','${vo.pbnsId}');">삭제</button>
					</div>
					  <table class="table table-bordered tbl-type1">
						<tbody>
						   <tr>
							  <th>공지ID</th>
							  <td>
								  <input type="text" name="pbnsId" class="form-control" value="${vo.pbnsId}" disabled>
							   </td>
							  <th>교육구분</th>
							  <td>
								<div>
								<select id='edctClsfCd' class="form-control">
									<option value="OTEDU" <c:if test="${vo.edctClsfCd eq 'OTEDU'}">selected</c:if>>외부교육</option> 
									<option value="TREDU" <c:if test="${vo.edctClsfCd eq 'TREDU'}">selected</c:if>>신전입교육</option>
									<option value="SEMIN" <c:if test="${vo.edctClsfCd eq 'SEMIN'}">selected</c:if>>세미나</option>
									<option value="EXTRA" <c:if test="${vo.edctClsfCd eq 'EXTRA'}">selected</c:if>>기타</option>
								</select>
								</div>
							   </td>
						   </tr>
						   <tr>
							  <th>제목</th>
							  <td>
								  <input type="title" name="ttl" class="form-control" value="${vo.ttl}">
							   </td>
							  <th>등록일</th>
							  <td>
								  <input type="reg" name="rgsnTs" class="form-control" value="${vo.rgsnTs}" disabled>
							   </td>
						   </tr>
						   <tr>
							  <th>첨부파일</th>
							  <td colspan="3">
								   <input multiple="multiple" type="file" name="apndDat" class="form-control" value="${vo.apndDat}">
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
								<textarea id ="con" style="width:100%; height: 200px;"><p>$(fn:replace(${vo.con}, newLine, '<br>')}<p></textarea>
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
    	var conf = confirm('수정하시겠습니까?');
    	if(conf){
    		if(modType=="update"){
    	    	var ttl = $('input[name=ttl]').val();
    	    	var apndDat = $('input[name=apndDat]').val();
    	    	var con = $("#con").val();
    	    	var edctClsfCd = $("#edctClsfCd").val();
    			location.href='/itep/views/board/pop/noticeModPop?pbnsId='+pbnsId+
    					'&&modType='+modType+'&&ttl='+ttl+'&&apndDat='+apndDat+'&&con='+con+'&&edctClsfCd='+edctClsfCd;
    		}else if(modType=="delete"){
    			location.href='/itep/views/board/pop/noticeModPop?pbnsId='+pbnsId+'&&modType='+modType;
    		}
    	}
    }
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
