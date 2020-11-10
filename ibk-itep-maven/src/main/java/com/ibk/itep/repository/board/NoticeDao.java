package com.ibk.itep.repository.board;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.TestVO;
import com.ibk.itep.vo.board.NoticeVo;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeVo> selectNotice(NoticeVo vo) {
		System.out.println("### DAO OK!!");
		List<NoticeVo> list = sqlSession.selectList("queryLes.selectNotice",vo);
		return list;
	}
	
	public boolean insertNotice(NoticeVo vo) {
		int count = sqlSession.insert("queryLes.insertNotice", vo);
		return count == 1;
	}
	
	public boolean updateNotice(NoticeVo vo) {
		int count = sqlSession.delete("queryLes.updateNotice", vo);
		return count == 1;
	}
	
	public boolean deleteNotice(NoticeVo pbnsId) {
		int count = sqlSession.delete("queryLes.deleteNotice", pbnsId);
		return count == 1;
	}

}
