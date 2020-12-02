package com.ibk.itep.vo.admin;

public class EduReadyStatVo {
	private int edctCntId;
	private String edctClsfCd;
	private String edctClsfNm;
	private String edctSttgYmd;
	private String edctFnshYmd;
	private String edctNm;
	private String edinNm;
	private int edctAplcIdCnt;
	private String sttgYmd; // 검색 시작일자
	private String fnshYmd; // 검색 종료일자
	private String fnshYn;
	private Integer pageSet; //페이지SetNumber
	
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
		return sttgYmd;
	}
	public void setSttgYmd(String sttgYmd) {
		this.sttgYmd = sttgYmd;
	}
	public String getFnshYmd() {
		return fnshYmd;
	}
	public void setFnshYmd(String fnshYmd) {
		this.fnshYmd = fnshYmd;
	}
	public String getFnshYn() {
		return fnshYn;
	}
	public void setFnshYn(String fnshYn) {
		this.fnshYn = fnshYn;
	}
	public Integer getPageSet() {
		return pageSet;
	}
	public void setPageSet(Integer pageSet) {
		this.pageSet = pageSet;
	}
}
