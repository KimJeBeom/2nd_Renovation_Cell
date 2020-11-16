package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.HomeBdnVo;
import com.ibk.itep.vo.HomeEduNowVo;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprConfRejVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;
import com.ibk.itep.vo.apprMng.ApprStatSrchVo;
import com.ibk.itep.vo.apprMng.ApprStatVo;

@Repository
public class MainHomeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<HomeBdnVo> selectHomeBdnList() {
		List<HomeBdnVo> list = sqlSession.selectList("queryMainHome.selectHomeBdnList");
		return list;
	}
	
	public List<HomeEduNowVo> selectHomeEduNow(String userId) {
		List<HomeEduNowVo> list = sqlSession.selectList("queryMainHome.selectHomeEduNow", userId);
		return list;
	}
}