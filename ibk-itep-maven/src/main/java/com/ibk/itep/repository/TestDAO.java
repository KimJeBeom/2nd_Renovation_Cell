package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.TestVO;

@Repository
public class TestDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public String getSysdate() {
		String sysdate = sqlSession.selectOne("query.getsysdate");
		return sysdate;
	}
	
	public List<TestVO> getList() {
		List<TestVO> list = sqlSession.selectList("query.getList");
		return list;
	}
	
	public String getPwd(Integer no) {
		String pwd = sqlSession.selectOne("query.getPwd", no);
		return pwd;
	}
	
	public boolean insert(TestVO vo ) {
		int count = sqlSession.insert("query.insert", vo);
		return count == 1;
	}
	
	public boolean delete(Integer no) {
		int count = sqlSession.delete("query.delete", no);
		return count == 1;
	}
}