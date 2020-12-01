package com.ibk.itep.vo.board;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author EUNSUP
 *
 */
public class ArchieveVo {
	
	private Integer rflbId; //자료실ID
	private String edctClsfCd; //교육구분코드
	private String edctClsfNm; //교욱구분코드명
	private String ttl; //제목
	private String con; //내용
	private Date rgsnTs; //등록일시(TimeStamp)
	private String userId; //등록자직원번호
	private String userNm; //등록자명
	private String apndDat; //첨부파일
	
	private Integer pageSet; //페이지SetNumber
	
	public String getEdctClsfNm() {
		return edctClsfNm;
	}
	public void setEdctClsfNm(String edctClsfNm) {
		this.edctClsfNm = edctClsfNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public Integer getRflbId() {
		return rflbId;
	}
	public void setRflbId(Integer rflbId) {
		this.rflbId = rflbId;
	}
	public String getEdctClsfCd() {
		return edctClsfCd;
	}
	public void setEdctClsfCd(String edctClsfCd) {
		this.edctClsfCd = edctClsfCd;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getRgsnTs() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020-01-01 00:00:00")
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return ymd.format(rgsnTs);
	}
	public void setRgsnTs(Date rgsnTs) {
		this.rgsnTs = rgsnTs;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getApndDat() {
		return apndDat;
	}
	public void setApndDat(String apndDat) {
		this.apndDat = apndDat;
	}
	public Integer getPageSet() {
		return pageSet;
	}
	public void setPageSet(Integer pageSet) {
		this.pageSet = pageSet;
	}


}
