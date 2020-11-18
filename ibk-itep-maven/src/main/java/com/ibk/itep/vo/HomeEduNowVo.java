package com.ibk.itep.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class HomeEduNowVo {
	private int edctAplcId;
	private String edctNm;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	
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
}