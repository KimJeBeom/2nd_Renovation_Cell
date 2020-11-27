package com.ibk.itep.service.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired private NoticeDao noticeDAO;
	private static final Logger logger = LoggerFactory.getLogger(NoticeService.class);
	
	//공지사항 목록을 List로 받가오기 위한 Service(praram : ttl(제목))
	public List<NoticeVo> getList(NoticeVo vo){
		
		logger.info("NoticeGetList Start");
		logger.info(" -- getTtl : "+vo.getTtl());
	
		List<NoticeVo> list =  noticeDAO.selectNotice(vo);
		
		logger.info("NoticeGetList End");

		return list;
	}

	//공지사항 상세정보를 Vo로 받가오기 위한 Service(praram : getPbnsId(공지사항번호))
	public NoticeVo getDetail(NoticeVo vo){
		
		logger.info("NoticeGetDetail Start");
		logger.info(" -- getPbnsId : "+vo.getPbnsId());
	
		NoticeVo outVo =  noticeDAO.selectNoticeDetail(vo);
		
		logger.info("NoticeGetDetail End");

		return outVo;
	}
	
	//공지사항 변경 작업처리를 위한 Service(praram : 변경대상 Vo(NoticeVo) 및 ModAction 값))
	public boolean modAction(NoticeVo vo,String modType, SessionVo ssnInfo){
		
		logger.info("NoticeGetDetail Start");
		logger.info(" -- getPbnsId : "+vo.getPbnsId());
		logger.info(" -- modType   : "+modType);
		
		boolean modRst = false;
		vo.setUserId(ssnInfo.getUserId()); //현재사용자 세션ID입력
		
		//ModAction에 따른 DAO제어
		if(modType.equals("update")) {
			modRst =  noticeDAO.updateNotice(vo);
		}else if(modType.equals("delete")){
			modRst =  noticeDAO.deleteNotice(vo);
		}else if(modType.equals("insert")){
			modRst =  noticeDAO.insertNotice(vo);
		}
		
		logger.info("NoticeGetDetail End");
		return modRst;
	}
	
}
