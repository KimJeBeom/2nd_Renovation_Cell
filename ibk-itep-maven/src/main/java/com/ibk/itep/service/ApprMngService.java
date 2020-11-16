package com.ibk.itep.service;

import java.sql.Date;
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
import com.ibk.itep.vo.apprMng.ApprStatSrchVo;
import com.ibk.itep.vo.apprMng.ApprStatVo;


@Service
public class ApprMngService {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprMngService.class);
	
	@Autowired
	private ApprMngDao apprMngDAO;
	
	public List<ApprListVo> selectApprList(){
		/* 테스트를 위한 임의의 세션VO 객체 생성 */
		SessionVo ssnVo = new SessionVo();
		ssnVo.setUserId("42664");
		ssnVo.setBrcd("0710");
		ssnVo.setAthrCd("ADM");
		
		return apprMngDAO.selectApprList(ssnVo);
	}
	
	public ApprListDetailVo selectApprListDetail(int edctAplcId){
		return apprMngDAO.selectApprListDetail(edctAplcId);
	}
	
	public int updateApprConf(List<Integer> edctAplcIdArr){		
		int check = 0;
		for(int id : edctAplcIdArr) {
			// 해당 신청건의 현재 교육신청단계코드 조회
			String aplcStgCd = apprMngDAO.selectAplcStgCd(id);
			
			// 교육신청 단계가 부서결재단계, 그룹결재단계 이면 승인처리 진행
			if(aplcStgCd.equals("APRDPM") || aplcStgCd.equals("APRGRM")) {
				
				// 파라미터 전달을 위한 vo 객체 생성
				ApprConfRejVo apprConfRejVo = new ApprConfRejVo();
				apprConfRejVo.setUserId("42664");
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
	
	public int updateApprRej(List<Integer> edctAplcIdArr, String rtreCon){		
		int check = 0;
		for(int id : edctAplcIdArr) {
			// 해당 신청건의 현재 교육신청단계코드 조회
			String aplcStgCd = apprMngDAO.selectAplcStgCd(id);
			
			// 교육신청 단계가 부서결재단계, 그룹결재단계 이면 반려처리 진행
			if(aplcStgCd.equals("APRDPM") || aplcStgCd.equals("APRGRM")) {
				
				// 반려사유 개행처리
				//rtreCon = rtreCon.replace("\r\n", "<br>");
				
				// 파라미터 전달을 위한 vo 객체 생성
				ApprConfRejVo apprConfRejVo = new ApprConfRejVo();
				apprConfRejVo.setUserId("42664");
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
	
	public List<ApprStatVo> selectApprStat(String sttgYmd, String fnshYmd, String aplcStg){
		ApprStatSrchVo srchVo = new ApprStatSrchVo();
		srchVo.setDvcd("0710");
		srchVo.setAthrCd("ADM");
		
		if(sttgYmd != null && !sttgYmd.equals("")) {
			srchVo.setSttgYmd(Date.valueOf(sttgYmd.replace("/", "-"))); // 검색 - 시작일자
		}if(fnshYmd != null && !fnshYmd.equals(""))
			srchVo.setFnshYmd(Date.valueOf(fnshYmd.replace("/", "-"))); // 검색 - 종료일자 
		if(aplcStg != null && !aplcStg.equals(""))
			srchVo.setAplcStg(aplcStg); // 검색 - 결재단계
		
		List<ApprStatVo> list = apprMngDAO.selectApprStat(srchVo);
		
		for(ApprStatVo vo : list) {
			String aplcStgCd = vo.getAplcStgCd();
			
			/*
			 *  결재단계코드에 따른 결재의견 지정
			 *  APRFIN - 결재완료 / 결재자 GRM / DPM, GRM 결재완료
			 *  EDUFIN - 결재완료 / 결재자 GRM / DPM, GRM 결재완료
			 *  APRDPM - 결재중 / 결재자 DPM / DPM 결재중, GRM 빈칸
			 *  APRGRM - 결재중 / 결재자 GRM / DPM 결재완료, GRM 결재중
			 *  REJDPM - 반려 / 결재자 DPM / DPM 반려사유, GRM 빈칸
			 *  REJGRM - 반려 / 결재자 GRM / DPM 결재완료, GRM 반려사유
			*/
			if(aplcStgCd.equals("APRFIN") || aplcStgCd.equals("EDUFIN")) {
				vo.setAplcStg("결재완료");
				vo.setApprNm(vo.getGrmAthzNm());
				vo.setDpmAthzCon("결재완료");
				vo.setGrmAthzCon("결재완료");
			} else if(aplcStgCd.equals("APRDPM")) {
				vo.setAplcStg("결재중");
				vo.setApprNm(vo.getDpmAthzNm());
				vo.setDpmAthzCon("결재중");
				vo.setGrmAthzCon("");
			} else if(aplcStgCd.equals("APRGRM")) {
				vo.setAplcStg("결재중");
				vo.setApprNm(vo.getGrmAthzNm());
				vo.setDpmAthzCon("결재완료");
				vo.setGrmAthzCon("결재중");
			} else if(aplcStgCd.equals("REJDPM")) {
				vo.setAplcStg("반려");
				vo.setApprNm(vo.getDpmAthzNm());
				vo.setDpmAthzCon(vo.getRtreCon());
				vo.setGrmAthzCon("");
			} else if(aplcStgCd.equals("REJGRM")) {
				vo.setAplcStg("반려");
				vo.setApprNm(vo.getGrmAthzNm());
				vo.setDpmAthzCon("결재완료");
				vo.setGrmAthzCon(vo.getRtreCon());
			}
		}
		return list;
	}
}



