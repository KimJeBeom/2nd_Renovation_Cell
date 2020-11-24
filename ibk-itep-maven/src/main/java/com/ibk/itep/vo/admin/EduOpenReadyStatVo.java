package com.ibk.itep.vo.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EduOpenReadyStatVo {
	private int aplcId;
	private Date aplcTs;
	private String brnm;
	private String userId;
	private String userNm;
	private String edctNm;
	private String edctCon;
	private String edinNm;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private Date aplcSttgYmd;
	private Date aplcFnshYmd;
	private Date edctSttgTim;
	private Date edctFnshTim;
	private String inbkEdctYn;
	private String edex;
	private String onlEdctYn;
	private String edctLevl;
	private String apndDat;
	private String cnfaYn;
	private String cnfmId;
	
	public int getAplcId() {
		return aplcId;
	}
	public void setAplcId(int aplcId) {
		this.aplcId = aplcId;
	}
	public String getAplcTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		if(aplcTs != null)
			return sdf.format(aplcTs);
		else 
			return "";
	}
	public void setAplcTs(Date aplcTs) {
		this.aplcTs = aplcTs;
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
	public String getEdctCon() {
		return edctCon;
	}
	public void setEdctCon(String edctCon) {
		this.edctCon = edctCon;
	}
	public String getEdinNm() {
		return edinNm;
	}
	public void setEdinNm(String edinNm) {
		this.edinNm = edinNm;
	}
	public String getEdctSttgYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(edctSttgYmd != null)
			return sdf.format(edctSttgYmd);
		else 
			return "";
	}
	public void setEdctSttgYmd(Date edctSttgYmd) {
		this.edctSttgYmd = edctSttgYmd;
	}
	public String getEdctFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(edctFnshYmd != null)
			return sdf.format(edctFnshYmd);
		else 
			return "";
	}
	public void setEdctFnshYmd(Date edctFnshYmd) {
		this.edctFnshYmd = edctFnshYmd;
	}
	public String getAplcSttgYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(aplcSttgYmd != null)
			return sdf.format(aplcSttgYmd);
		else 
			return "";
	}
	public void setAplcSttgYmd(Date aplcSttgYmd) {
		this.aplcSttgYmd = aplcSttgYmd;
	}
	public String getAplcFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(aplcFnshYmd != null)
			return sdf.format(aplcFnshYmd);
		else 
			return "";
	}
	public void setAplcFnshYmd(Date aplcFnshYmd) {
		this.aplcFnshYmd = aplcFnshYmd;
	}
	public String getEdctSttgTim() {
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
		if(edctSttgTim != null)
			return sdf.format(edctSttgTim);
		else 
			return "";
	}
	public void setEdctSttgTim(Date edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}
	public String getEdctFnshTim() {
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
		if(edctSttgTim != null)
			return sdf.format(edctFnshTim);
		else 
			return "";
	}
	public void setEdctFnshTim(Date edctFnshTim) {
		this.edctFnshTim = edctFnshTim;
	}
	public String getInbkEdctYn() {
		return inbkEdctYn;
	}
	public void setInbkEdctYn(String inbkEdctYn) {
		this.inbkEdctYn = inbkEdctYn;
	}
	public String getEdex() {
		return edex;
	}
	public void setEdex(String edex) {
		this.edex = edex;
	}
	public String getOnlEdctYn() {
		return onlEdctYn;
	}
	public void setOnlEdctYn(String onlEdctYn) {
		this.onlEdctYn = onlEdctYn;
	}
	public String getEdctLevl() {
		return edctLevl;
	}
	public void setEdctLevl(String edctLevl) {
		this.edctLevl = edctLevl;
	}
	public String getApndDat() {
		return apndDat;
	}
	public void setApndDat(String apndDat) {
		this.apndDat = apndDat;
	}
	public String getCnfaYn() {
		return cnfaYn;
	}
	public void setCnfaYn(String cnfaYn) {
		this.cnfaYn = cnfaYn;
	}
	public String getCnfmId() {
		return cnfmId;
	}
	public void setCnfmId(String cnfmId) {
		this.cnfmId = cnfmId;
	}
	
}
