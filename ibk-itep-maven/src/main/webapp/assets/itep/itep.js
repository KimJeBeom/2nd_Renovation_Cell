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
	var size = 'location=no, left=100, top=100, resizable=1';
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
		
	window.open('/itep/views/'+menu+'/pop/'+name, '_blank', size); 
}	

/* 팝업창 크기 자동조절 */
function resizeWindow(win) {
	//document.body.scroll = "yes";
	var agent = navigator.userAgent.toLowerCase(); //고객 브라우져 정보
	var wid, hei;

	// 익스플로러
	if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		wid = win.document.body.offsetWidth + 30;
		hei = win.document.body.offsetHeight + 40
	}
	// 익스플로러 외
	//else if(userBrowser.indexOf("Chrome") > -1) {
	else {
		wid = document.body.scrollWidth - 100;
		hei = document.body.scrollHeight + 65;
	}
	
	window.moveTo((window.screen.width - wid) / 2 , (window.screen.height - hei) / 2);
	window.resizeTo(wid, hei);
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




