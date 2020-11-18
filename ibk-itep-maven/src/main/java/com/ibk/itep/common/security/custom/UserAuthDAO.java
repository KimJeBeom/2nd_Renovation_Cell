package com.ibk.itep.common.security.custom;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserAuthDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
 
    public CustomUserDetails getUserById(String user_id) {
        return sqlSession.selectOne("queryLogin.selectUserById", user_id);
    }
 
}