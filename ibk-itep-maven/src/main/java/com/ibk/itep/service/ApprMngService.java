package com.ibk.itep.service;

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
	
}



