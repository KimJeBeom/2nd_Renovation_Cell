package com.ibk.itep.vo.cmm;

public class CluVo {
	
	private String	userId;		//부서관리자이름						
	private String	userNm;		//부서관리자Id
	private String  brnm;		//부서명
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
	}

}