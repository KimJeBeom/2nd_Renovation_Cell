<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
 <script>
 //화면 재호출시(작업완료) 제어를 위한 sctipt
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
				   <!-- 작업수행을 위한 버튼 -->
					<div style="text-align:right; padding-bottom: 10px;">
						<button type="button" class="btn btn-success btn-toastr" onclick="actMod('update','${vo.pbnsId}');">수정</button>
						<button type="button" class="btn btn-danger btn-toastr" onclick="actMod('delete','${vo.pbnsId}');">삭제</button>
					</div>
					<!-- 상세조회결과 -->
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
								<!-- select박스 :최초조회 및 변경처리결과값 전달을 위한 설정 -->
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
							   </td>
						   </tr>
							<tr>
							   <td class="txt-long" colspan="4">
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
   //수정 및 삭제 버튼 클릭에 따른 결과 처리
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
