$(document).ready(function() {

	/* 체크박스 전체선택 */
	$('input[name=checkAll]').on('change', function () {
		$('input[name=checkbox]').prop('checked', this.checked);
	});	
	
	/* 달력 */
	$('#custom_format_calendar').calendar({
		monthFirst: false,
		type: 'date',
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
	 
	$('#rangestart').calendar({
		type: 'date',
		endCalendar: $('#rangeend'),
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
	$('#rangeend').calendar({
		type: 'date',
		startCalendar: $('#rangestart'),
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

});

/* 팝업 : name에 팝업으로 띄울 jsp 이름 써서 호출 */
function showPopup(menu, name) {
	var size = '';
	
	// 결재반려 팝업
	if (name =='apprRejectPop') 
		size = 'location=no, width=500, height=250, left=100, top=100';

	// 결재요청(결재자지정) 팝업
	else if (name =='apprApplyPop' || name == 'eduApplyPop') 
		size = 'location=no, width=750, height=630, left=100, top=100';
	
	// 차수추가 팝업
	else if (name =='addEduRndPop')
		size = 'location=no, width=650, height=830, left=100, top=100';	
	
	// 게시판 등록, 수정 팝업
	else if (name == 'noticeRegPop' || name == 'noticeModPop' || name == 'archRegPop' || name == 'archModPop')
		size = 'location=no, width=650, height=490, left=100, top=100';	
		
	// 관리자페이지 교육 등록, 수정
	else if (name == 'newEduRegPop' || name == 'eduModPop')
		size = 'location=no, width=650, height=560, left=100, top=100';	
			
	//
	else if (name == 'eduEmpListPop')
		size = 'location=no, width=650, height=560, left=100, top=100';		
	
	else 
		size = 'location=no, width=650, height=650, left=100, top=100';		

	window.open('/itep/views/'+menu+'/pop/'+name, name, size); 
}	






