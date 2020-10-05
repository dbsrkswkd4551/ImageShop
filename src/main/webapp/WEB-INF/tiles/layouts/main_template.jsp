<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
    <title><tiles:getAsString name="title" /></title>
</head>

<script src="/js/jQuery-2.1.4.min.js"></script>

<body>

<!-- 회원 가입 -->
<tiles:insertAttribute name="header" />

<!-- 홈 -->
<tiles:insertAttribute name="menu" />

<div align="center">
    <!-- tiles.xml에서 name= content를 가져온다 -->
<tiles:insertAttribute name="content" />
</div>

<!-- ALL RIGHT RESERVED -->
<tiles:insertAttribute name="footer" />

</body>
</html>
