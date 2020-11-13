package com.ibk.itep.vo.board;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author EUNSUP
 *
 */

public class NoticeVo {

	private Integer pbnsId;
	private String edctClsfCd;
	private String edctClsfNm;
	private String ttl;
	private String con;
	private Date rgsnTs;
	private String userId;
	private String userNm;
	private String apndDat;
	
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
	public String getRgsnTs() {
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
		

	
}
