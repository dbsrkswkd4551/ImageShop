<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
    <title><tiles:getAsString name="title" /></title>
</head>

<script src="/js/jQuery-2.1.4.min.js"></script>

<body>
<!-- 회원가입?홈 -->
<tiles:insertAttribute name="header" />

<!--home.jsp-->
<div align="center">
    <tiles:insertAttribute name="content" />
</div>

</body>
</html>
