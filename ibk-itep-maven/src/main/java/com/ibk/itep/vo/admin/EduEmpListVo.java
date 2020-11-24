package com.ibk.itep.vo.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EduEmpListVo {
	private int edctCntId;
	private int edctAplcId;
	private String edctNm;
	private String edctCon;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private String brnm;
	private String userId;
	private String userNm;
	private String ctcrYn;
	
	public int getEdctCntId() {
		return edctCntId;
	}
	public void setEdctCntId(int edctCntId) {
		this.edctCntId = edctCntId;
	}
	public int getEdctAplcId() {
		return edctAplcId;
	}
	public void setEdctAplcId(int edctAplcId) {
		this.edctAplcId = edctAplcId;
	}
	public String getEdctNm() {
		return edctNm;
	}
	public void setEdctNm(String edctNm) {
		this.edctNm = edctNm;
	}
	public String getEdctCon() {
		return edctCon;
	}
	public void setEdctCon(String edctCon) {
		this.edctCon = edctCon;
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
	public String getCtcrYn() {
		return ctcrYn;
	}
	public void setCtcrYn(String ctcrYn) {
		this.ctcrYn = ctcrYn;
	}
}
