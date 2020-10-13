<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    <!-- spring:message를 통해 메시지 프로퍼티 파일로부터 메시지 내용을 읽어온다
     일반 html 태그로도 대체 가능-->
    <h3>
    <spring:message code="common.homeWelcome"/>
    </h3>
<!--
<p>${serverTime}.</p>
-->
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function (){
        realTimer();

        setInterval(realTimer, 500);
    });

    function realTimer(){
        const nowDate = new Date();
        const year = nowDate.getFullYear();
        const month = nowDate.getMonth() + 1;
        const date = nowDate.getDate();
        const day = nowDate.getDay();
        const hour = nowDate.getHours();
        const min = nowDate.getMinutes();
        const sec = nowDate.getSeconds();
        document.getElementById("nowTimes").innerHTML =
            year + "년 " + addzero(month) + "월 " + addzero(date) + "일 " + hour + ":" + addzero(min) + ":" + addzero(sec);
    }
    function addzero(num) {
        if(num < 10) {num = "0" + num;}
        return num;
    }
</script>

<h3><span id="nowTimes"></span> </h3>