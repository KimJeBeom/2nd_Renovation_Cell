package com.ibk.itep.vo.admin;

import java.sql.Date;
import java.sql.Time;
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
	private Time edctSttgTim;
	private Time edctFnshTim;
	private String inbkEdctYn;
	private String edex;
	private String onlEdctYmd;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return sdf.format(aplcTs);
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
	public String getAplcSttgYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(aplcSttgYmd);
	}
	public void setAplcSttgYmd(Date aplcSttgYmd) {
		this.aplcSttgYmd = aplcSttgYmd;
	}
	public String getAplcFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(aplcFnshYmd);
	}
	public void setAplcFnshYmd(Date aplcFnshYmd) {
		this.aplcFnshYmd = aplcFnshYmd;
	}
	public Time getEdctSttgTim() {
		return edctSttgTim;
	}
	public void setEdctSttgTim(Time edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}
	public Time getEdctFnshTim() {
		return edctFnshTim;
	}
	public void setEdctFnshTim(Time edctFnshTim) {
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
	public String getOnlEdctYmd() {
		return onlEdctYmd;
	}
	public void setOnlEdctYmd(String onlEdctYmd) {
		this.onlEdctYmd = onlEdctYmd;
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
