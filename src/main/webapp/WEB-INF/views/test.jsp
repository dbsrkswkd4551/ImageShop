<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
    <link rel="stylesheet" href="/resources/test.css" /> <!-- test.css -->
</head>
<body>
<h2 id = "h2-title" class="point">Ajax Test Page</h2>

<!-- 댓글 목록 -->
<ul id="replies">
</ul>

<!-- 페이지 번호 -->
<ul id="pagination">
</ul>

<div>
    <div>
        작성자 : <input type="text" name="replyer" id="newReplyWriter" />
    </div>
    <div>
        내용 : <textarea name="replytext" id="newReplyText" cols="30" rows="3"></textarea>
    </div>
    <button id="btnReplyAdd" class="btn btn-primary">등록</button>
</div>


<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/test.js"></script> <!-- test.js -->
<script>
    $(function(){
        listPage(1);
    });
</script>
</body>
</html>