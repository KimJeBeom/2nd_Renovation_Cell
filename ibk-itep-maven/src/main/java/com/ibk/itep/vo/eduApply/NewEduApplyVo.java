package com.ibk.itep.vo.eduApply;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author EUNSUP
 *
 */
public class NewEduApplyVo {
	
	private Integer aplcId;
	private String userId;
	private String aplcTs;
	private String inbkEdctYn;
	private String edctNm;
	private String edctCon;
	private String edinNm;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private Date aplcSttgYmd;
	private Date aplcFnshYmd;
	private Date edctSttgTim;
	private Date edctFnshTim;
	private String edex;
	private String onlEdctYn;
	private String edctLevl;
	private String apndDat;
	private String cnfmId;
	
	public Integer getAplcId() {
		return aplcId;
	}
	public void setAplcId(Integer aplcId) {
		this.aplcId = aplcId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAplcTs() {
		return aplcTs;
	}
	public void setAplcTs(String aplcTs) {
		this.aplcTs = aplcTs;
	}
	public String getInbkEdctYn() {
		return inbkEdctYn;
	}
	public void setInbkEdctYn(String inbkEdctYn) {
		this.inbkEdctYn = inbkEdctYn;
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
	public Date getEdctSttgYmd() {
		return edctSttgYmd;
	}
	public void setEdctSttgYmd(String edctSttgYmd) {
		edctSttgYmd = edctSttgYmd+" 00:00:00";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date edctSttgYmdTo = null;
		try {
			edctSttgYmdTo = transFormat.parse(edctSttgYmd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.edctSttgYmd = edctSttgYmdTo;
	}
	public Date getEdctFnshYmd() {
		return edctFnshYmd;
	}
	public void setEdctFnshYmd(String edctFnshYmd) {
		edctFnshYmd = edctFnshYmd+" 00:00:00";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date edctFnshYmdTo = null;
		try {
			edctFnshYmdTo = transFormat.parse(edctFnshYmd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.edctFnshYmd = edctFnshYmdTo;
	}
	public Date getAplcSttgYmd() {
		return aplcSttgYmd;
	}
	public void setAplcSttgYmd(String aplcSttgYmd) {
		aplcSttgYmd = aplcSttgYmd+" 00:00:00";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date aplcSttgYmdTo = null;
		try {
			aplcSttgYmdTo = transFormat.parse(aplcSttgYmd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.aplcSttgYmd = aplcSttgYmdTo;
	}
	public Date getAplcFnshYmd() {
		return aplcFnshYmd;
	}
	public void setAplcFnshYmd(String aplcFnshYmd) {
		aplcFnshYmd = aplcFnshYmd+" 00:00:00";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date aplcFnshYmdTo = null;
		try {
			aplcFnshYmdTo = transFormat.parse(aplcFnshYmd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.aplcFnshYmd = aplcFnshYmdTo;
	}
	public Date getEdctSttgTim() {
		return edctSttgTim;
	}
	public void setEdctSttgTim(String edctSttgTim) {
		edctSttgTim = edctSttgTim+":00";
		SimpleDateFormat transFormat = new SimpleDateFormat("hh:mm:ss");
		Date edctSttgTimTo = null;
		try {
			edctSttgTimTo = transFormat.parse(edctSttgTim);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.edctSttgTim = edctSttgTimTo;
	}
	public Date getEdctFnshTim() {
		return edctFnshTim;
	}
	public void setEdctFnshTim(String edctFnshTim) {
		edctFnshTim = edctFnshTim+":00";
		SimpleDateFormat transFormat = new SimpleDateFormat("hh:mm:ss");
		Date edctFnshTimTo = null;
		try {
			edctFnshTimTo = transFormat.parse(edctFnshTim);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.edctFnshTim = edctFnshTimTo;
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
	public String getCnfmId() {
		return cnfmId;
	}
	public void setCnfmId(String cnfmId) {
		this.cnfmId = cnfmId;
	}

}
