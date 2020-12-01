package com.ibk.itep.vo.admin;

public class EduOpenReadyStatVo {
	private int aplcId;
	private String brnm;
	private String userId;
	private String userNm;
	private String edctNm;
	private String edinNm;
	private String edctSttgYmd;
	private String edctFnshYmd;
	private String cnfaYn;
	private Integer pageSet; //페이지SetNumber
	
	public int getAplcId() {
		return aplcId;
	}
	public void setAplcId(int aplcId) {
		this.aplcId = aplcId;
	}
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
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
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getEdctNm() {
		return edctNm;
	}
	public void setEdctNm(String edctNm) {
		this.edctNm = edctNm;
	}
	public String getEdinNm() {
		return edinNm;
	}
	public void setEdinNm(String edinNm) {
		this.edinNm = edinNm;
	}
	public String getEdctSttgYmd() {
		return edctSttgYmd;
	}
	public void setEdctSttgYmd(String edctSttgYmd) {
		this.edctSttgYmd = edctSttgYmd;
	}
	public String getEdctFnshYmd() {
		return edctFnshYmd; 
	}
	public void setEdctFnshYmd(String edctFnshYmd) {
		this.edctFnshYmd = edctFnshYmd;
	}
	public String getCnfaYn() {
		return cnfaYn;
	}
	public void setCnfaYn(String cnfaYn) {
		this.cnfaYn = cnfaYn;
	}	
	public Integer getPageSet() {
		return pageSet;
	}
	public void setPageSet(Integer pageSet) {
		this.pageSet = pageSet;
	}
}
