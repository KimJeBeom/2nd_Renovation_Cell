package com.ibk.itep.repository.board;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.board.ArchieveVo;

@Repository
public class ArchieveDao {
	@Autowired
	private SqlSession sqlSession;
	public List<ArchieveVo> selectArchList(ArchieveVo vo) {
		List<ArchieveVo> list = sqlSession.selectList("queryLes.selectArchList", vo);
		return list;
	}
	
	public boolean insertArchieve(ArchieveVo vo) {
		int count = sqlSession.insert("queryLes.insertArchieve", vo);
		return count == 1;
	}
	
	public boolean updateArchieve(ArchieveVo vo) {
		int count = sqlSession.delete("queryLes.updateArchieve", vo);
		return count == 1;
	}
	
	public boolean deleteArchieve(ArchieveVo rflbId) {
		int count = sqlSession.delete("queryLes.deleteArchieve", rflbId);
		return count == 1;
	}


}
