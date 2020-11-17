package com.ibk.itep.vo.apprMng;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ApprListDetailVo {
	private Integer edctAplcId;
	private Integer edctCntId;
	private Integer edctId;
	private String edctNm;
	private String edctCon;
	private String edinNm;
	private String edctLevl;
	private String onlEdctYn;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private Date aplcSttgYmd;
	private Date aplcFnshYmd;
	private File apndDat;
	
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
	public String getEdctLevl() {
		return edctLevl;
	}
	public void setEdctLevl(String edctLevl) {
		this.edctLevl = edctLevl;
	}
	public String getOnlEdctYn() {
		return onlEdctYn;
	}
	public void setOnlEdctYn(String onlEdctYn) {
		this.onlEdctYn = onlEdctYn;
	}
	public String getEdctSttgYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(edctSttgYmd);
	}
	public void setEdctSttgYmd(Date edctSttgYmd) {
		this.edctSttgYmd = edctSttgYmd;
	}
	public String getEdctFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(edctFnshYmd);
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
	public File getApndDat() {
		return apndDat;
	}
	public void setApndDat(File apndDat) {
		this.apndDat = apndDat;
	}
}