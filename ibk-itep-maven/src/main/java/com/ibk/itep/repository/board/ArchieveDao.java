package com.ibk.itep.repository.board;

import java.util.List;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.board.ArchieveVo;

@Repository
public class ArchieveDao { 
	@Autowired
	private SqlSession sqlSession;
	
	//query : queryBoard.xml
	private static final Logger logger = LoggerFactory.getLogger(ArchieveDao.class);
	
	//자료실 목록 조회를 위한 DAO(query:selectArchieve)
	public List<ArchieveVo> selectArchieve(ArchieveVo vo) {

		logger.info("[DAO]selectArchieve Start");
		logger.info(" -- getTtl : "+vo.getTtl());
		List<ArchieveVo> list = sqlSession.selectList("queryBoard.selectArchieve",vo);
		logger.info("[DAO]selectArchieve End");

		return list;
	}
	
	//자료실 상세정보 조회를 위한 DAO(selectArchieveDetail)
	public ArchieveVo selectArchieveDetail(ArchieveVo vo) {
		
		logger.info("[DAO]selectArchieveDetail Start");
		logger.info(" -- getRflbId : "+vo.getRflbId());
		ArchieveVo outVo = sqlSession.selectOne("queryBoard.selectArchieveDetail",vo);
		logger.info("[DAO]selectArchieveDetail End");
		
		return outVo;
	}
	
	//자료실 등록을 위한 DAO(query:insertArchieve)
	public boolean insertArchieve(ArchieveVo vo) {
		
		logger.info("[DAO]insertArchieve Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryBoard.insertArchieve", vo);
		logger.info("[DAO]insertArchieve End");
		
		return modRst == 1;
	}
	
	//자료실 변경을 위한 DAO(query:updateArchieve)
	public boolean updateArchieve(ArchieveVo vo) {
		
		logger.info("[DAO]updateArchieve Start");
		int modRst = sqlSession.delete("queryBoard.updateArchieve", vo);
		logger.info("[DAO]updateArchieve End");
		
		return modRst == 1;
	}
	
	//자료실 삭제를 위한 DAO(query:deleteArchieve)
	//실제 원장에서 삭제는 하지 않으며 UseYn만 N으로 변경하여 조회 불가 상태로 업데이트 한다.
	public boolean deleteArchieve(ArchieveVo vo) {
		
		logger.info("[DAO]deleteArchieve Start");
		int modRst = sqlSession.delete("queryBoard.deleteArchieve", vo);
		logger.info("[DAO]deleteArchieve End");
		
		return modRst == 1;
	}

}
