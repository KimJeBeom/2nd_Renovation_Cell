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
	
		//List<NoticeVo> list = sqlSession.selectList("queryLes.selectNotice",vo);
		List<NoticeVo> list = sqlSession.selectList("queryLes.selectNotice",vo);
		return list;
	}
	
	
	public NoticeVo selectNoticeDetail(NoticeVo vo) {
		System.out.println("### DAO OK!! getPbnsId: "+vo.getPbnsId());
		String sql = sqlSession.getConfiguration().getMappedStatement("queryLes.selectNoticeDetail").getBoundSql(vo).getSql();
 
        //System.out.println("sql : " + sql);
	
		//List<NoticeVo> list = sqlSession.selectList("queryLes.selectNotice",vo);
		NoticeVo outVo = sqlSession.selectOne("queryLes.selectNoticeDetail",vo);
		System.out.println("### SELECT OK!! getTtl: "+vo.getTtl());
		System.out.println("vo:"+vo);
		return outVo;
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

	public String getSysdate() {
		String sysdate = sqlSession.selectOne("queryLogin.getsysdate");
		return sysdate;
	}
}
