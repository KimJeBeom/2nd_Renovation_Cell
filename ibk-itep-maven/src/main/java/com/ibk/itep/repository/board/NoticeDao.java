package com.ibk.itep.repository.board;

import java.util.List;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.board.NoticeVo;

@Repository
public class NoticeDao { 
	@Autowired
	private SqlSession sqlSession;
	
	//query : queryBoard.xml
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	
	//공지사항 목록 조회를 위한 DAO(query:selectNotice)
	public List<NoticeVo> selectNotice(NoticeVo vo) {

		logger.info("[DAO]selectNotice Start");
		logger.info(" -- getTtl : "+vo.getTtl());
		List<NoticeVo> list = sqlSession.selectList("queryBoard.selectNotice",vo);
		logger.info("[DAO]selectNotice End");

		return list;
	}
	
	//공지사항 상세정보 조회를 위한 DAO(selectNoticeDetail)
	public NoticeVo selectNoticeDetail(NoticeVo vo) {
		
		logger.info("[DAO]selectNoticeDetail Start");
		logger.info(" -- getPbnsId : "+vo.getPbnsId());
		NoticeVo outVo = sqlSession.selectOne("queryBoard.selectNoticeDetail",vo);
		logger.info("[DAO]selectNoticeDetail End");
		
		return outVo;
	}
	
	//공지사항 등록을 위한 DAO(query:insertNotice)
	public boolean insertNotice(NoticeVo vo) {
		
		logger.info("[DAO]insertNotice Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryBoard.insertNotice", vo);
		logger.info("[DAO]insertNotice End");
		
		return modRst == 1;
	}
	
	//공지사항 변경을 위한 DAO(query:updateNotice)
	public boolean updateNotice(NoticeVo vo) {
		
		logger.info("[DAO]updateNotice Start");
		int modRst = sqlSession.delete("queryBoard.updateNotice", vo);
		logger.info("[DAO]updateNotice End");
		
		return modRst == 1;
	}
	
	//공지사항 삭제를 위한 DAO(query:deleteNotice)
	//실제 원장에서 삭제는 하지 않으며 UseYn만 N으로 변경하여 조회 불가 상태로 업데이트 한다.
	public boolean deleteNotice(NoticeVo vo) {
		
		logger.info("[DAO]deleteNotice Start");
		int modRst = sqlSession.delete("queryBoard.deleteNotice", vo);
		logger.info("[DAO]deleteNotice End");
		
		return modRst == 1;
	}
}
