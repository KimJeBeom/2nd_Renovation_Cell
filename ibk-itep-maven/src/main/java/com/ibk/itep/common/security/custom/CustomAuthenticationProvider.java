package com.ibk.itep.common.security.custom;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

public class CustomAuthenticationProvider implements AuthenticationProvider {
   
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
    @Autowired
    private UserDetailsService userDeSer;
 
    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        
        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(username);
        
        if(user.getUsername().isEmpty()) {
            throw new CredentialsExpiredException(username);
        }
        
        logger.debug("화면입력 패스워드 : " + password);
        logger.debug("DB입력 패스워드 : " +user.getPassword());
        logger.debug("DB계정사용여부 : " +user.getUse_yn());
        
        if("N".equals(user.getUse_yn())) {
            throw new BadCredentialsException(username);
        }
        
        String role = "ROLE_" + user.getAuthorities().toString().replace("[", "").replace("]", "");
        logger.debug("사용자계정 권한 : " + role);
        
        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority(role));
        logger.debug("GrantedAuthority 사용권한 : " + roles.toString());
        
        return new UsernamePasswordAuthenticationToken(username, password, roles);
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}