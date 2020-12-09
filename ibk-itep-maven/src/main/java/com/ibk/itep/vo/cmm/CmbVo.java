package com.ibk.itep.vo.cmm;

public class CmbVo {
	private String	brcd;		// 부점코드
	private String	brnm;		// 부점명								
	private String	hgrn_brcd;	// 상위부점코드
	private String	useYn;	// 사용여부
	
	public String getBrcd() {
		return brcd;
	}
	public void setBrcd(String brcd) {
		this.brcd = brcd;
	}
	public String getBrnm() {
		return brnm;
	}
	public void setBrnm(String brnm) {
		this.brnm = brnm;
	}
	public String getHgrn_brcd() {
		return hgrn_brcd;
	}
	public void setHgrn_brcd(String hgrn_brcd) {
		this.hgrn_brcd = hgrn_brcd;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
}
