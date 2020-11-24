<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<!-- 게시판>자료실>등록팝업 -->
   <!-- WRAPPER -->
   <div id="wrapper">
	<!-- MAIN -->
	<div class="main">
	   <!-- MAIN CONTENT -->
	   <div class="main-content">
		  <div class="container-fluid">
			 <h3 class="page-title"><b>자료실 등록</b></h3>
			 <div class="row">
				<div class="col-md-9 col-popup">
				   <!-- INPUTS -->
				   <div class="panel panel-headline">
					<div class="panel-body panel-popup">
					 <div style="text-align:right; padding-bottom: 10px;">
						 <button type="button" class="btn btn-primary btn-toastr" onclick="actMod('insert');" >등록</button>
					 </div>
					   <table class="table table-bordered tbl-type1">
						  <tbody>
							 <tr>
								<th>제목</th>
								<td>
									<input type="title" id="ttl" class="form-control" value="">                                    
								</td>
								<th>구분</th>
								<td>
									<div>
									<select id='edctClsfCd' class="form-control">
										<c:forEach items="${edctClsfCdList}" var="list">
											<option value="${list.edctClsfCd}">${list.edctClsfNm}</option>
										</c:forEach>
									</select>
									</div>                                  
								</td>
							 </tr>
							 <tr>
								<th>첨부파일</th>
								<td colspan="3">
									<input multiple="multiple" type="file" id="apndDat" class="form-control" value="">
									<!--
								   <span>
									   <span class="input-group-btn"><button class="btn btn-default btn-xs" type="button">첨부</button></span>
								   </span>
								   -->
								</td>
							 </tr>
							 <tr>
								<td class="txt-long" colspan="4">
									<form>
										<p><textarea id="con" placeholder="공지내용을 입력하세요" style="width:100%; height: 200px;"></textarea></p>
									</form>
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
 function actMod(modType) {
 	var conf = confirm('등록하시겠습니까?');
 	if(conf){
    	var ttl = $("#ttl").val();
    	var apndDat = $("#apndDat").val();
    	var con = $("#con").val();
    	var edctClsfCd = $("#edctClsfCd").val();
		
        $.ajax({
	        url:"/itep/views/board/pop/archRegPop", //데이터를  넘겨줄 링크 설정
			type:"POST", // post 방식
			data: 
	    	    {"ttl" : ttl
	    	    ,"apndDat" : apndDat
	    	    ,"con" : con
	    	    ,"edctClsfCd" : edctClsfCd
	    	    ,"modType" : modType},
			
	         success: function (responseData) {
	        	 //화면 재호출시(작업완료) 제어를 위한 sctipt
	        	 if(responseData==true){
	        		 alert("등록완료");
	        		 opener.parent.location.reload();
	        	 	 window.close();
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

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
