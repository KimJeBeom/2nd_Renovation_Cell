package com.ibk.itep.repository.board;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.board.NoticeVo;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeVo> selectNotice(NoticeVo vo) {
		System.out.println("### DAO OK!!"+vo.getTtl());
		List<NoticeVo> list = sqlSession.selectList("queryBoard.selectNotice",vo);
		return list;
	}
	
	
	public NoticeVo selectNoticeDetail(NoticeVo vo) {
		System.out.println("### DAO OK!! getPbnsId: "+vo.getPbnsId());
		NoticeVo outVo = sqlSession.selectOne("queryBoard.selectNoticeDetail",vo);
		System.out.println("### SELECT OK!! getTtl: "+vo.getTtl());
		return outVo;
	}
	
	public boolean insertNotice(NoticeVo vo) {
		System.out.println("%%%getUserId =" + vo.getUserId());
		int count = sqlSession.insert("queryBoard.insertNotice", vo);
		return count == 1;
	}
	
	public boolean updateNotice(NoticeVo vo) {
		int count = sqlSession.delete("queryBoard.updateNotice", vo);
		return count == 1;
	}
	
	public boolean deleteNotice(NoticeVo vo) {
		int count = sqlSession.delete("queryBoard.deleteNotice", vo);
		return count == 1;
	}

}
