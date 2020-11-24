$(document).ready(function() {

	/* 체크박스 전체체크 */
	var checkAll = $('input[name=checkAll]');
	var checkbox = $('input[name=checkbox]');

	checkAll.on('change', function () {
		checkbox.prop('checked', this.checked);
	});
	
	checkbox.change(function(){
		var cbLength = checkbox.length;
		var checkedLength = $('input[name="checkbox"]:checked').length;
		var isAllChecked = (cbLength == checkedLength);		
		checkAll.prop('checked', isAllChecked);
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
	var size = 'location=no, left=100, top=100';
	var nameArr = name.split("?");
	var popName = nameArr[0];
	
	if (popName =='apprRejectPop') 
		size += ', width=500';
		
	else if (popName =='apprApplyPop' || popName == 'eduApplyPop' || popName == 'eduInfoPop') 
		size += ', width=750';
		
	else if (popName == 'noticeRegPop' || popName == 'noticeModPop' || popName == 'archRegPop' || popName == 'archModPop')
		size += ', width=850';
		
	else
		size += ', width=650';
	/*// 결재반려 팝업
	if (popName =='apprRejectPop') 
		size = 'location=no, width=500, height=250, left=100, top=100';

	// 결재요청(결재자지정) 팝업
	else if (popName =='apprApplyPop') 
		size = 'location=no, width=750, height=630, left=100, top=100';
		
	// 교육 안내 및 신청 팝업
	else if (popName == 'eduApplyPop') 
		size = 'location=no, width=750, height=700, left=100, top=100';
		
	// 교육신청 결재 요청 팝업
	else if (popName == 'eduInfoPop')
		size = 'location=no, width=750, height=500, left=200, top=200';
	
	// 차수추가 팝업
	else if (popName =='addEduRndPop')
		size = 'location=no, width=650, height=830, left=100, top=100';	
	
	// 게시판 등록, 수정 팝업
	else if (popName == 'noticeRegPop' || popName == 'noticeModPop' || popName == 'archRegPop' || popName == 'archModPop')
		size = 'location=no, width=850, height=600, left=100, top=100';
		
	// 관리자페이지 교육 등록, 수정
	else if (popName == 'newEduRegPop' || popName == 'eduModPop')
		size = 'location=no, width=650, height=560, left=100, top=100';	
   
 	// 관리자페이지 코드 등록
	else if (popName == 'addEduCdPop')
		size = 'location=no, width=650, height=300, left=100, top=100';	
		
	// 과정개설신청 상세확인 팝업
	else if (popName == 'newEduInfoPop')
		//size = 'location=no, width=650, height=auto, left=100, top=100';	
		size = 'location=no, width=650, left=100, top=100';	
			
	// 관리자페이지 교육신청현황 팝업
	else if (popName == 'eduEmpListPop')
		//size = 'location=no, width=650, height=auto, left=100, top=100';
		size = 'location=no, width=650, left=100, top=100';
	
	else 
		size = 'location=no, width=650, height=650, left=100, top=100';		*/

	window.open('/itep/views/'+menu+'/pop/'+name, '_blank', size); 
}	

/* 팝업창 크기 재조절 */
function resizeWindow(win) {
	var wid = win.document.body.offsetWidth + 30;
	var hei = win.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임
	win.resizeTo(wid,hei);
}

/* 해당 페이지가 팝업인지 아닌지 체크 */
function isPopup(){
	var pageName = "";
    var tempPageName = window.location.href;
	var strPageName = tempPageName.split("/");
	pageName = strPageName[strPageName.length-1].split("?")[0];
			    
	// 현재 페이지명이 Pop으로 끝나면 팝업
	if(pageName.substring(pageName.length-3, pageName.length) == "Pop")
		return true;
	else
		return false;
}

/* 테이블 클릭 시 하이라이트 처리 */ 
var pos = 0;
function HighLightTableTr(target) {
	if(pos)
		pos.style.background = "#ffffff";
	target.style.background = "#e8e8e8";
	pos = target;
}




