package com.ibk.itep.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.ApprMngDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprConfRejVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;
import com.ibk.itep.vo.apprMng.ApprStatDetailVo;
import com.ibk.itep.vo.apprMng.ApprStatSrchVo;
import com.ibk.itep.vo.apprMng.ApprStatVo;


@Service
public class ApprMngService {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprMngService.class);
	
	@Autowired
	private ApprMngDao apprMngDAO;
	
	/* 결재할 문서 */
	public List<ApprListVo> selectApprList(SessionVo ssnInfo){		
		List<ApprListVo> list = apprMngDAO.selectApprList(ssnInfo);
		for(ApprListVo vo : list) {
			vo.setAplcTs(changeDateFormat(vo.getAplcTs())); // 날짜 포맷 변경
		}
		return list;
	}
	
	
	/* 결재할 문서 상세내용 */
	public ApprListDetailVo selectApprListDetail(int edctAplcId){
		ApprListDetailVo vo = apprMngDAO.selectApprListDetail(edctAplcId);
		// 날짜 포맷 변경
		vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
		vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
		vo.setAplcSttgYmd(changeDateFormat(vo.getAplcSttgYmd()));
		vo.setAplcFnshYmd(changeDateFormat(vo.getAplcFnshYmd()));
		return vo;
	}
	
	
	/* 결재할 문서 > 승인처리 */
	public int updateApprConf(List<Integer> edctAplcIdArr, SessionVo ssnInfo){		
		int check = 0;
		for(int id : edctAplcIdArr) {
			// 해당 신청건의 현재 교육신청단계코드 조회
			String aplcStgCd = apprMngDAO.selectAplcStgCd(id);
			
			// 교육신청 단계가 부서결재단계, 그룹결재단계 이면 승인처리 진행
			if(aplcStgCd.equals("APRDPM") || aplcStgCd.equals("APRGRM")) {
				
				// 파라미터 전달을 위한 vo 객체 생성
				ApprConfRejVo apprConfRejVo = new ApprConfRejVo();
				apprConfRejVo.setUserId(ssnInfo.getUserId());
				apprConfRejVo.setEdctAplcId(id);
				apprConfRejVo.setAplcStgCd(aplcStgCd);
				
				apprMngDAO.updateApprConf(apprConfRejVo);
				
				check = 1;
			} 
			// 교육신청단계가 결재단계가 아닌게 하나라도 있으면 에러메세지 반환
			else {
				check = 0;
				break;
			}
		}
		return check;
	}
	
	
	/* 결재할 문서 > 반려처리 */
	public int updateApprRej(List<Integer> edctAplcIdArr, String rtreCon, SessionVo ssnInfo){		
		int check = 0;
		for(int id : edctAplcIdArr) {
			// 해당 신청건의 현재 교육신청단계코드 조회
			String aplcStgCd = apprMngDAO.selectAplcStgCd(id);
			
			// 교육신청 단계가 부서결재단계, 그룹결재단계 이면 반려처리 진행
			if(aplcStgCd.equals("APRDPM") || aplcStgCd.equals("APRGRM")) {
				
				// 반려사유 개행처리
				rtreCon = rtreCon.replace("\n", "<br />");
				
				// 파라미터 전달을 위한 vo 객체 생성
				ApprConfRejVo apprConfRejVo = new ApprConfRejVo();
				apprConfRejVo.setUserId(ssnInfo.getUserId());
				apprConfRejVo.setEdctAplcId(id);
				apprConfRejVo.setAplcStgCd(aplcStgCd);
				apprConfRejVo.setRtreCon(rtreCon);
				
				apprMngDAO.updateApprRej(apprConfRejVo);
				
				check = 1;
			} 
			// 교육신청단계가 결재단계가 아닌게 하나라도 있으면 에러메세지 반환
			else {
				check = 0;
				break;
			}
		}
		return check;
	}
	
	
	/* 결재 진행 및 완료문서 > 결재 현황 */
	public List<ApprStatVo> selectApprStat(String sttgYmd, String fnshYmd, String aplcStg, SessionVo ssnInfo){
		ApprStatSrchVo srchVo = new ApprStatSrchVo();

		// 검색 데이터 vo에 담아 넘겨줌
		srchVo.setDvcd(ssnInfo.getBrcd());
		srchVo.setAthrCd(ssnInfo.getAthrCd());
		
		if(sttgYmd != null && !sttgYmd.equals("")) 
			srchVo.setSttgYmd(sttgYmd); // 검색 - 시작일자
		else
			srchVo.setSttgYmd("");
		if(fnshYmd != null && !fnshYmd.equals(""))
			srchVo.setFnshYmd(fnshYmd); // 검색 - 종료일자
		else
			srchVo.setFnshYmd("");
		if(aplcStg != null && !aplcStg.equals(""))
			srchVo.setAplcStg(aplcStg); // 검색 - 결재단계
		
		List<ApprStatVo> list = apprMngDAO.selectApprStat(srchVo);
		
		for(ApprStatVo vo : list) {
			
			// null 체크 및 날짜 포맷 변경
			if(vo.getDpmAthzNm() == null)
				vo.setDpmAthzNm("");
			if(vo.getGrmAthzNm() == null)
				vo.setGrmAthzNm("");
			if(vo.getAplcTs() == null)
				vo.setAplcTs("");
			else
				vo.setAplcTs(changeDateFormat(vo.getAplcTs()));
			
			/*
			 *  결재단계코드에 따른 결재의견 지정
			 *  APRFIN - 결재완료 / 결재자 GRM 
			 *  EDUFIN - 결재완료 / 결재자 GRM 
			 *  APRDPM - 결재중 / 결재자 DPM 
			 *  APRGRM - 결재중 / 결재자 GRM 
			 *  REJDPM - 반려 / 결재자 DPM 
			 *  REJGRM - 반려 / 결재자 GRM 
			*/
			String aplcStgCd = vo.getAplcStgCd();
			if(aplcStgCd.equals("APRFIN") || aplcStgCd.equals("EDUFIN")) {
				vo.setAplcStg("결재완료");
				vo.setApprNm(vo.getGrmAthzNm());
			} else if(aplcStgCd.equals("APRDPM")) {
				vo.setAplcStg("결재중");
				vo.setApprNm(vo.getDpmAthzNm());
			} else if(aplcStgCd.equals("APRGRM")) {
				vo.setAplcStg("결재중");
				vo.setApprNm(vo.getGrmAthzNm());
			} else if(aplcStgCd.equals("REJDPM")) {
				vo.setAplcStg("반려");
				vo.setApprNm(vo.getDpmAthzNm());
			} else if(aplcStgCd.equals("REJGRM")) {
				vo.setAplcStg("반려");
				vo.setApprNm(vo.getGrmAthzNm());
			}
		}
		return list;
	}
	
	
	/* 결재 진행 및 완료문서 > 결재이력 */
	public ApprStatDetailVo selectApprStatDetail(int edctAplcId){
		
		ApprStatDetailVo vo = apprMngDAO.selectApprStatDetail(edctAplcId);
		
		// null 체크 및 날짜 포맷 변경
		if(vo.getAplcTs() == null)
			vo.setAplcTs("");
		else
			vo.setAplcTs(changeDateFormat(vo.getAplcTs())); 
		if(vo.getDpmAthzTs() == null)
			vo.setDpmAthzTs("");
		else
			vo.setDpmAthzTs(changeDateFormat(vo.getDpmAthzTs()));
		if(vo.getGrmAthzTs() == null)
			vo.setGrmAthzTs("");
		else
			vo.setGrmAthzTs(changeDateFormat(vo.getGrmAthzTs())); 
		
		/*
		 *  결재단계코드에 따른 결재의견 지정
		 *  APRFIN - DPM, GRM 결재완료
		 *  EDUFIN - DPM, GRM 결재완료
		 *  APRDPM - DPM 결재중, GRM 빈칸
		 *  APRGRM - DPM 결재완료, GRM 결재중
		 *  REJDPM - DPM 반려사유, GRM 빈칸
		 *  REJGRM - DPM 결재완료, GRM 반려사유
		*/
		String aplcStgCd = vo.getAplcStgCd();
		if(aplcStgCd.equals("APRFIN") || aplcStgCd.equals("EDUFIN")) {
			vo.setDpmAthzCon("결재완료");
			vo.setGrmAthzCon("결재완료");
		} else if(aplcStgCd.equals("APRDPM")) {
			vo.setDpmAthzCon("결재중");
			vo.setGrmAthzCon("");
		} else if(aplcStgCd.equals("APRGRM")) {
			vo.setDpmAthzCon("결재완료");
			vo.setGrmAthzCon("결재중");
		} else if(aplcStgCd.equals("REJDPM")) {
			vo.setDpmAthzCon(vo.getRtreCon());
			vo.setGrmAthzCon("");
		} else if(aplcStgCd.equals("REJGRM")) {
			vo.setDpmAthzCon("결재완료");
			vo.setGrmAthzCon(vo.getRtreCon());
		}
		
		return vo;
	}

	
	/* 날짜포맷변경 함수 */
	 public String changeDateFormat(String ymd) {
	      SimpleDateFormat asIsSdf = new SimpleDateFormat("yyyy-MM-dd");
	      SimpleDateFormat toBeSdf = new SimpleDateFormat("yyyy.MM.dd");
	      Date date = null;
	      try {
	         date = asIsSdf.parse(ymd);
	         ymd = toBeSdf.format(date);
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }
	      return ymd;
	   }
}



