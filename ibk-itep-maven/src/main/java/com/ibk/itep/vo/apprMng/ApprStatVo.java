package com.ibk.itep.vo.apprMng;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class ApprStatVo {
	private Integer edctAplcId;
	private String brnm;
	private String userNm;
	private String edctNm;
	private Date aplcTs;	
	private String dpmAthzDvcd;
	private String dpmAthzNm;
	private String dpmAthzCon;
	private Date dpmAthzTs;
	private String grmAthzDvcd;
	private String grmAthzNm;
	private String grmAthzCon;
	private Date grmAthzTs;
	private String aplcStgCd;
	private String rtreCon;
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
	public String getDpmAthzDvcd() {
		return dpmAthzDvcd;
	}
	public void setDpmAthzDvcd(String dpmAthzDvcd) {
		this.dpmAthzDvcd = dpmAthzDvcd;
	}
	public String getDpmAthzNm() {
		return dpmAthzNm;
	}
	public void setDpmAthzNm(String dpmAthzNm) {
		this.dpmAthzNm = dpmAthzNm;
	}
	public String getDpmAthzCon() {
		return dpmAthzCon;
	}
	public void setDpmAthzCon(String dpmAthzCon) {
		this.dpmAthzCon = dpmAthzCon;
	}
	public String getDpmAthzTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(dpmAthzTs != null)
			return sdf.format(dpmAthzTs);
		else 
			return "";
	}
	public void setDpmAthzTs(Date dpmAthzTs) {
		this.dpmAthzTs = dpmAthzTs;
	}
	public String getGrmAthzDvcd() {
		return grmAthzDvcd;
	}
	public void setGrmAthzDvcd(String grmAthzDvcd) {
		this.grmAthzDvcd = grmAthzDvcd;
	}
	public String getGrmAthzNm() {
		return grmAthzNm;
	}
	public void setGrmAthzNm(String grmAthzNm) {
		this.grmAthzNm = grmAthzNm;
	}
	public String getGrmAthzCon() {
		return grmAthzCon;
	}
	public void setGrmAthzCon(String grmAthzCon) {
		this.grmAthzCon = grmAthzCon;
	}
	public String getGrmAthzTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(grmAthzTs != null)
			return sdf.format(grmAthzTs);
		else 
			return "";
	}
	public void setGrmAthzTs(Date grmAthzTs) {
		this.grmAthzTs = grmAthzTs;
	}
	public String getAplcStgCd() {
		return aplcStgCd;
	}
	public void setAplcStgCd(String aplcStgCd) {
		this.aplcStgCd = aplcStgCd;
	}
	public String getRtreCon() {
		return rtreCon;
	}
	public void setRtreCon(String rtreCon) {
		this.rtreCon = rtreCon;
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