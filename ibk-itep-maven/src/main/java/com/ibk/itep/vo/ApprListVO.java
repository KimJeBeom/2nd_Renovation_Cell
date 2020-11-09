package com.ibk.itep.vo;

import java.util.Date;

public class ApprListVO {
	private Integer edctAplcId;
	private Integer edctCntId;
	private Integer edctId;
	private String brnm;
	private String userNm;
	private String edctNm;
	private Date aplcTs;
	
	public Integer getEdctAplcId() {
		return edctAplcId;
	}
	public void setEdctAplcId(Integer edctAplcId) {
		this.edctAplcId = edctAplcId;
	}
	public Integer getEdctCntId() {
		return edctCntId;
	}
	public void setEdctCntId(Integer edctCntId) {
		this.edctCntId = edctCntId;
	}
	public Integer getEdctId() {
		return edctId;
	}
	public void setEdctId(Integer edctId) {
		this.edctId = edctId;
	}
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
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
	public Date getAplcTs() {
		return aplcTs;
	}
	public void setAplcTs(Date aplcTs) {
		this.aplcTs = aplcTs;
	}
	 
}