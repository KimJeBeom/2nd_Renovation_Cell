package com.ibk.itep.common.security.custom;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ibk.itep.controller.HomeController;

public class CustomUserDetailsService implements UserDetailsService {
    
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

	@Autowired
    private UserAuthDAO userAuthDAO;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUserDetails user = userAuthDAO.getUserById(username);
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        
        logger.debug("DB password : " + user.getPassword());
        logger.debug("DB id : " + user.getUsername());
        logger.debug("DB name : " + user.getuser_nm());
        logger.debug("DB auth : " + user.getAuthorities());
        
        return user;
    }
 
}