<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title><tiles:getAsString name="title2" /></title>
</head>

<script src="/js/jQuery-2.1.4.min.js"></script>

<body>

<!-- 회원 가입 -->
<tiles:insertAttribute name="header" />

<!-- 홈 -->
<tiles:insertAttribute name="menu" />

<div>
    <tiles:insertAttribute name="content" />
</div>

<!-- ALL RIGHT RESERVED -->
<tiles:insertAttribute name="footer" />

</body>
</html>
