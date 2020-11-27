<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />
<!-- 
	관리자 > 교육 등록 및 수정 > 교육 차수 추가 팝업
 -->

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title"><b>교육 차수 추가</b></h3>
					<div class="row">
						<div class="col-md-9 col-popup">
							<div class="panel panel-headline">
								<div class="panel-body panel-popup">

									<h4 style="float: left;"><b>차수</b></h4>
									
									<!-- 상단 버튼 -->
									<button id="btnDelEduRnd" type="button" class="btn btn-primary btn-toastr btn-top">삭제</button>
									<button id="btnAddEduRnd" type="button" class="btn btn-primary btn-toastr btn-top">신규</button>
									
									<!-- 교육별 차수안내 테이블 (TOGGLE) -->
									<table class="table table-hover tbl-type2">
										<thead>
											<tr>
												<th>No</th>
												<th style="width: 50%;">학습기간</th>
												<th>교육기간</th>
											</tr>
										</thead>
										<tbody id="eduRndListTbody"></tbody>
									</table>
									<br>

									<h4 style="float: left;"><b>차수 추가</b></h4>
									<button id="btnConfirm" type="button" class="btn btn-primary btn-toastr btn-top">등록/수정</button>
									<br><br>

									<!-- 차수추가 포맷 및 위의 차수별 상세내용(TOGGLE) -->
									<div class="tab-content">
										<div class="tab-pane fade in active" id="table1" style="padding: 5px 5px;">
											<div class="table-responsive" >
												<!-- 교육 안내 테이블 -->
												<table class="table table-bordered tbl-type1">
													<tbody>	
														<tr>
															<th>과목명</th>
															<td colspan="3">
																<input id="edctNm" type="text" class="form-control" readonly onfocus="this.blur();" value="${edctNm }"/>
															</td>
														</tr>
														<tr>
															<th>신청기간</th>
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
																		<br><br>
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
															<th>취소기간</th>
															<td>
																<div class="ui form">
																	<div class="two fields" style="margin-bottom: 0px">
																		<div class="field">
																			<div class="ui calendar" id="cnclRangeStart">
																				<div class="ui input left icon">
																					<i class="calendar icon" style="font-size: 14px;"></i>
																					<input id="cnclSttgYmd" type="text"
																						style="height: 35px; font-size: 14px;">
																				</div>
																			</div>
																		</div>
																		<br><br>
																		<div class="field">
																			<div class="ui calendar" id="cnclRangeEnd">
																				<div class="ui input left icon">
																					<i class="calendar icon" style="font-size: 14px;"></i>
																					<input id="cnclFnshYmd" type="text"
																						style="height: 35px; font-size: 14px;">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<th>학습기간</th>
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
																		<br><br>
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
															<th>학습시간</th>
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
																		<br>
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
														</tr>
														<tr>
															<th>이수시간(시간)</th>
															<td><input id="ctcrTim" type="text" inputmode="numeric" class="form-control" placeholder="숫자만 입력 하세요"></td>
															<th>교육기간(일)</th>
															<td><input id="edctTrm" type="text" inputmode="numeric" class="form-control" placeholder="숫자만 입력 하세요"></td>
														</tr>
														<tr>
															<th>교육비용(원)</th>
															<td><input id="edex" type="text" inputmode="numeric" class="form-control" placeholder="숫자만 입력 하세요"></td>
														</tr>
													</tbody>
												</table>
											 </div>
										</div>
									</div> 	

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
<script type="text/javascript">
$(document).ready(function(){
	selectEduRndRegMod();
 	$(document).on("click","#eduRndListTbody tr",function(){
 		var target = $(this);
 		selectEduRndRegModDetail(target); 
 	});
 	$(document).on("click","#btnAddEduRnd",function(){
 		initInputValue();
	});
 	$(document).on("click","#btnConfirm",function(){
		if(verifyValue()){
 			var edctCntId = $(".trEdctCntInfo.active").attr("id");
 			if(edctCntId == null || edctCntId == "undefined" || edctCntId ==""){
	 			alert("insert해야됨");
 				insertEduRndRegMod();
 			}else{
 				alert("update해야됨");
 				updateEduRndRegMod(edctCntId);
 			}
		}
	});
 	$(document).on("click","#btnDelEduRnd",function(){
		var edctCntId = $(".trEdctCntInfo.active").attr("id");
		if(edctCntId == null || edctCntId == "undefined" || edctCntId ==""){
			alert("삭제할 차수를 선택해 주세요");
		}else{
			alert("delete 진행합니다");
			deleteEduRndRegMod(edctCntId);
		}
	});
 	$(document).on("keyup","#ctcrTim",function(event){
 		this.value = this.value.replace(/[^0-9.]/g,'');   // 소숫점 까지 입력 받기 위함 	
 	});
 	$(document).on("keyup","#edctTrm",function(event){
 		this.value = this.value.replace(/[^0-9.]/g,'');   // 소숫점 까지 입력 받기 위함 	
 	});
 	$(document).on("keyup","#edex",function(event){
 		this.value = this.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
 		this.value = this.value.replace(/,/g,'');          // ,값 공백처리
 		this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가*/ 	
 	}); 

/* 		$("#btnConfirm").click(function(){
			//verifyValue();
			insertEduRndRegMod(target);
		}); */
	  	$('#aplcRangeStart').calendar({
			type: 'date',
			endCalendar: $('#aplcRangeEnd'),
			formatter: {
				date: function (date, settings) {
					if (!date) return '';
					var day = date.getDate();
					var month = date.getMonth() + 1;
					var year = date.getFullYear();
					return year + '/' + month + '/' + day;
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
					return year + '/' + month + '/' + day;
				}
			}
		});
	  	$('#cnclRangeStart').calendar({
			type: 'date',
			endCalendar: $('#cnclRangeEnd'),
			formatter: {
				date: function (date, settings) {
					if (!date) return '';
					var day = date.getDate();
					var month = date.getMonth() + 1;
					var year = date.getFullYear();
					return year + '/' + month + '/' + day;
				}
			},
	 	    popupOptions: {
		 	     position: 'bottom right',
		 	     lastResort: 'bottom right',
		 	     prefer: 'opposite',
		 	     hideOnScroll: false
		 	}
		});
	 	$('#cnclRangeEnd').calendar({
			type: 'date',
			startCalendar: $('#cnclRangeStart'),
			formatter: {
				date: function (date, settings) {
					if (!date) return '';
					var day = date.getDate();
					var month = date.getMonth() + 1;
					var year = date.getFullYear();
					return year + '/' + month + '/' + day;
				}
			},
	 	    popupOptions: {
		 	     position: 'bottom right',
		 	     lastResort: 'bottom right',
		 	     prefer: 'opposite',
		 	     hideOnScroll: false
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
					return year + '/' + month + '/' + day;
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
					return year + '/' + month + '/' + day;
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
			formatter: {
				time: function (time, settings) {
					if (!time) return '';
					var hour = time.getHours();
					var minute = time.getMinutes();
					//var second = time.getSeconds();
					return hour + ':' + minute;// + ':' + second;
				}
			},
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
			formatter: {
				time: function (time, settings) {
					if (!time) return '';
					var hour = time.getHours();
					var minute = time.getMinutes();
					//var second = time.getSeconds();
					return hour + ':' + minute;// + ':' + second;
				}
			},
	 		popupOptions: {
	 	     position: 'top right',
	 	     lastResort: 'top right',
	 	     prefer: 'opposite',
	 	     hideOnScroll: false
	 	   }	 	    
	 	});
});
function selectEduRndRegMod() {
	var edctId = ${edctId };
    $.ajax({
    	url:"/itep/views/admin/pop/selectEduRndRegMod", //데이터를  넘겨줄 링크 설정
        type:"POST", // post 방식
		data: {"edctId" : edctId}, //넘겨줄 데이터
		
		success: function (responseData) {
			var str = '';
			str += '<tbody  id=\"eduRndListTbody\">'
			$.each(responseData, function (i){
				str += '<tr class=\"trEdctCntInfo\" data-toggle=\"tab\" data-target=\"#'+responseData[i].edctCntId+'\" id=\"'+responseData[i].edctCntId+'\">';
				str += '<td>'+(i+1)+'</td>';
				str += '<td>'+responseData[i].edctSttgYmd.replace(/-/g,'.')+' ~ '+responseData[i].edctFnshYmd.replace(/-/g,'.')+'</td>';
				str += '<td>'+responseData[i].edctTrm+'일</td>';
				str += '</tr>';
			});
			str += '</tbody>'
			$("#eduRndListTbody").replaceWith(str);
		},
		error: function (xhr, status, error) {
			alert("등록된 차수가 없습니다");
			
		}
	});
}
function selectEduRndRegModDetail(target){
	var edctCntId = target.attr("id");
    $.ajax({
    	url:"/itep/views/admin/pop/selectEduRndRegMod", //데이터를  넘겨줄 링크 설정
        type:"POST", // post 방식
		data: {"edctCntId" : edctCntId}, //넘겨줄 데이터
		
		success: function (responseData) {
			$.each(responseData, function (i){
				//$('#edctNm').val(responseData[i].edctNm);
				$('#aplcSttgYmd').val(responseData[i].aplcSttgYmd);
				$('#aplcFnshYmd').val(responseData[i].aplcFnshYmd);
				$('#cnclSttgYmd').val(responseData[i].cnclSttgYmd);
				$('#cnclFnshYmd').val(responseData[i].cnclFnshYmd);
				$('#edctSttgYmd').val(responseData[i].edctSttgYmd);
				$('#edctFnshYmd').val(responseData[i].edctFnshYmd);
				$('#edctSttgTim').val(responseData[i].edctSttgTim);
				$('#edctFnshTim').val(responseData[i].edctFnshTim);
				$('#ctcrTim').val(responseData[i].ctcrTim);
				$('#edctTrm').val(responseData[i].edctTrm);
				$('#edex').val(responseData[i].edex);
			});
		},
		error: function (xhr, status, error) {
			alert("error");
			
		}	
	});
}
function insertEduRndRegMod(){
	var edctId = ${edctId };
    $.ajax({
    	url:"/itep/views/admin/pop/insertEduRndRegMod", //데이터를  넘겨줄 링크 설정
        type:"POST", // post 방식
		data:{	"edctId" : 		edctId,
				"aplcSttgYmd" :	$('#aplcSttgYmd').val(),
				"aplcFnshYmd" : $('#aplcFnshYmd').val(),
				"cnclSttgYmd" : $('#cnclSttgYmd').val(),
				"cnclFnshYmd" :	$('#cnclFnshYmd').val(),
				"edctSttgYmd" :	$('#edctSttgYmd').val(),
				"edctFnshYmd" :	$('#edctFnshYmd').val(),
				"edctSttgTim" :	$('#edctSttgTim').val(),
				"edctFnshTim" :	$('#edctFnshTim').val(),
				"ctcrTim" :		$('#ctcrTim').val(),
				"edctTrm" :		$('#edctTrm').val(),
				"edex" :		$('#edex').val()			}, //넘겨줄 데이터
		
		success: function (responseData) {
				alert("정상적으로 등록 되었습니다");
				selectEduRndRegMod();
				initInputValue();
				 //location.reload();
		},
		error: function (xhr, status, error) {
			alert("error");
			
		}
	});
}
function updateEduRndRegMod(edctCntId){
    $.ajax({
    	url:"/itep/views/admin/pop/updateEduRndRegMod", //데이터를  넘겨줄 링크 설정
        type:"POST", // post 방식
		data:{	"edctCntId"		: edctCntId,
				"aplcSttgYmd" 	: $('#aplcSttgYmd').val(),
				"aplcFnshYmd" 	: $('#aplcFnshYmd').val(),
				"cnclSttgYmd" 	: $('#cnclSttgYmd').val(),
				"cnclFnshYmd" 	: $('#cnclFnshYmd').val(),
				"edctSttgYmd" 	: $('#edctSttgYmd').val(),
				"edctFnshYmd" 	: $('#edctFnshYmd').val(),
				"edctSttgTim" 	: $('#edctSttgTim').val(),
				"edctFnshTim" 	: $('#edctFnshTim').val(),
				"ctcrTim" 		: $('#ctcrTim').val(),
				"edctTrm" 		: $('#edctTrm').val(),
				"edex" 			: $('#edex').val()			}, //넘겨줄 데이터
		
		success: function (responseData) {
				alert("정상적으로 변경 되었습니다");
				selectEduRndRegMod();
				initInputValue();
				 //location.reload();
		},
		error: function (xhr, status, error) {
			alert("error");
			
		}
	});
}
function deleteEduRndRegMod(edctCntId){
    $.ajax({
    	url:"/itep/views/admin/pop/deleteEduRndRegMod", //데이터를  넘겨줄 링크 설정
        type:"POST", // post 방식
		data:{	"edctCntId"	: edctCntId}, //넘겨줄 데이터		
		success: function (responseData) {
				alert("정상적으로 삭제 되었습니다");
				selectEduRndRegMod();
				initInputValue();
				 //location.reload();
		},
		error: function (xhr, status, error) {
			alert("error");
			
		}
	});
}
function verifyValue(){
	var dateRegExp = /^(19|20)\d{2}\/(0*[1-9]|1[012])\/(0*[1-9]|[12][0-9]|3[0-1])$/; //yyyy/mm/dd 형태 허용 m과 d는 한자리어도 됨
	var timeRegExp = /^(0*[0-9]|1[0-9]|2[0-3]):(0*[0-9]|[1-5][0-9])$/; //HH:mm 형태 H와m은 한자리어도 됨
	var edexRegExp = /^([1-9][0-9,\s]*|[0])*$/; //금액 (따옴표 포함, 공백 가능, 0원 가능)
	
	if(!dateRegExp.test($('#aplcSttgYmd').val())){
		alert("신청시작일자가 올바르지 않습니다");
		return false;
	}
	if(!dateRegExp.test($('#aplcFnshYmd').val())){
		alert("신청종료일자가 올바르지 않습니다");
		return false;
	}
	if(!dateRegExp.test($('#cnclSttgYmd').val())){
		alert("취소시작일자가 올바르지 않습니다");
		return false;
	}
	if(!dateRegExp.test($('#cnclFnshYmd').val())){
		alert("취소종료일자가 올바르지 않습니다");
		return false;
	}
	if(!dateRegExp.test($('#edctSttgYmd').val())){
		alert("교육시작일자가 올바르지 않습니다");
		return false;
	}
	if(!dateRegExp.test($('#edctFnshYmd').val())){
		alert("교육종료일자가 올바르지 않습니다");
		return false;
	}
	if(!timeRegExp.test($('#edctSttgTim').val())){
		alert("교육시작시간이 올바르지 않습니다");
		return false;
	}
	if(!timeRegExp.test($('#edctFnshTim').val())){
		alert("교육종료시간이 올바르지 않습니다");
		return false;
	}
	if(!$.isNumeric($('#ctcrTim').val())){
		alert("이수시간이 올바르지 않습니다");
		return false;
	}
	if(!$.isNumeric($('#edctTrm').val())){
		alert("교육기간이 올바르지 않습니다");
		return false;
	}
	if(!edexRegExp.test($('#edex').val())){
		alert("비용이 올바르지 않습니다");
		return false;
	}
	alert("정상 수행한다?")
	return true;
}	
function initInputValue(){
	var edctNm = $("#edctNm").val();
	$("input").val(null);
	$("#edctNm").val(edctNm);
	$(".trEdctCntInfo.active").removeClass("active");
}
</script>
