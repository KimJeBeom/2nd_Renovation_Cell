<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import = "com.ibk.itep.vo.SessionVo" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
	String brnm = ssnInfo.getBrnm();
	String userId = ssnInfo.getUserId();
	String userNm = ssnInfo.getUserNm();
	String userJtm = ssnInfo.getUserJtm();
	String athrCd = ssnInfo.getAthrCd();
%>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">

				<!-- 기업은행 로고 -->
				<div><a href="/itep/views" class="active"> <img class="logo-icon" style="padding-left:10px;" src="/itep/assets/itep/img/itep-logo.png" /></a></div>

				<!-- 사용자 정보 -->
				<div class="usr-info">
					<img class="usr-icon" src="/itep/assets/itep/img/usr.png" />
					<div class="usr-text">
						<% if(userId.equals("admin")) { %>
							<li>admin</li>
							<li><%=userNm %></li>
						<% } else { %>
							<li><%=brnm %></li>
							<li><%=userNm %> <%=userJtm %></li>
						<% } %>
					</div>
				</div>

				<!-- 메뉴 -->
				<li>
                    <a href="#subPages" data-toggle="collapse" class="collapsed">
                    <img src="/itep/assets/itep/img/icon/myclass-icon.png" class="main-icon" /><span>내 학습실</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse ">
						<ul class="nav">
							<li><a href="/itep/views/myClass/eduNow" class="">수강중인 교육</a></li>
							<li><a href="/itep/views/myClass/eduReady" class="">수강신청한 교육</a></li>
							<li><a href="/itep/views/myClass/eduComplete" class="">수강완료한 교육</a></li>
							<li><a href="/itep/views/myClass/eduMyHistory" class="">수강신청 이력</a></li>
    					</ul>
                    </div>
                </li>
	    		<li><a href="#subPages1" data-toggle="collapse" class="collapsed">
                    <img src="/itep/assets/itep/img/icon/eduapply-icon.png" class="main-icon" /><span>교육신청</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
		    		<div id="subPages1" class="collapse ">
			    		<ul class="nav">
				    		<li><a href="/itep/views/eduApply/eduList" class="">교육 목록</a></li>
							<li><a href="/itep/views/eduApply/newEduApply" class="">과정 개설 신청</a></li>
						</ul>
                    </div>
                </li>
                <% if(athrCd.equals("DPM") || athrCd.equals("GRM") || athrCd.equals("ADM")) { %>
       			<li><a href="#subPages2" data-toggle="collapse" class="collapsed">
                    <img src="/itep/assets/itep/img/icon/apprmng-icon.png" class="main-icon" /><span>결재관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
	    			<div id="subPages2" class="collapse ">
						<ul class="nav">
		    				<li><a id="menuApprList" href="/itep/views/apprMng/apprList" class="">결재할 문서</a></li>
							<li><a href="/itep/views/apprMng/apprStat" class="">진행 및 완료 문서</a></li>
						</ul>
                    </div>
                </li>
                <% } %>
				<li><a href="#subPages3" data-toggle="collapse" class="collapsedBD">
                    <img src="/itep/assets/itep/img/icon/board-icon.png" class="main-icon" /><span>게시판</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages3" class="collapsedBD" id="board">
						<ul class="nav">
							<li id="notice"><a href="/itep/views/board/notice" class="" >공지사항</a></li>
							<li><a href="/itep/views/board/archieve" class="">자료실</a></li>
						</ul>
                    </div>
                </li>
                <% if(athrCd.equals("GRM") || athrCd.equals("ADM")) { %>
				<li><a href="#subPages4" data-toggle="collapse" class="collapsed">
                    <img src="/itep/assets/itep/img/icon/admin-icon.png" class="main-icon" /><span>관리자</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages4" class="collapse ">
						<ul class="nav">
							<li><a href="/itep/views/admin/eduRegMod" class="">교육등록 및 수정</a></li>
							<li><a href="/itep/views/admin/eduReadyStat" class="">교육 신청현황</a></li>
							<li><a href="/itep/views/admin/eduHistory" class="">수강이력</a></li>
							<li><a href="/itep/views/admin/empAccMng" class="">사용자 계정관리</a></li>
							<li><a href="/itep/views/admin/eduCdMng" class="">코드관리</a></li>
                        </ul>
                    </div>
				</li>
                <% } %>
			</ul>
		</nav>
	</div>
</div>
	