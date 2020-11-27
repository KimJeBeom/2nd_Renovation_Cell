package com.ibk.itep.vo.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EduHistoryVo {
	
	private static final Logger logger = LoggerFactory.getLogger(EduHistoryVo.class);
	
	private Integer	edctAplcID;	// 교육 신청 ID
	private Integer	edctCntID;
	private String	edctClsfCd; // 교육 분류
	private String	edctClsfNm; // 교육 분류
	private String	dvcd; 		// 부서명
	private String	brnm; 		// 부서명
	private String 	userId; 	// 직원번호
	private String 	userNm; 	// 직원명
	private String 	edctNm; 	// 교육명
	private String 	edinCd; 	// 교육기관명
	private String 	edinNm; 	// 교육기관명
	private String 	edctSttgYmd;// 교육 시작일
	private String 	edctFnshYmd;// 교육 종료일
	private String 	edex; 		// 예산
	private String 	rfrcCon; 	// 참고

}
