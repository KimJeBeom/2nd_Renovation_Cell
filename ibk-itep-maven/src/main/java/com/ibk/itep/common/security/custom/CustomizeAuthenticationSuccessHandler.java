package com.ibk.itep.common.security.custom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(
HttpServletRequest req, HttpServletResponse res, Authentication auth)
            throws IOException, ServletException {
        System.err.println("Login Success");
        res.sendRedirect(req.getContextPath() + "/views");
    }

}