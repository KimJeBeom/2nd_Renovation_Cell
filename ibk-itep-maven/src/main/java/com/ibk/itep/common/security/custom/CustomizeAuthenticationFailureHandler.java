package com.ibk.itep.common.security.custom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomizeAuthenticationFailureHandler implements AuthenticationFailureHandler {
    
    @Autowired
    private BCryptPasswordEncoder new_encoder;
    

    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res,
            org.springframework.security.core.AuthenticationException exception)
throws IOException, ServletException {
        new_encoder = new BCryptPasswordEncoder();
        System.err.println("Login Fail");

//      System.err.println("user_passwd : " + new_encoder.encode(req.getParameter("user_passwd")));
        System.out.println(req.getParameter("user_passwd"));
        
        res.sendRedirect(req.getContextPath() + "/login");
        
//      req.getRequestDispatcher("/login.do").forward(req, res);        
    }
}