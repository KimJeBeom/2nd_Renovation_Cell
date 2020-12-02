<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
 	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<br>
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/eduapply-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>과정 개설 신청</b>
							</h1>
						</div>
					</div>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<br>
							<div class="table-border">
								<table class="tbl-type5">
									<tbody>
									<tr>
										<td class="info" width="150px"><b>과목명</b></td>
										<td colspan="3">
											<input id="edctNm" type="text" name="title" class="form-control" value="">                                    
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육구분</b></td>
										<td width="500px">
											<label class="fancy-radio col-md-3">
												<input id="inbkEdctYn" name="inbkEdctYn" value="Y" type="radio">
												<span><i></i>행내</span>
											</label>
											<label class="fancy-radio col-md-3">
												<input id="inbkEdctYn" name="inbkEdctYn" value="N" type="radio">
												<span><i></i>행외</span>
											</label>
										</td>
										<td class="info" width="150px"><b>교육기관</b></td>
										<td width="500px">
											<input id="edinNm" type="text" name="academy" class="form-control" value="">
										</td>                  
									</tr>
									<tr>
										<td class="info"><b>교육내용 및<br>신청사유</b></td>
										<td colspan="3">
											<form>
												<textarea id="edctCon" class="form-control" placeholder="" style="width:100%; height:200px;"></textarea>
											</form>
										</td>
									</tr>
									<tr>
										<td class="info"><b>신청기간</b></td>
										<td>
											<div class="ui form">
												<div class="two fields" style="margin-bottom: 0px">
													<div class="field">
														<div class="ui calendar" id="aplcRangeStart">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i>
																<input id="aplcSttgYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
													<h5>~</h5>
													<div class="field">
														<div class="ui calendar" id="aplcRangeEnd">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i>
																<input id="aplcFnshYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
										<td class="info"><b>학습기간</b></td>
										<td>
											<div class="ui form">
												<div class="two fields" style="margin-bottom: 0px">
													<div class="field">
														<div class="ui calendar" id="edctRangeStart">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i>
																<input id="edctSttgYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
													<h5>~</h5>
													<div class="field">
														<div class="ui calendar" id="edctRangeEnd">
															<div class="ui input left icon">
																<i class="calendar icon" style="font-size: 14px;"></i>
																<input id="edctFnshYmd" type="text"
																	style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육시간</b></td>
										<td>
											<div class="ui form">
												<div class="two fields" style="margin-bottom: 0px">
													<div class="field">
														<div class="ui calendar" id="edctTimRangeStart">
															<div class="ui input left icon">
																<i class="time icon" style="font-size: 14px;"></i>
																<input id="edctSttgTim" type="text" style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
													<h5> ~ </h5>
													<div class="field">
														<div class="ui calendar" id="edctTimRangeEnd">
															<div class="ui input left icon">
																<i class="time icon" style="font-size: 14px;"></i>
																<input id="edctFnshTim"  type="text" style="height: 35px; font-size: 14px;">
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
										<td class="info"><b>교육비용</b></td>
										<td><input id="edex" type="text" class="form-control" placeholder="" style="width: 80%; float: left;  value=""">
												<span><i></i>(원)</span>
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육방식</b></td>
										<td>
											<label class="fancy-radio col-md-3">
												<input id="onlEdctYn" name="onlEdctYn" value="Y" type="radio">
												<span><i></i>온라인</span>
											</label>
											<label class="fancy-radio col-md-3">
												<input id="onlEdctYn" name="onlEdctYn" value="N" type="radio">
												<span><i></i>오프라인</span>
											</label>
										</td>
										<td class="info"><b>교육수준</b></td>
										<td>
											<label class="fancy-radio col-md-2">
												<input id="edctLevl" name="edctLevl" value="상" type="radio">
												<span><i></i>상</span>
											</label>
											<label class="fancy-radio col-md-2">
												<input id="edctLevl" name="edctLevl" value="중" type="radio">
												<span><i></i>중</span>
											</label>
											<label class="fancy-radio col-md-2">
												<input id="edctLevl" name="edctLevl" value="하" type="radio">
												<span><i></i>하</span>
											</label>
										</td>
									</tr>
									<tr>
										<td class="info"><b>첨부파일<br><button class="fileAdd_btn" type="button">파일추가</button></b></td>
										<td colspan="3">
											<form name="writeForm"  id="excelForm" method="post" action="upload" enctype="multipart/form-data">
											<input type="text" name="code_nm" style="display:none" value="EDO">
											<input type="text" name="pbns_id" style="display:none" value="">
											<div id="fileIndex"></div>
											</form>	
										</td>
									</tr>
									</tbody>
								</table>
							</div>
							<br>
							<div class="form-group row" style="text-align:center">
								<div class="col-lg-12">
									<input id="apply" type="button" class="btn btn-primary btn-lg mr-2" value="신청" onclick="insertNewEdu();">
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
		<footer>
			<div class="container-fluid">
				<!-- <p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a> -->
