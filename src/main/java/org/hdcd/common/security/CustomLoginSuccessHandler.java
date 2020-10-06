package org.hdcd.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hdcd.common.domain.LoginLog;
import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.common.service.LoginLogService;
import org.hdcd.common.util.NetUtils;
import org.hdcd.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.java.Log;

@Log
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Autowired
    private LoginLogService service;

    //로그인 성공 처리자 메서드
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        CustomUser customUser = (CustomUser)authentication.getPrincipal();
        Member member = customUser.getMember();

        log.info("Userid = " + member.getUserId());

        //로그인에 성공한 사용자의 IP정보와 사용자 정보를 로깅 처리한다

        String remoteAddr = NetUtils.getIp(request);

        log.info("remoteAddr = " + remoteAddr);

        LoginLog loginLog = new LoginLog();

        loginLog.setUserNo(member.getUserNo());
        loginLog.setUserId(member.getUserId());
        loginLog.setRemoteAddr(remoteAddr);

        try{
            service.register(loginLog);
        } catch (Exception e){

        }

        super.onAuthenticationSuccess(request, response, authentication);
    }




}
