package com.ibk.itep.vo.admin;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EduRndRegModVo {

	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModVo.class);
	
	private Integer edctCntId; // 교육차수ID
	private Integer edctId; // 교육ID
	private Date edctSttgYmd; // 학습시작일
	private Date edctFnshYmd; // 학습종료일
	private Date aplcSttgYmd; // 신청시작일
	private Date aplcFnshYmd; // 신청종료일
	private Date cnclSttgYmd; // 취소시작일
	private Date cnclFnshYmd; // 취소종료일
	private Date edctSttgTim; // 교육시작시간
	private Date edctFnshTim; // 교육종료시간
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
		return dateToStringYmd(edctSttgYmd);
	}
	public void setEdctSttgYmd(String edctSttgYmd) {
		this.edctSttgYmd = stringToDateYmd(edctSttgYmd);
	}
	public String getEdctFnshYmd() {
			return dateToStringYmd(edctFnshYmd);
	}
	public void setEdctFnshYmd(String edctFnshYmd) {
		this.edctFnshYmd = stringToDateYmd(edctFnshYmd);
	}
	public String getAplcSttgYmd() {
			return dateToStringYmd(aplcSttgYmd);
	}
	public void setAplcSttgYmd(String aplcSttgYmd) {
		this.aplcSttgYmd = stringToDateYmd(aplcSttgYmd);
	}
	public String getAplcFnshYmd() {
			return dateToStringYmd(aplcFnshYmd);
	}
	public void setAplcFnshYmd(String aplcFnshYmd) {
		this.aplcFnshYmd = stringToDateYmd(aplcFnshYmd);
	}
	public String getCnclSttgYmd() {
		return dateToStringYmd(cnclSttgYmd);
	}
	public void setCnclSttgYmd(String cnclSttgYmd) {
		this.cnclSttgYmd = stringToDateYmd(cnclSttgYmd);
	}
	public String getCnclFnshYmd() {
		return dateToStringYmd(cnclFnshYmd);
	}
	public void setCnclFnshYmd(String cnclFnshYmd) {
		this.cnclFnshYmd = stringToDateYmd(cnclFnshYmd);
	}
	public Date getEdctSttgTim() {
		return edctSttgTim;
	}
	public void setEdctSttgTim(Date edctSttgTim) {
		this.edctSttgTim = edctSttgTim;
	}
	public Date getEdctFnshTim() {
		return edctFnshTim;
	}
	public void setEdctFnshTim(Date edctFnshTim) {
		logger.debug("edct fnsh tim {}", edctFnshTim);
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
	
	public String dateToStringYmd(Date date) {
		//date 형식 -> String으로 변경 = 1989.12.10(yyyy.MM.dd 형식)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(date != null)
		    return sdf.format(date);
		else 
			return "";
	}
	
	public Date stringToDateYmd(String ymd) {
		//String 형식 -> date 형식으로
		ymd = ymd+" 00:00:00";
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date date = null;
	      try {
	    	 date = sdf.parse(ymd);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return date;
	}
	
	public Date stringToDateTime(String time) {
		//String 형식 -> date 형식으로
	    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	    Date date = null;
	      try {
	    	 date = sdf.parse(time);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return date;
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
