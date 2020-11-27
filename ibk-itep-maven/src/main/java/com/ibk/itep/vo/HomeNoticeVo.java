package com.ibk.itep.vo;

public class HomeNoticeVo {

	private Integer pbnsId; //공지사항ID
	private String ttl; //제목
	private String rgsnTs; //등록일시(TimeStamp)
	
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
		return rgsnTs;
	}
	public void setRgsnTs(String rgsnTs) {
		this.rgsnTs = rgsnTs;
	}
	
}
