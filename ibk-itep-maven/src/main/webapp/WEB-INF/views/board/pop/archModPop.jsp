<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 게시판>자료실>상세조회팝업 -->
<body>
   <!-- WRAPPER -->
   <div id="wrapper">
	<!-- MAIN -->
	<div class="main">
	   <!-- MAIN CONTENT -->
	   <div class="main-content">
		  <div class="container-fluid">
			 <h3 class="page-title"><b>자료실(상세)</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
				   <div class="panel-body panel-popup">
				   <!-- 작업수행을 위한 버튼 -->
					<div style="text-align:right; padding-bottom: 10px;">
						<button type="button" class="btn btn-success btn-toastr" onclick="actMod('update','${vo.rflbId}');">수정</button>
						<button type="button" class="btn btn-danger btn-toastr" onclick="actMod('delete','${vo.rflbId}');">삭제</button>
					</div>
					<!-- 상세조회결과 -->
					  <table class="table table-bordered tbl-type1">
						<tbody>
						   <tr>
							  <th>공지ID</th>
							  <td>
								  <input type="text" name="rflbId" class="form-control" value="${vo.rflbId}" disabled>
							   </td>
							  <th>교육구분</th>
							  <td>
								<div>
								<!-- select박스 :최초조회 및 변경처리결과값 전달을 위한 설정 -->
								<select id='edctClsfCd' class="form-control">
									<c:forEach items="${edctClsfCdList}" var="list">
										<option value="${list.edctClsfCd}"<c:if test="${vo.edctClsfCd eq list.edctClsfCd}">selected</c:if>>${list.edctClsfNm}</option>
									</c:forEach>
								</select>
								</div>
							   </td>
						   </tr>
						   <tr>
							  <th>제목</th>
							  <td>
								  <input type="text" name="ttl" class="form-control" value="${vo.ttl}">
							   </td>
							  <th>등록일</th>
							  <td>
								  <input type="text" name="rgsnTs" class="form-control" value="${vo.rgsnTs}" disabled>
							   </td>
						   </tr>
						   <tr>
							  <th>첨부파일</th>
							  <td colspan="3">
					   			<section id="container">
									<form name="updateForm" role="form" method="post" action="/itep/updateFile" enctype="multipart/form-data">
										<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
									</form>
									<form name="readForm" role="form" method="post">
										<input id="file_no" name="file_no" style="display:none" value="" > 
									</form>
										<c:forEach items="${fileVoList}" var="file">
											<c:if test="${file.del_yn == 'N'}">
												<div class="form-group" style="border: 1px solid #dbdbdb; text-align:Left;">
													<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)
													<button id="fileDel" onclick="fn_del('${file.file_no}');" type="button">삭제</button><br>
												</div>
											</c:if>
										</c:forEach>
								</section>
							  </td>
						   </tr>
							 <tr>
								<th><button class="fileAdd_btn" type="button">파일추가</button></th>
								<td colspan="3">
									<form name="writeForm"  id="excelForm" method="post" action="upload" enctype="multipart/form-data">
									<input type="text" name="code_nm" style="display:none" value="BDN">
									<input type="text" name="pbns_id" style="display:none" value="${vo.rflbId}">
									<div id="fileIndex"></div>
									</form>	
								</td>
							 </tr>
							<tr>
							<tr>
							   <td class="txt-long" colspan="4">
								<textarea id ="con" style="width:100%; height: 200px;">${vo.con}</textarea>
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
 
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
 <script>
   //수정 및 삭제 버튼 클릭에 따른 결과 처리
   function actMod(modType,rflbId) {
	var conf = confirm('수정하시겠습니까?');
 	if(conf){
    	var ttl = $('input[name=ttl]').val();
	    var con = $("#con").val();
	   	var edctClsfCd = $("#edctClsfCd").val();
	   	var addFileCnt = $('.addFile').length;
	   	
   	    var form = $('#excelForm')[0];
	    // FormData 객체 생성
	    var formData = new FormData(form);
	    
	    formData.append("rflbId",rflbId);
	    formData.append("ttl",ttl);
	    formData.append("con",con);
	    formData.append("edctClsfCd",edctClsfCd);
	    formData.append("modType",modType);
	    formData.append('fileNoArray[]',fileNoArry);
	    formData.append("addFileCnt",addFileCnt);
	    
        $.ajax({
	        url:"/itep/views/board/pop/noticeModPop", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
	   	    enctype: 'multipart/form-data',
		   	processData: false,
		   	contentType: false,
	   	 	dataType : 'json',
			data:formData,

	         success: function (responseData) {
	        	 //화면 재호출시(작업완료) 제어를 위한 sctipt
	        	 if(responseData==true){
	        		 if(modType=="update"){
	        			 alert("수정완료");
	        			 location.reload();
	        		 }else if(modType=="delete"){
	        			 alert("삭제완료");
	        			 opener.parent.location.reload();
		        	 	 window.close();	 
	        		 } 
	        	 }else{
	        		 alert("작업에 실패 하였습니다. 다시 시도하여 주세요");
	        	 }
	          },
	         error: function (xhr, status, error) {
	        	 alert("작업에 실패 하였습니다. 다시 시도하여 주세요 \n"+ xhr +" // " + status +" // "+error);
	          }
		});
 	}
 }
   
   
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
			$("#fileIndex").append("<div class='addFile'><input type='file' style='float: left;width:50%;' name='file_"+(fileIndex++)+"'>"+"<button style='float: right' type='button' id='fileDelBtn'>"+"삭제"+"</button></div><br>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
</script>

