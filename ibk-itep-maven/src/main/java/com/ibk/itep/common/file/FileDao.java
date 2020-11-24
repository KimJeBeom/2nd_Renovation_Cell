package com.ibk.itep.common.file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDao {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    public int insertFile(List<FileVo> fileVoList) {
        return sqlSession.insert("queryFile.insertFile", fileVoList);
    }

    public int updateFile(int file_no) {
    	return sqlSession.update("queryFile.updateFile", file_no);
    }
    
    public List<FileVo> selectFileList(FileVo fileVo) {
        return sqlSession.selectList("queryFile.selectFileList", fileVo);
    }
    
    public FileVo selectFileInfo(int file_no) {
        return sqlSession.selectOne("queryFile.selectFileInfo", file_no);
    }
 
}