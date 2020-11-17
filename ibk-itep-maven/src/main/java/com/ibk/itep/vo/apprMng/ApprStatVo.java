package com.ibk.itep.vo.apprMng;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class ApprStatVo {
	private Integer edctAplcId;
	private String brnm;
	private String userNm;
	private String edctNm;
	private Date aplcTs;	
	private String dpmAthzNm;
	private String grmAthzNm;
	private String aplcStgCd;
	private String aplcStg;
	private String apprNm;
	
	public Integer getEdctAplcId() {
		return edctAplcId;
	}
	public void setEdctAplcId(Integer edctAplcId) {
		this.edctAplcId = edctAplcId;
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
	public String getAplcTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(aplcTs != null)
			return sdf.format(aplcTs);
		else 
			return "";
	}
	public void setAplcTs(Date aplcTs) {
		this.aplcTs = aplcTs;
	}
	public String getDpmAthzNm() {
		if(dpmAthzNm == null) 
			return "";
		else
			return dpmAthzNm;
	}
	public void setDpmAthzNm(String dpmAthzNm) {
		this.dpmAthzNm = dpmAthzNm;
	}
	public String getGrmAthzNm() {
		if(grmAthzNm == null) 
			return "";
		else
			return grmAthzNm;
	}
	public void setGrmAthzNm(String grmAthzNm) {
		this.grmAthzNm = grmAthzNm;
	}
	public String getAplcStgCd() {
		return aplcStgCd;
	}
	public void setAplcStgCd(String aplcStgCd) {
		this.aplcStgCd = aplcStgCd;
	}
	public String getAplcStg() {
		return aplcStg;
	}
	public void setAplcStg(String aplcStg) {
		this.aplcStg = aplcStg;
	}
	public String getApprNm() {
		return apprNm;
	}
	public void setApprNm(String apprNm) {
		this.apprNm = apprNm;
	}
}