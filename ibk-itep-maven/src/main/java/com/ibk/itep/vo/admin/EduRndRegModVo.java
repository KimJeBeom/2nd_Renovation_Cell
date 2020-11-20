package com.ibk.itep.vo.admin;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibk.itep.controller.admin.pop.AddEduRndPopController;
import com.ibk.itep.service.cmm.CmmService;

public class EduRndRegModVo {
	
	@Autowired
	CmmService cmmService;
	
	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModVo.class);
	
	private Integer edctCntId; // 교육차수ID
	private Integer edctId; // 교육ID
	private Date edctSttgYmd; // 학습시작일
	private Date edctFnshYmd; // 학습종료일
	private Date aplcSttgYmd; // 신청시작일
	private Date aplcFnshYmd; // 신청종료일
	private Date cnclSttgYmd; // 취소시작일
	private Date cnclFnshYmd; // 취소종료일
	private Time edctSttgTim; // 교육시작시간
	private Time edctFnshTim; // 교육종료시간
	private String edctTrm; // 교육기간
	private String ctcrTim; // 이수시간
	private String edex; // 교육비용
	private String fnshYn; // 종료여부
	private String useYn; // 사용여부
	private Date rgsnTs; // 등록일시
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
		return cmmService.dateToStringYmd(edctSttgYmd);
	}
	public void setEdctSttgYmd(Date edctSttgYmd) {
		logger.info("setEdctSttgYmd 진입 Date형 {}",edctSttgYmd);
		this.edctSttgYmd = edctSttgYmd;
	}
	/*public void setEdctSttgYmd(String edctSttgYmd) {
		logger.info("setEdctSttgYmd 진입 스트링형 {}",edctSttgYmd);
		this.edctSttgYmd = cmmService.stringToDateYmd(edctSttgYmd);
	}*/
	public String getEdctFnshYmd() {
			return cmmService.dateToStringYmd(edctFnshYmd);
	}
	public void setEdctFnshYmd(Date edctFnshYmd) {
		this.edctFnshYmd = edctFnshYmd;
	}
	public void setEdctFnshYmd(String edctFnshYmd) {
		this.edctFnshYmd = cmmService.stringToDateYmd(edctFnshYmd);
	}
	public String getAplcSttgYmd() {
			return cmmService.dateToStringYmd(aplcSttgYmd);
	}
	public void setAplcSttgYmd(Date aplcSttgYmd) {
		this.aplcSttgYmd = aplcSttgYmd;
	}
	public void setAplcSttgYmd(String aplcSttgYmd) {
		this.aplcSttgYmd = cmmService.stringToDateYmd(aplcSttgYmd);
	}
	public String getAplcFnshYmd() {
			return cmmService.dateToStringYmd(aplcFnshYmd);
	}
	public void setAplcFnshYmd(Date aplcFnshYmd) {
		this.aplcFnshYmd = aplcFnshYmd;
	}
	public void setAplcFnshYmd(String aplcFnshYmd) {
		this.aplcFnshYmd = cmmService.stringToDateYmd(aplcFnshYmd);
	}
	public String getCnclSttgYmd() {
		return cmmService.dateToStringYmd(cnclSttgYmd);
	}
	public void setCnclSttgYmd(Date cnclSttgYmd) {
		this.cnclSttgYmd = cnclSttgYmd;
	}
	public void setCnclSttgYmd(String cnclSttgYmd) {
		this.cnclSttgYmd = cmmService.stringToDateYmd(cnclSttgYmd);
	}
	public String getCnclFnshYmd() {
		return cmmService.dateToStringYmd(cnclFnshYmd);
	}
	public void setCnclFnshYmd(Date cnclFnshYmd) {
		this.cnclFnshYmd = cnclFnshYmd;
	}
	public void setCnclFnshYmd(String cnclFnshYmd) {
		this.cnclFnshYmd = cmmService.stringToDateYmd(cnclFnshYmd);
	}
	public Time getEdctSttgTim() {
		return edctSttgTim;
	}
	public void setEdctSttgTim(Time edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}
	public Time getEdctFnshTim() {
		return edctFnshTim;
	}
	public void setEdctFnshTim(Time edctFnshTim) {
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
	public Date getRgsnTs() {
		return rgsnTs;
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
	



}
