package com.ibk.itep.vo.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EduOpenReadyStatVo {
	private int aplcId;
	private String brnm;
	private String userId;
	private String userNm;
	private String edctNm;
	private String edinNm;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private String cnfaYn;
	
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(edctSttgYmd);
	}
	public void setEdctSttgYmd(Date edctSttgYmd) {
		this.edctSttgYmd = edctSttgYmd;
	}
	public String getEdctFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(edctFnshYmd);
	}
	public void setEdctFnshYmd(Date edctFnshYmd) {
		this.edctFnshYmd = edctFnshYmd;
	}
	public String getCnfaYn() {
		return cnfaYn;
	}
	public void setCnfaYn(String cnfaYn) {
		this.cnfaYn = cnfaYn;
	}
	
	
}
