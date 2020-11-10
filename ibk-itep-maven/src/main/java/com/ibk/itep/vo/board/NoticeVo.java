package com.ibk.itep.vo.board;

import java.util.Date;

/**
 * @author EUNSUP
 *
 */

public class NoticeVo {
	private Integer pbnsId;
	private String edctClsfCd;
	private String ttl;
	private String con;
	private Date rgsnTs;
	private String userId;
	private String apndDat;
	public Integer getPbnsId() {
		return pbnsId;
	}
	public void setPbnsId(Integer pbnsId) {
		this.pbnsId = pbnsId;
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
	public Date getRgsnTs() {
		return rgsnTs;
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
		

	
}
