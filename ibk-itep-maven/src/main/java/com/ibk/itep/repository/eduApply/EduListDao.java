package com.ibk.itep.repository.eduApply;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.TestVO;

@Repository
public class EduListDao {
	@Autowired
	private SqlSession sqlSession;

}
