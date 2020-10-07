<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">

				<!-- 기업은행 로고 -->
				<div><a href="/view" class="active"> <img class="logo-icon" src="/assets/itep/img/ibkbank_logo.png" /></a></div>

				<!-- 사용자 정보-->
				<div class="usr-info">
					<img class="usr-icon" src="/assets/itep/img/usr.png" />
					<div class="usr-text">
						<li>IT기획부</li>
						<li>김다정 대리</li>
					</div>
				</div>

				<!-- 메뉴 -->
				<li>
                    <a href="#subPages" data-toggle="collapse" class="collapsed">
                    <img src="/assets/itep/img/icon/menu-classroom-icon.png" class="main-icon" /><span>내 학습실</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse ">
						<ul class="nav">
							<li><a href="/view/myClass/eduNow" class="">수강중인 교육</a></li>
							<li><a href="/view/myClass/eduReady" class="">수강신청한 교육</a></li>
							<li><a href="/view/myClass/eduComplete" class="">수강완료한 교육</a></li>
    					</ul>
                    </div>
                </li>
	    		<li><a href="#subPages1" data-toggle="collapse" class="collapsed">
                    <img src="/assets/itep/img/icon/menu-eduapply-icon.png" class="main-icon" /><span>교육신청</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
		    		<div id="subPages1" class="collapse ">
			    		<ul class="nav">
				    		<li><a href="/view/eduApply/eduList" class="">교육 목록</a></li>
							<li><a href="/view/eduApply/newEduApply" class="">과정 개설 신청</a></li>
						</ul>
                    </div>
                </li>
       			<li><a href="#subPages2" data-toggle="collapse" class="collapsed">
                    <img src="/assets/itep/img/icon/menu-approve-icon.png" class="main-icon" /><span>결재관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
	    			<div id="subPages2" class="collapse ">
						<ul class="nav">
		    				<li><a href="/view/apprMng/apprList" class="">결재할 문서</a></li>
							<li><a href="/view/apprMng/apprStat" class="">진행 및 완료 문서</a></li>
						</ul>
                    </div>
                </li>
				<li><a href="#subPages3" data-toggle="collapse" class="collapsed">
                    <img src="/assets/itep/img/icon/menu-board-icon.png" class="main-icon" /><span>게시판</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages3" class="collapse ">
						<ul class="nav">
							<li><a href="/view/board/notice" class="">공지사항</a></li>
							<li><a href="/view/board/archieve" class="">자료실</a></li>
						</ul>
                    </div>
                </li>
				<li><a href="#subPages4" data-toggle="collapse" class="collapsed">
                    <img src="/assets/itep/img/icon/menu-admin-icon.png" class="main-icon" /><span>관리자</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages4" class="collapse ">
						<ul class="nav">
							<li><a href="/view/admin/eduRegMod" class="">교육등록 및 수정</a></li>
							<li><a href="/view/admin/eduReadyStat" class="">교육 신청현황</a></li>
							<li><a href="/view/admin/eduHistory" class="">수강이력</a></li>
							<li><a href="/view/admin/empAccMng" class="">사용자 계정관리</a></li>
                        </ul>
                    </div>
				</li>
				
				<!-- 검색창 -->
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" class="form-control approver-form">
						<div class="nav-search-icon"><img src="/assets/itep/img/icon/search-gray.png" /></div>
					</div>
				</form>
			</ul>
		</nav>
	</div>
</div>
<!-- END LEFT SIDEBAR -->
