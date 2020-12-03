package com.ibk.itep.vo;

import java.text.SimpleDateFormat;

public class HomeNoticeVo {

	private Integer pbnsId; //공지사항ID
	private String ttl; //제목
	private String rgsnTs; //등록일시(TimeStamp)
	private String userNm; //등록일시(TimeStamp)
	

	public Integer getPbnsId() {
		return pbnsId;
	}
	public void setPbnsId(Integer pbnsId) {
		this.pbnsId = pbnsId;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getRgsnTs() {
		//화면에 날짜 표기를 위한 출력(get) DATETYPE설정(String:"2020-01-01")
		//SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		//return ymd.format(rgsnTs);
		return rgsnTs;
	}
	public void setRgsnTs(String rgsnTs) {
		this.rgsnTs = rgsnTs;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	
}
