<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<!-- Javascript -->
	<script src="/itep/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/itep/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/itep/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/itep/assets/vendor/toastr/toastr.min.js"></script>
	<script src="/itep/assets/scripts/klorofil-common.js"></script>
	<script src="/itep/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/itep/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/itep/assets/vendor/semantic/semantic.min.js"></script>
	
	<!-- ITEP용 javascript -->
	<script src="/itep/assets/itep/itep.js"></script>
	
	<script>
		// 팝업인지 아닌지 체크
		if(!isPopup()) {
			// 팝업이 아닌 경우만 메뉴폴딩 아이콘 보며줌
			document.write('<div class="navbar-btn" style="position:fixed; right:47px; top:5px;">');
			document.write('<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle" style="font-size:35px;"></i></button>');
			document.write('</div>');
		} else {
			// 팝업이면 창 크기 자동조절
	        document.body.style.height = "auto";
	        resizeWindow(this);
		}
	</script>	
</body>
</html>
