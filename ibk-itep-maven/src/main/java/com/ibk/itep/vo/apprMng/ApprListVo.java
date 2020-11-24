package com.ibk.itep.vo.apprMng;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class ApprListVo {
	private Integer edctAplcId;
	private Integer edctCntId;
	private Integer edctId;
	private String brnm;
	private String userNm;
	private String edctNm;
	private Date aplcTs;
	
	public Integer getEdctAplcId() {
		return edctAplcId;
	}
	public void setEdctAplcId(Integer edctAplcId) {
		this.edctAplcId = edctAplcId;
	}
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
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getEdctNm() {
		return edctNm;
	}
	public void setEdctNm(String edctNm) {
		this.edctNm = edctNm;
	}
	// Date 타입 데이터를 포맷변경하여 String 타입으로 반환
	public String getAplcTs() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(aplcTs);
	}
	// String으로 받은 데이터를 Service에서 Date로 변환 후 DAO에게 넘겨야 함
	public void setAplcTs(Date aplcTs) {
		this.aplcTs = aplcTs;
	}
	 
}