package com.ibk.itep.vo.admin;

public class EduRegModExcelVo {
	
	private Integer edctId;		//교육ID
	private String 	edctClsfNm;	//교육분류명
	private String 	edctNm;		//교육명
	private String 	edctCon;	//교육내용
	private String 	edinNm;		//교육기관명
	private String 	snctTgtYn;	//결재대상여부
	private String 	inbkEdctYn;	//행내교육여부
	private String 	eginAplyYn;	//고용보험적용여부
	private String 	onlEdctYn;	//온라인교육여부
	private String 	edctLevl;	//교육수준
	
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
}
