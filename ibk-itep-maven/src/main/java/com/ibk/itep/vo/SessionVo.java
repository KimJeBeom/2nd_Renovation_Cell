package com.ibk.itep.vo;

/* 테스트를 위한 임의의 세션 VO */
public class SessionVo {
	private String userId;
	private String userNm;
	private String userJtm;
	private String brcd;
	private String brnm;
	private String athrCd;
	private String teamCd;
	
	public String getTeamCd() {
		return teamCd;
	}
	public void setTeamCd(String teamCd) {
		this.teamCd = teamCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void serUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserJtm() {
		return userJtm;
	}
	public void setUserJtm(String userJtm) {
		this.userJtm = userJtm;
	}
	public String getBrcd() {
		return brcd;
	}
	public void setBrcd(String brcd) {
		this.brcd = brcd;
	}
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
	}
	public String getAthrCd() {
		return athrCd;
	}
	public void setAthrCd(String athrCd) {
		this.athrCd = athrCd;
	}
}