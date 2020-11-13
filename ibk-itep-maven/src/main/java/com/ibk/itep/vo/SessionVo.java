package com.ibk.itep.vo;

/* 테스트를 위한 임의의 세션 VO */
public class SessionVo {
	private String userId;
	private String brcd;
	private String athrCd;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBrcd() {
		return brcd;
	}
	public void setBrcd(String brcd) {
		this.brcd = brcd;
	}
	public String getAthrCd() {
		return athrCd;
	}
	public void setAthrCd(String athrCd) {
		this.athrCd = athrCd;
	}
}