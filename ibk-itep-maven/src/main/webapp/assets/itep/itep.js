$(document).ready(function() {

	/* 체크박스 전체선택 */
	$('input[name=checkAll]').on('change', function () {
		$('input[name=checkbox]').prop('checked', this.checked);
	});	

});

/* 팝업 : name에 팝업으로 띄울 jsp 이름 써서 호출 */
function showPopup(menu, name) {
	var size = '';
	
	if (name =='apprRejectPop') // 결재반려 팝업
		size = 'location=no, width=500, height=250, left=100, top=100';

	else if (name =='apprApplyPop' || name == 'eduApplyPop') // 결재요청(결재자지정) 팝업
		size = 'location=no, width=750, height=600, left=100, top=100';
	
	else if (name =='addEduRndPop')// 차수추가 팝업
		size = 'location=no, width=650, height=830, left=100, top=100';	

	else // 교육내용 팝업, 신규교육등록 팝업
		size = 'location=no, width=650, height=650, left=100, top=100';		

	window.open('/view/'+menu+'/pop/'+name, name, size); 
}	






