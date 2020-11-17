package com.ibk.itep.common.security.custom;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
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
        
        logger.debug(password);
        logger.debug(user.getPassword());
        
/*        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }*/
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        String role = "ROLE_" + user.getAuthorities().toString().replace("[", "").replace("]", "");
        logger.debug("권한 : " + role);
        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority(role));
        logger.debug("GrantedAuthority 권한 : " + roles.toString());
        return new UsernamePasswordAuthenticationToken(username, password, roles);
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
/*    private boolean matchPassword(String loginPwd, String password) {
        return true;
    }*/
 
}