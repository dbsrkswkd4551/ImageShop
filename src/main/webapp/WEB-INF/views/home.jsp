<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    <!-- spring:message를 통해 메시지 프로퍼티 파일로부터 메시지 내용을 읽어온다
     일반 html 태그로도 대체 가능-->
    <h3>
    <spring:message code="common.homeWelcome"/>
    </h3>

<p>${serverTime}.</p>

