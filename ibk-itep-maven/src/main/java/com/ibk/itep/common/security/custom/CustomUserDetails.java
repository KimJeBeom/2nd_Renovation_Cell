package com.ibk.itep.common.security.custom;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
    
    private String user_id;
    private String PASSWORD;
    private String athr_cd;
    private boolean ENABLED;
    private String user_nm;
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(athr_cd));
        return auth;
    }
 
    public void setpassword(String password) {
    	PASSWORD = user_id;
    }
    
    @Override
    public String getPassword() {
        return PASSWORD;
    }
 
    @Override
    public String getUsername() {
        return user_id;
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return true;
    }
    
    public String getuser_nm() {
        return user_nm;
    }
 
    public void setuser_nm(String username) {
    	user_nm = username;
    }
 
}