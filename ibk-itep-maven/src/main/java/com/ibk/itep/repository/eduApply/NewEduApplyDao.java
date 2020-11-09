package com.ibk.itep.repository.eduApply;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.TestVO;
import com.ibk.itep.vo.board.ArchieveVo;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Repository
public class NewEduApplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean InsertNewEdu(NewEduApplyVo vo) {
		int count = sqlSession.insert("queryLes.InsertNewEdu", vo);
		return count == 1;
	}

}
