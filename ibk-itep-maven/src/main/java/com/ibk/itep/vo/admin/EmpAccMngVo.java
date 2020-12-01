package com.ibk.itep.vo.admin;

public class EmpAccMngVo {
	private String userId;
	private String userNm;
	private String userJtm;
	private String userTpn;
	private String brcd;
	private String brnm;
	private String teamCd;
	private String teamNm;
	private String athrCd;
	private String athrNm;
	private String useYn;
	private Integer pageSet; //페이지SetNumber
	
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
	public String getUserJtm() {
		return userJtm;
	}
	public void setUserJtm(String userJtm) {
		this.userJtm = userJtm;
	}
	public String getUserTpn() {
		return userTpn;
	}
	public void setUserTpn(String userTpn) {
		this.userTpn = userTpn;
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
	public String getTeamCd() {
		return teamCd;
	}
	public void setTeamCd(String teamCd) {
		this.teamCd = teamCd;
	}
	public String getTeamNm() {
		return teamNm;
	}
	public void setTeamNm(String teamNm) {
		this.teamNm = teamNm;
	}
	public String getAthrCd() {
		return athrCd;
	}
	public void setAthrCd(String athrCd) {
		this.athrCd = athrCd;
	}
	public String getAthrNm() {
		return athrNm;
	}
	public void setAthrNm(String athrNm) {
		this.athrNm = athrNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}	
	public Integer getPageSet() {
		return pageSet;
	}
	public void setPageSet(Integer pageSet) {
		this.pageSet = pageSet;
	}
}