</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
<script>
function insertNewEdu() {
   	var conf = confirm('등록하시겠습니까?');
   	if(conf==true){
	    var	inbkEdctYn = $('input[name="inbkEdctYn"]:checked').val(); //행내교육여부
		var	edctNm = $("#edctNm").val(); //교육명   
		var	edctCon = $("#edctCon").val();//교육내용 및 신청사유    
		var	edinNm = $("#edinNm").val(); //교육기관명  
		var	aplcSttgYmd = $("#aplcSttgYmd").val().split(".").join("-");
		var	aplcFnshYmd = $("#aplcFnshYmd").val().split(".").join("-");
		var	edctSttgYmd = $("#edctSttgYmd").val().split(".").join("-");
		var	edctFnshYmd = $("#edctFnshYmd").val().split(".").join("-");
		var	edctSttgTim = $("#edctSttgTim").val(); //교육시작시간 
		var	edctFnshTim = $("#edctFnshTim").val(); //교육종료시간
		var	edex = $("#edex").val(); //교육비용
		var	onlEdctYn = $('input[name="onlEdctYn"]:checked').val(); //온라인교육여부
		var	edctLevl = $('input[name="edctLevl"]:checked').val(); //교육수준
		var addFileCnt = $('.addFile').length;

   	    var form = $('#excelForm')[0];
	    // FormData 객체 생성
	    var formData = new FormData(form);
	    
	    formData.append("inbkEdctYn",inbkEdctYn);
	    formData.append("edctNm",edctNm);
	    formData.append("edctCon",edctCon);
	    formData.append("edinNm",edinNm);
	    formData.append("aplcSttgYmd",aplcSttgYmd);
	    formData.append("aplcFnshYmd",aplcFnshYmd);
	    formData.append("edctSttgYmd",edctSttgYmd);
	    formData.append("edctFnshYmd",edctFnshYmd);
	    formData.append("edctSttgTim",edctSttgTim);
	    formData.append("edctFnshTim",edctFnshTim);
	    formData.append("edex",edex);
	    formData.append("onlEdctYn",onlEdctYn);
	    formData.append("edctLevl",edctLevl);
	    formData.append("modAct","insert");
	    formData.append("addFileCnt",addFileCnt);
		
		if(inbkEdctYn==""||edctNm==""||edctCon==""||edinNm==""||edctSttgYmd==""||edctFnshYmd==""||aplcSttgYmd==""||aplcFnshYmd==""
				||edctSttgTim==""||edctFnshTim==""||edex==""||onlEdctYn==""||edctLevl==""){
	       	 alert("전체 내용을 입력해주세요");
	       	 
		}else{
		     $.ajax({
			        url:"/itep/views/eduApply/newEduApply", //데이터를  넘겨줄 링크 설정
					type:"POST", // post 방식
			   	    enctype: 'multipart/form-data',
				   	processData: false,
				   	contentType: false,
			   	 	//dataType : 'json',
					data: formData,
					
			         success: function (responseData) {
			        	 if(responseData=='success'){
				        	 alert("정상등록 되었습니다.");
				        	 location.href='/itep/views/eduApply/newEduApply';
			        	 }else if(responseData=='fail'){
			        		 alert("등록에 실패 하였습니다. 다시 시도하여 주세요");
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
 }

$(document).ready(function(){
	$('#aplcRangeStart').calendar({
		type: 'date',
		endCalendar: $('#aplcRangeEnd'),
		formatter: {
			date: function (date, settings) {
				if (!date) return '';
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				return year + '.' + month + '.' + day;
			}
		},
  	
	});
 	$('#aplcRangeEnd').calendar({
		type: 'date',
		startCalendar: $('#aplcRangeStart'),
		formatter: {
			date: function (date, settings) {
				if (!date) return '';
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				return year + '.' + month + '.' + day;
			}
		}
	});

	$('#edctRangeStart').calendar({
		type: 'date',
		endCalendar: $('#edctRangeEnd'),
		formatter: {
			date: function (date, settings) {
				if (!date) return '';
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				return year + '.' + month + '.' + day;
			}
		},
 	    popupOptions: {
	 	     position: 'bottom left',
	 	     lastResort: 'bottom left',
	 	     prefer: 'opposite',
	 	     hideOnScroll: false
	 	}
	});
 	$('#edctRangeEnd').calendar({
		type: 'date',
		startCalendar: $('#edctRangeStart'),
		formatter: {
			date: function (date, settings) {
				if (!date) return '';
				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();
				return year + '.' + month + '.' + day;
			}
		},
 	    popupOptions: {
	 	     position: 'top left',
	 	     lastResort: 'top left',
	 	     prefer: 'opposite',
	 	     hideOnScroll: false
	 	}
	});
 	$('#edctTimRangeStart').calendar({
 	    type: 'time',
 	   	ampm: false,
 	    endCalendar: $('#edctTimRangeEnd'),
 	    popupOptions: {
 	     position: 'top right',
 	     lastResort: 'top right',
 	     prefer: 'opposite',
 	     hideOnScroll: false
 	    }
 	});
 	$('#edctTimRangeEnd').calendar({
 	    type: 'time',
 	   	ampm: false,
 	    startCalendar: $('#edctTimRangeStart'),
 		popupOptions: {
 	     position: 'top right',
 	     lastResort: 'top right',
 	     prefer: 'opposite',
 	     hideOnScroll: false
 	   }	 	    
 	});
});

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