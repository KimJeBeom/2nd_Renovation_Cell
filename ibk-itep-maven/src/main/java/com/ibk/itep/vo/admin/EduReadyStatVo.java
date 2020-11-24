package com.ibk.itep.vo.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class EduReadyStatVo {
	private int edctCntId;
	private String edctClsfCd;
	private String edctClsfNm;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private String edctNm;
	private String edinNm;
	private int edctAplcIdCnt;
	private Date sttgYmd; // 검색 시작일자
	private Date fnshYmd; // 검색 종료일자
	
	public int getEdctCntId() {
		return edctCntId;
	}
	public void setEdctCntId(int edctCntId) {
		this.edctCntId = edctCntId;
	}
	public String getEdctClsfCd() {
		return edctClsfCd;
	}
	public void setEdctClsfCd(String edctClsfCd) {
		this.edctClsfCd = edctClsfCd;
	}
	public String getEdctClsfNm() {
		return edctClsfNm;
	}
	public void setEdctClsfNm(String edctClsfNm) {
		this.edctClsfNm = edctClsfNm;
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
	public int getEdctAplcIdCnt() {
		return edctAplcIdCnt;
	}
	public void setEdctAplcIdCnt(int edctAplcIdCnt) {
		this.edctAplcIdCnt = edctAplcIdCnt;
	}
	public String getSttgYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(sttgYmd != null)
			return sdf.format(sttgYmd);
		else 
			return "";
	}
	public void setSttgYmd(Date sttgYmd) {
		this.sttgYmd = sttgYmd;
	}
	public String getFnshYmd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(fnshYmd != null)
			return sdf.format(fnshYmd);
		else 
			return "";
	}
	public void setFnshYmd(Date fnshYmd) {
		this.fnshYmd = fnshYmd;
	}
}
