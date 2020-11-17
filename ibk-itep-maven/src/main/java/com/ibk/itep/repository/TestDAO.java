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
		String sysdate = sqlSession.selectOne("queryLogin.getsysdate");
		return sysdate;
	}
}