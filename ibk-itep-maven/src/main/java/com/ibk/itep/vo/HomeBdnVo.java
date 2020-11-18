package com.ibk.itep.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class HomeBdnVo {
	private int pbnsId;
	private String ttl;
	private Date rgsnTs;
	
	public int getPbnsId() {
		return pbnsId;
	}
	public void setPbnsId(int pbnsId) {
		this.pbnsId = pbnsId;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getRgsnTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(rgsnTs);
	}
	public void setRgsnTs(Date rgsnTs) {
		this.rgsnTs = rgsnTs;
	}
}