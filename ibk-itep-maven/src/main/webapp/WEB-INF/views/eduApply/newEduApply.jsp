<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
										<td colspan="3">
											<input id="edinNm" type="text" name="academy" class="form-control" value="">
										</td>                  
									</tr>
									<tr>
										<td class="info"><b>교육내용 및<br>신청사유</b></td>
										<td colspan="3">
											<form>
												<p><textarea id="edctCon" placeholder="" style="width:100%; height: 200px;"></textarea></p>
											</form>
										</td>
									</tr>
									<tr>
										<td class="info"><b>신청기간</b></td>
										<td>
											<div class="col-sm-12">
												<div class='col-sm-4'>
													<div class="form-group">
														<input id="aplcSttgYmd" type='date' name='applyStDt' value=''/>
													</div>
												</div>
												<div class='col-sm-1'>
													<h4 text-align="center"><b>~</b></h4>
												</div>
												<div class='col-sm-4'>
													<div class="form-group">
														<input id="aplcFnshYmd" type='date' name='applyEdDt' value=''/>
													</div>
												</div>
											</div>
										</td>
										<td class="info"><b>학습기간</b></td>
										<td>
											<div class="col-sm-12">
												<div class='col-sm-4'>
													<div class="form-group">
														<input id="edctSttgYmd" type='date' name='studyStDt' value=''/>
													</div>
												</div>
												<div class='col-sm-1'>
													<h4 text-align="center"><b>~</b></h4>
												</div>
												<div class='col-sm-4'>
													<div class="form-group">
														<input id="edctFnshYmd" type='date' name='studyEdDt' value=''/>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="info"><b>교육시간</b></td>
										<td>
											<input id="edctSttgTim" type='time' name='edctSttgTim'/>
											&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
											<input id="edctFnshTim" type='time' name='edctFnshTim'/>
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
										<td class="info"><b>첨부파일</b></td>
										<td colspan="3">
											<div>
												<input id="apndDat" multiple="multiple" type="file" name="file" class="form-control" value="">
												<!--
												<input class="form-control col-md-1" type="text" style="height: auto; width: 90%;">
												<span class="input-group-btn"><button class="btn btn-info" type="button">파일첨부</button></span>
												-->
											</div>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
							</br>
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
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->

<!-- FOOTER -->
<script>
function insertNewEdu() {
   	var conf = confirm('등록하시겠습니까?');
   	if(conf==true){
	    var	inbkEdctYn = $('input[name="inbkEdctYn"]:checked').val(); //행내교육여부
		var	edctNm = $("#edctNm").val(); //교육명   
		var	edctCon = $("#edctCon").val();//교육내용 및 신청사유    
		var	edinNm = $("#edinNm").val(); //교육기관명  
		var	edctSttgYmd = $("#edctSttgYmd").val(); //학습시작일  
		var	edctFnshYmd = $("#edctFnshYmd").val(); //학습종료일  
		var	aplcSttgYmd = $("#aplcSttgYmd").val(); //신청시작일  
		var	aplcFnshYmd = $("#aplcFnshYmd").val(); //신청종료일  
		var	edctSttgTim = $("#edctSttgTim").val(); //교육시작시간 
		var	edctFnshTim = $("#edctFnshTim").val(); //교육종료시간
		var	edex = $("#edex").val(); //교육비용
		var	onlEdctYn = $('input[name="onlEdctYn"]:checked').val(); //온라인교육여부
		var	edctLevl = $('input[name="edctLevl"]:checked').val(); //교육수준
		var	apndDat = $("#apndDat").val(); //첨부파일
		
		if(inbkEdctYn==""||edctNm==""||edctCon==""||edinNm==""||edctSttgYmd==""||edctFnshYmd==""||aplcSttgYmd==""||aplcFnshYmd==""
				||edctSttgTim==""||edctFnshTim==""||edex==""||onlEdctYn==""||edctLevl==""){
	       	 alert("전체 내용을 입력해주세요");
	       	 
		}else{
		     $.ajax({
			        url:"/itep/views/eduApply/newEduApply", //데이터를  넘겨줄 링크 설정
					type:"POST", // post 방식
					data: 
			    	    {"inbkEdctYn" : inbkEdctYn
			    	    ,"edctNm" : edctNm
			    	    ,"edctCon" : edctCon
			    	    ,"edinNm" : edinNm
			    	    ,"edctSttgYmd" : edctSttgYmd
			    	    ,"edctFnshYmd" : edctFnshYmd
			    	    ,"aplcSttgYmd" : aplcSttgYmd
			    	    ,"aplcFnshYmd" : aplcFnshYmd
			    	    ,"edctSttgTim" : edctSttgTim
			    	    ,"edctFnshTim" : edctFnshTim
			    	    ,"edex" : edex
			    	    ,"onlEdctYn" : onlEdctYn
			    	    ,"edctLevl" : edctLevl
			    	    ,"apndDat" : apndDat
			     		,"modAct" : "insert"},
					
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

</script>
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />

