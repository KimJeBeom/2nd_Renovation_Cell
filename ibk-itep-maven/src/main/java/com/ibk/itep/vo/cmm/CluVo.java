package com.ibk.itep.vo.cmm;

public class CluVo {
	
	private String	userId;		//부서관리자이름						
	private String	userNm;		//부서관리자Id
	private String  brnm;		//부서명
	
	private String userJtm ="";
	private String usertpn ="";
	private String teamCd  ="";
	private String dvcd    ="";
	private String athrCd  ="";
	private String useYn  ="";
	

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
	public String getUserJtm() {
		return userJtm;
	}
	public void setUserJtm(String userJtm) {
		this.userJtm = userJtm;
	}
	public String getUsertpn() {
		return usertpn;
	}
	public void setUsertpn(String usertpn) {
		this.usertpn = usertpn;
	}
	public String getTeamCd() {
		return teamCd;
	}
	public void setTeamCd(String teamCd) {
		this.teamCd = teamCd;
	}
	public String getDvcd() {
		return dvcd;
	}
	public void setDvcd(String dvcd) {
		this.dvcd = dvcd;
	}
	public String getAthrCd() {
		return athrCd;
	}
	public void setAthrCd(String athrCd) {
		this.athrCd = athrCd;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

}