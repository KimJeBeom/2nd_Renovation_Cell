<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/cmm/common-header.jsp" />

<body>
	<div id="wrapper">
		<!-- 사이드메뉴 -->
		<jsp:include page="/WEB-INF/views/cmm/common-sidebar.jsp" />

		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- Start 교육 등록 및 수정-대제목 -->
					<div class="row" style="display: table; padding: 20px">
						<div style="display: table-cell; vertical-align: middle">
							<img src="/itep/assets/itep/img/icon/admin-icon-big.png"
								height="36px">
						</div>
						<div style="display: table-cell; vertical-align: middle">
							<h1 class="page-title">
								&nbsp;&nbsp;<b>교육 등록 및 수정</b>
							</h1>
						</div>
					</div>
					<!-- End 교육 등록 및 수정-대제목 -->
					<div class="panel">
						<div class="panel-body"  style="padding-top:20px">
							<!-- Start 수강완료한 교육-조회바 -->
							<div class="well col-md-12" style="display: table; padding: 10px">
								<div style="display: table-cell; vertical-align: middle">
									<table>
										<tbody>
											<tr>
												<td style="width: 150px"><b>교육분류</b></td>
												<td style="width: 150px">
													<select class="form-control" id="edctClsfCd" style="text-align: left;">
															<option value="ALL">전체</option>
															<c:forEach items="${cldVoList }" var="cldVo">
																<option value=${cldVo.edctClsfCd }>${cldVo.edctClsfNm }</option>		
															</c:forEach>
													</select>
												</td>
												<td style="width: 150px"><b>과목명</b></td>
												<td style="width: 300px"><input class="form-control"
													type="text" style="text-align: left;" id="edctNm"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div style="display: table-cell"
									style="text-align: center; padding-right:5px;">
									<button id="btnSearch" type="button" class="btn btn-primary"
										style="float: right;">조회</button>
								</div>
							</div>
							<!-- End 수강완료한 교육-조회바 -->
							<!-- Start 교육 등록 및 수정 - 버튼바-->
							<div class="form-group row"
								style="text-align: right; padding-right: 25px;">
								<button class="btn btn-primary" type="button" id="btnReg">등록</button>
								<button class="btn btn-primary" type="button" id="btnMod">수정</button>
								<button class="btn btn-primary" type="button" id="btnDel">삭제</button>
								<button class="btn btn-primary" type="button" id="btnXlsDown">엑셀다운로드</button>
							</div>
							<!-- End 교육 등록 및 수정 - 버튼바-->
							<!-- Start 교육 조회 결과 리스트-->
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width: 5px;">구분</th>
											<th style="width: 25px;">교육ID</th>
											<th style="width: 30px;">교육분류</th>
											<th>교육명</th>
											<th style="width: 30px;">교육기관</th>
											<th style="width: 15px;">차수관리</th>
										</tr>
									</thead>
									<tbody  id="eduRegModVoListTbody">
									</tbody>
								</table>
							</div>
							<!-- End 교육 조회 결과 리스트-->
							<!-- nextPage설정 -->
							<div style="text-align:center">
								<button class="btn btn-primary btn-xs" id='prvsPage' onclick="pageCtrl('prvs');">◀</button>
								&nbsp;
								<input type="text" id="pageNum" value=1 style="width:30px; text-align:center">&nbsp;/
								<label id="listCnt" style="width:20px; text-align:center" ></label>
								<button class="btn btn-primary btn-xs" id='nextPage' onclick="pageCtrl('next');">▶</button>
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
	<script type="text/javascript">
	
		//페이지 수기 입력 이동 pageCtrl();수행 스크립트
		$("#pageNum").keyup(function(e){if(e.keyCode==13) pageCtrl('move'); });
	
		// 결재건 클릭 시 상세내역 동적변경을 위한 함수
		$(document).ready(function(){
			selectEduRegMod();
		});
		//교육 메인 등록 버튼
		$(document).on("click","#btnReg",function(){
			showPopup('admin','newEduRegPop');
		})
		//교육 메인 수정 버튼
		$(document).on("click","#btnMod",function(){
				var radioVal = $('input[name="chkEdctId"]:checked').val();
				if(radioVal != null){
					showPopup('admin','eduModPop?edctId='+radioVal);	
				}else{
					alert("수정할 교육을 선택해주세요");
				} 				
		})
		//교육 메인 삭제 버튼
		$(document).on("click","#btnDel",function(){
			var radioVal = $('input[name="chkEdctId"]:checked').val();
			var radioValNm = $('input[name="chkEdctId"]:checked').parent().next().next().next().text();
				if(radioVal != null){
					if(confirm("\""+radioValNm+"\"\n교육을 삭제하시겠습니까?")){
						deleteEduRegMod();
					}							
				}else{
					alert("삭제할 교육을 선택해주세요");
				}				
		})
		//교육 메인 조회 버튼
		$(document).on("click","#btnSearch",function(){
			selectEduRegMod();	
		})
		function selectEduRegMod() {
			var edctClsfCd = $("#edctClsfCd").val();
			var edctNm = $("#edctNm").val();
			var pageNum = "1";
			
		    $.ajax({
		    	url:"/itep/views/admin/selectEduRegMod", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctClsfCd" : edctClsfCd, "edctNm" : edctNm, "pageNum" : pageNum}, //넘겨줄 데이터
				
				success: function (responseData) {
					var str = '';
					str += '<tbody  id=\"eduRegModVoListTbody\">'
					$.each(responseData, function (i){
						str += '<tr>'
						str += '<td><input type="radio" name="chkEdctId" value='+responseData[i].edctId+'></td>'
						str += '<td>'+responseData[i].edctId+'</td>'
						str += '<td>'+responseData[i].edctClsfNm+'</td>'
						str += '<td style=\"text-align: left\" class=\"edctNmTxt\">'+responseData[i].edctNm+'</td>'
						str += '<td>'+responseData[i].edinNm+'</td>'
						str += '<td><button type=\"button\" class=\"btn btn-primary bts-xs\" onclick=\"showPopup(\'admin\',\'addEduRndPop?edctId='+responseData[i].edctId+'\');\">차수관리</button></td>'
						str += '</tr>'
					});
					str += '</tbody>'
					$("#eduRegModVoListTbody").replaceWith(str);
					$('#pageNum_'+tabValue).val("1");
				},
				error: function (xhr, status, error) {
					alert("error");					
				}
			});
		    //조회시 전체 페이지 재조회 필요로 인한 페이지 재계산 로직 수행
		    $.ajax({
		    	url:"/itep/views/admin/selectEduRegMod", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctClsfCd" : edctClsfCd, "edctNm" : edctNm, "pageNum" : "-1"}, //넘겨줄 데이터
		    	    
		         success: function (responseData) {
		        	 var listSize = (responseData.length/10);
		        	 var listCnt = Math.ceil(listSize);
		        	 //현재탭의 총 탭수()
		        	 $('#listCnt').html(listCnt);
		         }
		    	    
		    }); 
		}
		function deleteEduRegMod() {
			var chkEdctId = $('input[name="chkEdctId"]:checked').val();
		    $.ajax({
		    	url:"/itep/views/admin/deleteEduRegMod", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctId" : chkEdctId}, //넘겨줄 데이터
				success: function (responseData) {
					alert("삭제가 완료 되었습니다.");
					selectEduRegMod();
				},
				error: function (xhr, status, error) {		
					alert("삭제 error");					
				}
			});
		}
		//페이지 클릭시 수행 function
		function pageCtrl(ctrlPage) {
			var edctClsfCd = $("#edctClsfCd").val();
			var edctNm = $("#edctNm").val();
			
		    var pageNum = parseInt($('#pageNum').val()); //현재탭의 페이지넘버
			var listSize = parseInt($('#listCnt').html()); //현재탭에 총 페이지
			
			//패이지 이동 검증 로직
		  	if(ctrlPage=="prvs"){
		  		pageNum = pageNum-1;
				if(pageNum <= 0){
					alert("이전페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="next"){
				pageNum = pageNum+1;
				if(pageNum > listSize){
					alert("다음페이지가 없습니다.");
					return;
				}
			}else if(ctrlPage=="move"){
				if(pageNum > listSize){
					alert("이동값이 전체 페이지보다 클수 없습니다.");
					return;
				}
			}
			
		    $.ajax({
		    	url:"/itep/views/admin/selectEduRegMod", //데이터를  넘겨줄 링크 설정
		        type:"POST", // post 방식
				data: {"edctClsfCd" : edctClsfCd, "edctNm" : edctNm, "pageNum" : pageNum}, //넘겨줄 데이터
				
				success: function (responseData) {
					var str = '';
					str += '<tbody  id=\"eduRegModVoListTbody\">'
					$.each(responseData, function (i){
						str += '<tr>'
						str += '<td><input type="radio" name="chkEdctId" value='+responseData[i].edctId+'></td>'
						str += '<td>'+responseData[i].edctId+'</td>'
						str += '<td>'+responseData[i].edctClsfNm+'</td>'
						str += '<td style=\"text-align: left\" class=\"edctNmTxt\">'+responseData[i].edctNm+'</td>'
						str += '<td>'+responseData[i].edinNm+'</td>'
						str += '<td><button type=\"button\" class=\"btn btn-primary bts-xs\" onclick=\"showPopup(\'admin\',\'addEduRndPop?edctId='+responseData[i].edctId+'\');\">차수관리</button></td>'
						str += '</tr>'
					});
					str += '</tbody>'
					$("#eduRegModVoListTbody").replaceWith(str);
					//이동된 페이지를 화면에 적용
				    $('#pageNum').val(pageNum);
				},
				error: function (xhr, status, error) {
					alert("error");					
				}
			});
		}
	</script>