package com.ibk.itep.vo.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EduRndRegModVo {

	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModVo.class);
	
	private Integer edctCntId; // 교육차수ID
	private Integer edctId; // 교육ID
	private String edctSttgYmd; // 학습시작일
	private String edctFnshYmd; // 학습종료일
	private String aplcSttgYmd; // 신청시작일
	private String aplcFnshYmd; // 신청종료일
	private String cnclSttgYmd; // 취소시작일
	private String cnclFnshYmd; // 취소종료일
	private String edctSttgTim; // 교육시작시간
	private String edctFnshTim; // 교육종료시간
	private String edctTrm; // 교육기간
	private String ctcrTim; // 이수시간
	private String edex; // 교육비용
	private String fnshYn; // 종료여부
	private String useYn; // 사용여부
	private String rgsnTs; // 등록일시
	private String edctNm; //교육명
	
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

	public String getAplcSttgYmd() {
		return aplcSttgYmd;
	}

	public void setAplcSttgYmd(String aplcSttgYmd) {
		this.aplcSttgYmd = aplcSttgYmd;
	}

	public String getAplcFnshYmd() {
		return aplcFnshYmd;
	}

	public void setAplcFnshYmd(String aplcFnshYmd) {
		this.aplcFnshYmd = aplcFnshYmd;
	}

	public String getCnclSttgYmd() {
		return cnclSttgYmd;
	}

	public void setCnclSttgYmd(String cnclSttgYmd) {
		this.cnclSttgYmd = cnclSttgYmd;
	}

	public String getCnclFnshYmd() {
		return cnclFnshYmd;
	}

	public void setCnclFnshYmd(String cnclFnshYmd) {
		this.cnclFnshYmd = cnclFnshYmd;
	}

	public String getEdctSttgTim() {
		return edctSttgTim;
	}

	public void setEdctSttgTim(String edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}

	public String getEdctFnshTim() {
		return edctFnshTim;
	}

	public void setEdctFnshTim(String edctFnshTim) {
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

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRgsnTs() {
		return rgsnTs;
	}

	public void setRgsnTs(String rgsnTs) {
		this.rgsnTs = rgsnTs;
	}

	public String getEdctNm() {
		return edctNm;
	}

	public void setEdctNm(String edctNm) {
		this.edctNm = edctNm;
	}

	/*
	 * public Time stringToTime(String strTime) { SimpleTim SimpleDateFormat sdf =
	 * new SimpleDateFormat("HH:mm"); Time time = null; try { time =
	 * sdf.parse(strTime); }catch(ParseException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return time; }
	 * 
	 * public String timeToString() {
	 * 
	 * }
	 */

}
