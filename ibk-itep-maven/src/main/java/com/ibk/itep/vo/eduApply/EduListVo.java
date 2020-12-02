package com.ibk.itep.vo.eduApply;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EduListVo {
	
	//교육차수(TB_IEP_EDC001M)
	private Integer edctCntId;
	private Integer edctId;
	private Date edctSttgYmd;
	private Date edctFnshYmd;
	private Date aplcSttgYmd;
	private Date aplcFnshYmd;
	private Date cnclSttgYmd;
	private Date cnclFnshYmd;
	private Date edctSttgTim;
	private Date edctFnshTim;
	private String edctTrm;
	private String ctcrTim;
	private String edex;
	private String 	fnshYn;
	private Date rgsnTs;
	
	//교육메인(TB_IEP_EDM001M)
	private String edctNm;
	private String edinCd;
	private String edinNm;
	private String edctClsfCd;
	private String edctClsfNm;
	private String snctTgtYn;
	private String edctCon;
	private String inbkEdctYn;
	private String eginAplyYn;
	private String onlEdctYn;
	private String edctLevl;
	
	//수강신청가능여부
	private String aplcAbleYn;
	
	//교육신청
	private String teamCd;
	private String dvcd;
	private String userId;
	private String dpmAthzId;
	private String aplcStgCd;
	private String grmAthzId;
	
	private Integer pageSet; //페이지SetNumber
	

	public String getEdinNm() {
		return edinNm;
	}
	public void setEdinNm(String edinNm) {
		this.edinNm = edinNm;
	}
	public String getEdctClsfNm() {
		return edctClsfNm;
	}
	public void setEdctClsfNm(String edctClsfNm) {
		this.edctClsfNm = edctClsfNm;
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
	public String getEdctSttgYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(edctSttgYmd != null)
			return ymd.format(edctSttgYmd);
		else 
			return "";
	}
	public void setEdctSttgYmd(Date edctSttgYmd) {
		this.edctSttgYmd = edctSttgYmd;
	}
	public String getEdctFnshYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(edctFnshYmd != null)
			return ymd.format(edctFnshYmd);
		else 
			return "";
	}
	public void setEdctFnshYmd(Date edctFnshYmd) {
		this.edctFnshYmd = edctFnshYmd;
	}
	public String getAplcSttgYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(aplcSttgYmd != null)
			return ymd.format(aplcSttgYmd);
		else 
			return "";
		
	}
	public void setAplcSttgYmd(Date aplcSttgYmd) {
		this.aplcSttgYmd = aplcSttgYmd;
	}
	public String getAplcFnshYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(aplcFnshYmd != null)
			return ymd.format(aplcFnshYmd);
		else 
			return "";
	}
	public void setAplcFnshYmd(Date aplcFnshYmd) {
		this.aplcFnshYmd = aplcFnshYmd;
	}
	public String getCnclSttgYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(cnclSttgYmd != null)
			return ymd.format(cnclSttgYmd);
		else 
			return "";
	}
	public void setCnclSttgYmd(Date cnclSttgYmd) {
		this.cnclSttgYmd = cnclSttgYmd;
	}
	public String getCnclFnshYmd() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020.01.01")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");
		if(cnclFnshYmd != null)
			return ymd.format(cnclFnshYmd);
		else 
			return "";
	}
	public void setCnclFnshYmd(Date cnclFnshYmd) {
		this.cnclFnshYmd = cnclFnshYmd;
	}
	public String getEdctSttgTim() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"00:00:00")
		SimpleDateFormat ymd = new SimpleDateFormat("hh:mm:ss");
		if(edctSttgTim != null)
			return ymd.format(edctSttgTim);
		else 
			return "";
	}
	public void setEdctSttgTim(Date edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}
	public String getEdctFnshTim() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"00:00:00")
		SimpleDateFormat ymd = new SimpleDateFormat("hh:mm:ss");
		if(edctFnshTim != null)
			return ymd.format(edctFnshTim);
		else 
			return "";
	}
	public void setEdctFnshTim(Date edctFnshTim) {
		this.edctFnshTim = edctFnshTim;
	}
	public String getEdctTrm() {
		return edctTrm;
	}
	public void setEdctTrm(String edctTrm) {
		this.edctTrm = edctTrm;
	}
	public String getCtcrTim() {
		return ctcrTim;
	}
	public void setCtcrTim(String ctcrTim) {
		this.ctcrTim = ctcrTim;
	}
	public String getEdex() {
		return edex;
	}
	public void setEdex(String edex) {
		this.edex = edex;
	}
	public String getFnshYn() {
		return fnshYn;
	}
	public void setFnshYn(String fnshYn) {
		this.fnshYn = fnshYn;
	}
	public String getRgsnTs() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020-01-01 00:00:00")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if(rgsnTs != null)
			return ymd.format(rgsnTs);
		else 
			return "";
	}
	public void setRgsnTs(Date rgsnTs) {
		this.rgsnTs = rgsnTs;
	}
	public String getEdctNm() {
		return edctNm;
	}
	public void setEdctNm(String edctNm) {
		this.edctNm = edctNm;
	}
	public String getEdinCd() {
		return edinCd;
	}
	public void setEdinCd(String edinCd) {
		this.edinCd = edinCd;
	}
	public String getEdctClsfCd() {
		return edctClsfCd;
	}
	public void setEdctClsfCd(String edctClsfCd) {
		this.edctClsfCd = edctClsfCd;
	}
	public String getSnctTgtYn() {
		return snctTgtYn;
	}
	public void setSnctTgtYn(String snctTgtYn) {
		this.snctTgtYn = snctTgtYn;
	}
	public String getEdctCon() {
		return edctCon;
	}
	public void setEdctCon(String edctCon) {
		this.edctCon = edctCon;
	}
	public String getInbkEdctYn() {
		return inbkEdctYn;
	}
	public void setInbkEdctYn(String inbkEdctYn) {
		this.inbkEdctYn = inbkEdctYn;
	}
	public String getEginAplyYn() {
		return eginAplyYn;
	}
	public void setEginAplyYn(String eginAplyYn) {
		this.eginAplyYn = eginAplyYn;
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
	public String getAplcAbleYn() {
		return aplcAbleYn;
	}
	public void setAplcAbleYn(String aplcAbleYn) {
		this.aplcAbleYn = aplcAbleYn;
	}
	
	public String getTeamCd() {
		return teamCd;
	}
	public void setTeamCd(String teamCd) {
		this.teamCd = teamCd;
	}
	public String getDvcd() {
		return dvcd;
	}
	public void setDvcd(String dvcd) {
		this.dvcd = dvcd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDpmAthzId() {
		return dpmAthzId;
	}
	public void setDpmAthzId(String dpmAthzId) {
		this.dpmAthzId = dpmAthzId;
	}
	public String getAplcStgCd() {
		return aplcStgCd;
	}
	public void setAplcStgCd(String aplcStgCd) {
		this.aplcStgCd = aplcStgCd;
	}

	public String getGrmAthzId() {
		return grmAthzId;
	}
	public void setGrmAthzId(String grmAthzId) {
		this.grmAthzId = grmAthzId;
	}
	
	public Integer getPageSet() {
		return pageSet;
	}
	public void setPageSet(Integer pageSet) {
		this.pageSet = pageSet;
	}
}
