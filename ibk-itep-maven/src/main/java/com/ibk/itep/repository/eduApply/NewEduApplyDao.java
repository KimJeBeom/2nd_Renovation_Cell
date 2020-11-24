package com.ibk.itep.repository.eduApply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Repository
public class NewEduApplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean InsertNewEdu(NewEduApplyVo vo) {
		int count = sqlSession.insert("queryEduApply.InsertNewEdu", vo);
		return count == 1;
	}

}
