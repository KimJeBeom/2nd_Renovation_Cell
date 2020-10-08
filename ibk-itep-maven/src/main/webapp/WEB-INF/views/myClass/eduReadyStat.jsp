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
				<!-- page title -->
					<div class="row"> 
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"><b>수강신청한 교육</b></h3>
							</div>
							<div class="panel-body">
								<h3 class="panel-title" style="margin-bottom: 10px;"><b>▶ 과정개설 신청목록</b></h3>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>담당자 확인여부</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>AWS SUMMIT SEOUL</td>
											<td>Amazon</td>
											<td>2020.07.01 ~ 2020.08.31</td>
											<td>20200601</td>
											<td>
												<button type="button" class="btn btn-primary">확인</button>
											</td>
											<td>Y</td>
										</tr>
										<tr>
											<tr>
												<td>2</td>
												<td>한원석의 AIX 그까이꺼</td>
												<td>WS컴퍼니</td>
												<td>2020.08.01 ~ 2020.09.31</td>
												<td>20200602</td>
												<td>
													<button type="button" class="btn btn-primary">확인</button>
												</td>
												<td>N</td>
											</tr>
										</tr>
									</tbody>
								</table>
							</div>	
							<div class="panel-body">

							</div>					
<!-- 						<div class="panel-body">
									<b>기간  
									<input type='date' name='startdate' value='2020-09-22'/>
									  ~   
									<input type='date' name='enddate' value='2020-09-22'/>
									</b>
								</div> -->
							<div class="panel-body">
								<h3 class="panel-title" style="margin-bottom: 10px;"><b>▶ 수강신청 목록</b></h3>
								<div class="panel-body">
								<b>
									기간&nbsp;
									<input type='date' name='startdate' value='2020-09-22'/>
									&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type='date' name='enddate' value='2020-09-22'/>
								</b>
							</div>
								<table class="table table-hover">
<!-- 									<thead>
										<tr>
											<th class="col-md-1">No</th>
											<th class="col-md-3">과목명</th>
											<th class="col-md-3">교육기관</th>
											<th class="col-md-3">학습기간</th>
											<th class="col-md-2">신청일자</th>
											<th class="col-md-2">상세확인</th>
											<th class="col-md-2">결제진행</th>
											<th class="col-md-2">취소</th>
										</tr> -->
<!-- 										<tr>
											<th style="width:5%">No</th>
											<th style="width:30%">과목명</th>
											<th style="width:10%">교육기관</th>
											<th style="width:30%">학습기간</th>
											<th style="width:10%">신청일자</th>
											<th style="width:10%">상세확인</th>
											<th style="width:10%">결제진행</th>
											<th style="width:10%">취소</th>
										</tr> -->
										<tr>
											<th>No</th>
											<th>과목명</th>
											<th>교육기관</th>
											<th>학습기간</th>
											<th>신청일자</th>
											<th>상세확인</th>
											<th>결제진행</th>
											<th>취소</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>최은혜의 인생이 원래 그런거다</td>
											<td>뽀리네집</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>20200801</td>
											<td>
												<button type="button" class="btn btn-primary">확인</button>
											</td>
											<td>결재 중</td>
											<td>
												<button type="button" class="btn btn-primary" style="background-color: gray; border-color: gray;">취소요청</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>현민지의 3병이 제일 쉬웠어요</td>
											<td>주작cmp</td>
											<td>2020.09.01 ~ 2020.09.31</td>
											<td>20200801</td>
											<td>
												<button type="button" class="btn btn-primary">확인</button>
											</td>
											<td>반려? 중</td>
											<td>
												<button type="button" class="btn btn-primary" style="background-color: gray; border-color: gray;">취소요청</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>	
						</div> 
					</div>			
				</div>
				<!-- end page title -->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>
	
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/cmm/common-footer.jsp" />
    