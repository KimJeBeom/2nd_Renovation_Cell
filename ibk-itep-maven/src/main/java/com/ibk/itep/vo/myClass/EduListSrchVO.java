package com.ibk.itep.vo.myClass;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class EduListSrchVO {
	private String userId;
	private String dvcd;
	private String athrCd;
	private int edctAplcId;
	private Date sttgYmd;
	private Date fnshYmd;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDvcd() {
		return dvcd;
	}
	public void setDvcd(String dvcd) {
		this.dvcd = dvcd;
	}
	public String getAthrCd() {
		return athrCd;
	}
	public void setAthrCd(String athrCd) {
		this.athrCd = athrCd;
	}
	public int getEdctAplcId() {
		return edctAplcId;
	}

	public void setEdctAplcId(int edctAplcId) {
		this.edctAplcId = edctAplcId;
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
